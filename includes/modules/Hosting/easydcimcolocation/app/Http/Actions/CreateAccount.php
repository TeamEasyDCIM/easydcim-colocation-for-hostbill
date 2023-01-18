<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\Http\Actions;

use ModulesGarden\Servers\EasyDCIMv2\App\Api\EasyDCIMConfigFactory;
use ModulesGarden\Servers\EasyDCIMv2\App\Helpers\Synchronize;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Adapters\ClientAdapter;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Interfaces\IClient;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Orders\OrderCreate;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Orders\OrderCriteria;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Orders\OrderPart;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Orders\OrderPartContainer;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Orders\OrderService;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Users\UserContainer;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Users\UserDetails;
use ModulesGarden\Servers\EasyDCIMv2\App\Helpers\Emails;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\productConfig\sections\EmailNotifications;

class CreateAccount
{
    /**
     * @var
     */
    protected $module;

    /**
     * @var ClientAdapter
     */
    protected $client;
    /**
     * @var
     */
    protected $params;
    protected $mailer;
    protected $db;
    protected $serverModel;

    /**
     * @param $module
     */
    public function __construct($module,$mailer,$serverModel)
    {
        $this->module = $module;
        $this->mailer = $mailer;
        $this->checkOrderId();
        $this->params = $this->module->getAccount();
        $this->serverModel = $serverModel;
        $this->params['clientsdetails'] = $this->module->getClient();
        $this->params['configoptions'] = $this->module->getAccountConfig();
        $this->client = (new EasyDCIMConfigFactory())->fromParams($this->module->connection,$this->params);
    }

    public function checkOrderId()
    {
        $orderId = $this->module->getAccountDetails()['option4']['value'];
        if ($orderId != '')
        {
            throw new \Exception('The order ID field is not empty');
        }
    }

    /**
     * @return array|null
     */
    public function execute(): ?array
    {
        $orderData = $this->addOrder($this->client);
        return $orderData;
    }

    /**
     * Create new order
     * Save custom fields Order ID, server ID
     *
     * $param $client insteandof ClientAdapter
     *
     */
    private function addOrder(IClient $client)
    {
        $clientID = $this->getClientID($client);

        $criteriaModel = new OrderCriteria();
        $criteriaModel->setModel($client->getModelID())
            ->setLocation($client->getLocationID());

        $serviceModel = new OrderService();
        $serviceModel->setAccessLevel($client->getAcccessLevel());

        $createModel = new OrderCreate();
        $createModel->setModule('Colocation')
            ->setClient($clientID)
            ->setAutoAccept($client->getAutoAccept())
            ->setCriteria($criteriaModel)
            ->setService($serviceModel);

        $api    = new EasyDCIM($client);
        $error = "";
        $orderId = 0;

        $result = $api->order->create($createModel);

        if ($result->status == 'error')
        {
            $error = implode("\n",$result->errors);
            if ($error == '')
            {
                $error = $result->message;
            }
            $orderId = $result->order->id;
        }

        $this->module->updateDetail('OrderID',$orderId);
        $this->module->updateDetail('LastModuleAction','CreateAccount');

        if($error != '') {
            throw new \Exception(ucfirst($error));
        }
        if (!empty($result->service->related_id))
        {
            $this->module->updateDetail('ServerID',$result->service->related_id);
            $createTemplateId = $this->params['options']['CreateServerNotification'];
            $emailTemplates = new EmailNotifications();
            $mail = new Emails($this->mailer);
            $mail->sendServerCreateEmail($client,$emailTemplates->getTemplate($createTemplateId),$this->params['clientsdetails'],$this->params,$this->serverModel->getServerDetails($this->params["server_id"]));
        }
        return [
            'orderId'=>isset($result)?$result->id:$orderId,
            'serverId'=>!empty($result->service->related_id)?$result->service->related_id:'',
            'lastModuleAction'=>'CreateAccount',
        ];
    }

    /**
     * Get Client ID
     *
     * $param $client insteandof ClientAdapter
     * $return integer
     *
     */
    private function getClientID(IClient $client)
    {
        $check = $this->checkUserExists($client);
        if ($check->count == 1)
        {
            return $check->user->id;
        }
        $newUser = $this->createClient($client);
        return $newUser->id;
    }

    /**
     * Check user exsists on Easy DCIM
     *
     * $param $client insteandof ClientAdapter
     * $return JSON object
     *
     */
    private function checkUserExists(IClient $client)
    {
        $userDetails = new UserDetails();
        $userDetails->setEmail($client->getEmail());

        $api = new EasyDCIM($client);
        return $api->user->checkIfExists($userDetails);
    }

    /**
     * Create new EASY DCIM user
     *
     * $param $client insteandof ClientAdapter
     * $return JSON object
     *
     */
    private function createClient(IClient $client)
    {

        $userDetails = new UserDetails();
        $userDetails->setUsername($client->getEmail())
            ->setFirstname($client->getFirstName())
            ->setLastname($client->getLastName())
            ->setEmail($client->getEmail())
            ->setPassword($client->getPassword())
            ->setPasswordConfirmation($client->getPassword())
            ->setCity($client->getCity())
            ->setAddress1($client->getAddress1())
            ->setAddress2($client->getAddress2())
            ->setState($client->getState())
            ->setCountryCode($client->getCountryCode())
            ->setPostcode($client->getPostCode());

        $createUser = new UserContainer();
        $createUser->setData($userDetails)
            ->setRole($this->getUserRole());

        $api = new EasyDCIM($client);
        return $api->user->create($createUser);
    }

    /**
     * Get user role
     *
     * $return integer
     *
     */
    private function getUserRole()
    {
//        $file = Reader::read(ModuleConstants::getModuleRootDir() . DS . 'app' . DS . 'Config' . DS . 'configuration.json');
//        $config =  $file->get();
        return 1;
//        return ($config->base->userRole) ?: 1;
    }
}