<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\Helpers;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Adapters\ClientAdapter;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\productConfig\sections\EmailNotifications;

class Synchronize
{
    /**
     * @var EasyDCIM
     */
    protected $api;

    /**
     * @var ClientAdapter
     */
    protected $client;
    protected $module;
    protected $mailer;
    protected $db;

    public function __construct($client,$module,$mailer)
    {
        $this->api = new EasyDCIM($client);
        $this->client = $client;
        $this->module = $module;
        $this->mailer = $mailer;
    }

    public function synchronize($clientData,$server)
    {
        $info = $this->getOrderInformation($this->client->getEasyOrderID());
        if (!empty($info->service->related_id) && $this->module->getDetail('ServerID') == '')
        {
            $this->module->updateDetail('ServerID',$info->service->related_id);
            $account = $this->module->getAccount();
            $createTemplateId = $account['options']['CreateServerNotification'];
            $emailTemplates = new EmailNotifications();
            $mail = new Emails($this->mailer);
            $mail->sendServerCreateEmail($this->client,$emailTemplates->getTemplate($createTemplateId),$clientData,$account,$server);
            $this->module->changeAccountStatus('Active');
        }
    }

    protected function getOrderInformation($orderId = null)
    {
        return $this->api->order->getOrder($orderId);
    }
}