<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\UI\client\Home\Pages;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;

class Details
{
    /**
     * @var EasyDCIM
     */
    protected $api;

    public function __construct($api)
    {
        $this->api = $api;
    }

    public function getDetailsInformation()
    {
        $details = $this->api->device->getInformation();

        return [
          'model'=>$details->model,
          'label'=>$details->label,
          'location'=>$details->location->name,
          'ipaddresses'=>"<div class='overflow'>".implode(',',$details->ip_addresses)."</div>"
        ];
    }
}