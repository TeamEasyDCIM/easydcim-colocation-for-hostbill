<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Pages;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Interfaces\IClient;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Users\UserDetails;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Users\UserLoginData;

class ServiceActions
{

    /**
     * @var EasyDCIM
     */
    protected $api;

    /**
     * @var IClient
     */
    protected $client;

    public function __construct($api,$client)
    {
        $this->api = $api;
        $this->client = $client;
    }

    public function manageServiceActions($action)
    {
        try {
            switch ($action) {
                case "logIntoPanel":
                    try {
                        $check = $this->checkUserExists($this->client);
                        if (!empty($check->user->id))
                        {
                            $link = $this->prepareLink($this->client, $check->user->id);
                        }
                        else
                        {
                            throw new \Exception('Account Not Exist');
                        }

                        self::jsonEncode([
                            'success'=>'You have been redirected correctlly',
                            'url'=>$link->link
                        ]);
                    }catch(\Exception $e)
                    {
                        header('HTTP/1.1 400 Bad Request');
                        self::jsonEncode([
                            'errors'=>$e->getMessage()
                        ]);
                    }

                    break;
            }



        } catch (\RuntimeException $e) {
        }
        return '';
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

    /**
     * Check is user exists
     *
     * @param IClient $client insteandof ClientAdapter
     */
    private function checkUserExists(IClient $client)
    {
        $userDetails = new UserDetails();
        $userDetails->setEmail($client->getEmail());

        return $this->api->user->checkIfExists($userDetails);
    }

    /**
     * Get Auto Login link to Easy DCIM
     *
     * @param IClient $client insteandof ClientAdapter, integer $easyClientID
     * @param $easyClientID
     */
    public function prepareLink(IClient $client, $easyClientID)
    {
        $userModel = new UserLoginData();
        $userModel->setId($easyClientID)
            ->setEmail($client->getEmail())
            ->setPath('services/' . $this->getServiceID() . '/summary');

        return $this->api->user->getKeyLogin($userModel);
    }

    public function getServiceID()
    {
        $device = $this->api->device->getInformation();

        return $device->order->service->id;
    }
}