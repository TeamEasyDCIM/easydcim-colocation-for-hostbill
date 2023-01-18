<?php

require_once dirname(__DIR__,2).DS.'vendor/autoload.php';

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Adapters\ClientAdapter;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;
use ModulesGarden\Servers\EasyDCIMv2\App\Api\EasyDCIMConfigFactory;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Pages\Graphs;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Pages\Bandwidth;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\client\TrafficStatistics\Pages\NetworkPorts;

class widget_trafficstatistics extends HostingWidget
{
    protected $widgetfullname = 'Traffic Statistics';
    protected $config = ["smallimg" => "includes/modules/Hosting/easydcimcolocation/widgets/trafficstatistics/small.png","bigimg" => "includes/modules/Hosting/easydcimcolocation/widgets/trafficstatistics/big.png"];

    /**
     * @var ClientAdapter
     */
    protected $client;
    /**
     * @var
     */
    protected $params;
    protected $api;

    protected function setIconConfig()
    {
        $default = function ($filename) {
            return $filename;
        };
        if (!$this->config["smallimg"]) {
            $p = $this->getWidgetURIPath() . "/";
            $this->config["smallimg"] = $p . "small.png";
        }
        if (!$this->config["bigimg"]) {
            if (!$p) {
                $p = $this->getWidgetURIPath() . "/";
            }
            $this->config["bigimg"] = $p . "big.png";
        }
        $this->config["smallimg"] = $default($this->config["smallimg"]);
        $this->config["bigimg"] = $default($this->config["bigimg"]);
    }

    /**
     * HostBill will call this function when widget is visited from clientarea
     * @param HostingModule $module Your provisioning module object
     * @return array|string
     */
    public function clientFunction(&$module) {
        $this->params = $module->getAccount();
        if ($this->params['options']['TrafficStatistics'] != 'on')
        {
            return 'This page is disabled';
        }
        $this->params['clientsdetails'] = $module->getClient();
        $this->client = (new EasyDCIMConfigFactory())->fromParams($module->connection,$this->params);
        $this->api = new EasyDCIM($this->client);
        $this->graphs = new Graphs($this->api);
        $this->bandwidth = new Bandwidth($this->api);
        $this->networkPorts = new NetworkPorts($this->api);
        if (isset($_GET['graphs']))
        {
            $this->graphs->manageEasyDCIMGraphs($_GET);
        }
        $assetsUrl = './includes/modules/Hosting/easydcimcolocation/templates/assets';
        $variables = [
            'assetsURL'=>  $assetsUrl,
            'rawObject'=>  $this,
        ];
        return array('trafficStatistics.tpl', $variables);
    }
}