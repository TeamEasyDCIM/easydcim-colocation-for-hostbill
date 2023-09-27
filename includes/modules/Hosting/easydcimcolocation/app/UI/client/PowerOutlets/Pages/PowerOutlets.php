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


    private function getOutletList()
    {
        $api = new EasyDCIM($this->client);
        return $api->colocation->showColocationPowerPorts();
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
                'id'=>base64_encode(json_encode(['indexID' => $value->id, 'deviceID' => $value->colocation_id])),
                'status'=>$value->opstate,
                'number'=>$value->port_number,
                'label'=>$value->description,
                'state'=>$value->opstate,
                'device'=>$value->labeledParent,
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