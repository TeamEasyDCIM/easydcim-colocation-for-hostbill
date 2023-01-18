<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\UI\client\PowerOutlets\Pages;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Interfaces\IClient;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Devices\Filters;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Devices\DataContainer;

class PowerOutlets
{
    /**
     * @var IClient
     */
    protected $client;
    protected $powerOutlets;

    public function __construct(IClient $client)
    {
        $this->client = $client;
    }

    public function getData(): ?array
    {
        $this->powerOutlets = $this->getOutletList();
        return  $this->prepareData();
    }

    protected function getDevices()
    {
        $api = new EasyDCIM($this->client);
        $filters = new Filters();
        $filters->setTypeID(5)
            ->setColocationID($this->client->getEasyServerID());

        return $api->device->getDevice($filters);
    }


    private function getOutletList()
    {
        $devices = $this->getDevices();
        $outlets = [];
        foreach ($devices as $device)
        {
            $powerOutlets = $this->getPowerPorts($device->id);
            foreach ($powerOutlets as $powerOutlet)
            {
                if ($this->client->getEasyServerID() != $powerOutlet->colocation_id)
                {
                    continue;
                }
                $powerOutlet->deviceName = $device->label . ' (' . $device->model . ')';
                $powerOutlet->deviceID   = $device->id;
                $outlets[]               = $powerOutlet;
            }
        }
        return $outlets;
    }

    private function getPowerPorts($deviceID)
    {
        $api     = new EasyDCIM($this->client);
        return $api->device->getPortList($deviceID);
    }

    /**
     * @return array
     */
    protected function prepareData():array
    {
        $data = [];
        foreach ($this->powerOutlets as $key=>$value)
        {
            $data[] = [
                'id'=>base64_encode(json_encode(['indexID' => $value->id, 'deviceID' => $value->deviceID])),
                'status'=>$value->opstate,
                'number'=>$value->port_number,
                'label'=>$value->description,
                'state'=>$value->opstate,
                'device'=>$value->deviceName,
            ];
        }
        return $data;
    }

    public function changeState($formdata)
    {
        $api      = new EasyDCIM($this->client);
        $ports  = new PowerPorts();

        $ports->setAction($formdata['changeStateSelect'])
            ->setID($formdata['indexID']);
        $dataContainer = new DataContainer();
        $dataContainer->setData($ports);

        $outlets = $api->device->setPower($dataContainer, $formdata['deviceID']);

        if ($outlets->status != "success")
        {
            header('HTTP/1.1 400 Bad Request');
            self::jsonEncode([
                'errors'=>$outlets->message ?: "Change of status not successful"
            ]);
        }
        self::jsonEncode([
            'success'=>'KVM Console Lunched Successfully'
        ]);
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
}