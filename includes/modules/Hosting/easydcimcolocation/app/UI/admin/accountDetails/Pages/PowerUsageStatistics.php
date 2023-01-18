<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Pages;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;

class PowerUsageStatistics
{
    /**
     * @var EasyDCIM
     */
    protected $api;

    public function __construct($api)
    {
        $this->api = $api;
    }

    public function getData(): ?array
    {
        $this->powerUsage = $this->api->device->getPowerUsage();
        return  $this->prepareData();
    }


    /**
     * @return array
     */
    protected function prepareData():array
    {
        $data = [];
        foreach ($this->powerUsage as $key=>$value)
        {
            switch ($key) {
                case 'last_1hour':
                    $interval = 'Last Hour';
                    break;
                case 'last_6hours':
                    $interval = 'Last 6 Hours';
                    break;
                case 'last_1day':
                    $interval = 'Last Day';
                    break;
                case 'last_2days':
                    $interval = 'Last Two Days';
                    break;
                case 'last_1week':
                    $interval = 'Last Week';
                    break;
                case 'last_1month':
                    $interval = 'Last Month';
                    break;
                case 'last_6months':
                    $interval = 'Last Six Months';
                    break;
                case 'last_1year':
                    $interval = 'Last Year';
                    break;
                case 'current_month':
                    $interval = 'Current Month';
                    break;
            }

            $data[] = [
                'powerUsageInterval'=>$interval,
                'AVG_TOTAL_USAGE'=>$value->AVG_TOTAL_USAGE,
            ];
        }
        return $data;
    }
}