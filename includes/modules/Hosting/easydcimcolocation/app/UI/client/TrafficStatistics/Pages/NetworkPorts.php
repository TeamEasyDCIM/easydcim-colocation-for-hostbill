<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\UI\client\TrafficStatistics\Pages;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;

class NetworkPorts
{
    /**
     * @var EasyDCIM
     */
    protected $api;
    protected $networkPorts;

    public function __construct($api)
    {
        $this->api = $api;
    }

    public function getData(): ?array
    {
        $this->networkPorts = $this->api->colocation->showColocationNetworkPorts();
        return  $this->prepareData();
    }

    /**
     * @return array
     */
    protected function prepareData():array
    {
        $data = [];
        foreach ($this->networkPorts as $key=>$value)
        {
            $data[] = [
                'label'=>$value->port_label,
                'device'=>$value->labeledConnectedItem,
                'last_hour_traffic'=>$value->traffic_history->last_1hour,
                'last_day_traffic'=>$value->traffic_history->last_1day,
                'last_month_traffic'=>$value->traffic_history->last_1month,
            ];
        }
        return $data;
    }
}