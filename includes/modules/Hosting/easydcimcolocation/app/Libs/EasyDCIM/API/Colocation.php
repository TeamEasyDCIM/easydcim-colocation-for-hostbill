<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\API;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Abstracts\AbstractEasyDCIMAPI;

class Colocation extends AbstractEasyDCIMAPI
{
    /**
     * EasyDCIM Device - Show device information
     * @documentation https://www.easydcim.com/api/index.html#api-Device-Retrieve
     * @return object
     * @throws string error
     */
    public function showColocationNetworkPorts()
    {
        return $this->api->get()->execut('colocation/' . $this->params->getEasyServerID().'/network-ports');
    }

    /**
     * EasyDCIM Device - Show device information
     * @documentation https://www.easydcim.com/api/index.html#api-Device-Retrieve
     * @return object
     * @throws string error
     */
    public function getInformation()
    {
        return $this->api->get()->execut('colocation/' . $this->params->getEasyServerID());
    }
}