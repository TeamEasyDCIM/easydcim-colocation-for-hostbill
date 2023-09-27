<?php

use Illuminate\Database\Capsule\Manager as DB;
use Illuminate\Database\Connection;
use ModulesGarden\Servers\EasyDCIMv2\App\Api\EasyDCIMConfigFactory;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\productConfig\sections\DefaultOptions;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\productConfig\sections\AutomationSettings;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\productConfig\sections\ClientAreaFeatures;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\productConfig\sections\EmailNotifications;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Pages\Bandwidth;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Pages\Graphs;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Pages\ServiceActions;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Pages\PowerUsageStatistics;
use ModulesGarden\Servers\EasyDCIMv2\App\FileReader\Reader;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Buttons\AutoLoginLink;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\client\Home\Pages\Details;

class easydcimcolocation_controller extends HBController
{
    protected $db;
    protected $hostBillApi;
    protected $serverDetails;
    protected $client;
    protected $api;
    protected $defaultOptions;
    protected $automationSettings;
    protected $clientAreaFeatures;
    protected $emailNotifications;
    protected $configuration;
    protected $lang;
    public $bandwidth;
    public $powerUsageStatistics;
    protected $graphs;
    protected $serviceActions;
    protected $servers;
    protected $autoLoginLink;
    protected $configFieldsModel;
    /**
     * @var Details
     */
    protected $details;

    public function productdetails($params)
    {
        $serverId = $this->getServerId($params['id']);
        if ($serverId != null && $serverId != '')
        {
            $this->configFieldsModel = HBLoader::LoadModel("ConfigFields");
            $serverHelper = HBLoader::LoadModel('Servers');
            $this->servers = $serverHelper->findServersBy('module','easydcimcolocation');
            $this->serverDetails = $this->getServerDetails($this->getServerId($params['id']));
            $this->configuration = $this->module->getOptions()['simple'];
            $this->client = (new EasyDCIMConfigFactory())->fromParams($this->serverDetails);
            $this->api = new EasyDCIM($this->client);
            $this->defaultOptions = new DefaultOptions($this->api);
            $this->automationSettings = new AutomationSettings($this->api);
            $this->clientAreaFeatures = new ClientAreaFeatures($this->api);
            $this->emailNotifications = new EmailNotifications();
            if (isset($_GET['createConfigurableOptions']))
            {
                $this->createConfigurableOptions($params['id']);
            }
            if (isset($_GET['getSettings']))
            {
                $this->additionalParts->getParts($this->parseConfig()->parts);
            }
            $path = APPDIR_MODULES.'Hosting/easydcimcolocation/templates/myproductconfig.tpl';
            $assetsUrl = '.././includes/modules/Hosting/easydcimcolocation/templates/assets';

            $this->template->assign('customconfig',$path);
            $this->template->assign('assetsURL',$assetsUrl);
            $this->template->assign('locationList',$this->defaultOptions->getLocationList());
            $this->template->assign('modelList',$this->defaultOptions->getModelList('Colocation'));
            $this->template->assign('accessLevelList',$this->automationSettings->getAccessLevelList());
            $this->template->assign('adminList',$this->emailNotifications->getAdmins());
            $this->template->assign('adminEmailTemplateList',$this->emailNotifications->getAdminEmailTemplates());
            $this->template->assign('clientEmailTemplateList',$this->emailNotifications->getClientEmailTemplates());
            $this->template->assign('moduleConfiguration',$this->parseConfig());
            $this->template->assign('configurableOptions',$this->configFieldsModel->exportData($params['id']));
            $this->template->assign('productId',$params['id']);
        }

    }

    public function accountdetails($params)
    {
        if ($params['account']['extra_details']['option5'] == '' || $params['account']['extra_details']['option4'] == '' || $params['account']['status'] != 'Active')
        {
            $path = APPDIR_MODULES.'Hosting/easydcimcolocation/templates/source.tpl';
            $assetsUrl = '.././includes/modules/Hosting/easydcimcolocation/templates/assets';

            $this->template->assign('custom_template',$path);
            $this->template->assign('assetsURL',$assetsUrl);
        }else
        {
            $serverHelper = HBLoader::LoadModel('Servers');
            $this->servers = $serverHelper->findServersBy('module','easydcimcolocation');
            $clientModel = HBLoader::LoadModel("Clients");
            $params['account']['clientsdetails'] = $clientModel->getClient($params['account']['client_id']);
            $this->serverDetails = $this->getServerDetails($this->getServerId($params['account']['product_id']));
            $this->client = (new EasyDCIMConfigFactory())->fromParams($this->serverDetails,$params['account']);
            $this->api = new EasyDCIM($this->client);
            $this->bandwidth = new Bandwidth($this->api);
            $this->powerUsageStatistics = new PowerUsageStatistics($this->api);
            $this->graphs = new Graphs($this->api);
            $this->serviceActions = new ServiceActions($this->api,$this->client);
            $this->autoLoginLink = new AutoLoginLink();
            $this->details = new Details($this->api);
//            echo '<pre>';
//            print_r($this->details->getDetailsInformation());
//            die;


            if (isset($_GET['graphs']))
            {
                $this->graphs->manageEasyDCIMGraphs($_GET);
            }
            if (isset($_GET['deviceButtonsAction']))
            {
                $this->serviceActions->manageServiceActions($_GET['deviceButtonsAction']);
            }
            $path = APPDIR_MODULES.'Hosting/easydcimcolocation/templates/adminarea.tpl';
            $assetsUrl = '.././includes/modules/Hosting/easydcimcolocation/templates/assets';

            $this->template->assign('custom_template',$path);
            $this->template->assign('assetsURL',$assetsUrl);
            $this->template->assign('rawObject',$this);
            $this->template->assign('serverInformation',$this->details->getDetailsInformation());
            $this->template->assign('powerUsageStatistics',$this->powerUsageStatistics->getData());
            $this->template->assign('autoLoginLink',$this->autoLoginLink->createRawUrl($this->client));
            $this->template->assign('lang',$lang);
        }

    }

    protected function getServerDetails($serverId):array
    {
        foreach ($this->servers as $key=>$value)
        {
            if ($value['id'] == $serverId)
            {
                $serverConfig = [
                    'secure' => $value['secure'] == '1' ? 'on': '',
                    'ip' => $value['ip'],
                    'host' => $value['host'],
                    'username' => $value['username'],
                    'password' => $value['password'],
                ];
            }
        }

        return $serverConfig;
    }

    protected function getServerId($productId)
    {
        return DB::table('hb_products_modules')->where('product_id','=',$productId)->first()->server;
    }

    protected function updateProductConfig($config,$pid)
    {
        DB::table('hb_products_modules')->where('product_id','=',$pid)->update([
           'options'=>$config
        ]);
    }

    protected function parseConfig()
    {
        foreach($this->configuration as $key=>$value)
        {
            if ($key != 'caTemplates')
            {
                $this->configuration[$key] = $value['value'];

            }else
            {
                foreach ($value['value'] as $key1=>$value1)
                {
                    $values = explode('_',$value1);
                    $value['value'][$key1] = $values[1];
                }
                $this->configuration[$key] = $value['value'];
            }
        }
        return (object)$this->configuration;
    }

    private function getPath()
    {
        return dirname(__DIR__) . DS . 'app' . DS . 'Config' . DS . 'configurableOptions.json';
    }

    private function getConfiguration()
    {
        $file = Reader::read($this->getPath());
        return  $file->get();
    }

    private function createConfigurableOptions($productId)
    {
        $config = $this->getConfiguration();

        foreach ($this->defaultOptions->getLocationList() as $key=>$value)
        {
            $locationItems[] = [
                "id" => $value->id,
                "category_id" => 9,
                "name" => $value->name,
                "variable_id" => $value->id,
            ];
        }
        foreach ($this->defaultOptions->getModelList('Colocation') as $key=>$value)
        {
            $modelItems[] = [
                "id" => $value->id,
                "category_id" => 9,
                "name" => $value->name,
                "variable_id" => $value->id,
            ];
        }

        $config[0]['items'] = $modelItems;
        $config[1]['items'] = $locationItems;

        $c = HBLoader::LoadModel("ConfigFields");
        if($c->getFieldByVar($productId,'model') !== false || $c->getFieldByVar($productId,'location') !== false)
        {
            header('HTTP/1.1 400 Bad Request');
            self::jsonEncode(['error'=>"Configurable Options Were Already Created"]);
        }
        $c->importJson($productId,json_encode($config));
        self::jsonEncode(['success'=>"Configurable Options Created Successfully"]);
    }

    /**
     * @param array $data
     */
    public static function jsonEncode(array $data)
    {
        ob_clean();
        echo(json_encode([
            'data'=>$data
        ]));
        die;
    }

    protected function prepareArrayForConfigOptionPart($name,$variable,$items)
    {
        return [
            'type'=>'searchselect',
            'name'=>$name,
            'variable'=> $variable,
            'ftype'=>'searchselect',
            'premade'=>true,
            'items'=>$items
        ];
    }

    public function __destruct()
    {
        // TODO: Implement __destruct() method.
    }

}