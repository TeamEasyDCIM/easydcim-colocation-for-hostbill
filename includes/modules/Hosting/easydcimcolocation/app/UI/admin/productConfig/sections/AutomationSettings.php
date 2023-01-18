<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\productConfig\sections;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;

class AutomationSettings
{
    /**
     * @var EasyDCIM
     */
    protected $api;

    public function __construct($api)
    {
        $this->api = $api;
    }

    public function getAccessLevelList(){
        $accessList = $this->api->service->getAccessLevelList();
        foreach ($this->api->service->getAccessLevelList() as $key=>$value)
        {
            if ($value->type != 'Colocation')
            {
                unset($accessList[$key]);
            }
        }
        return $accessList;
    }
}