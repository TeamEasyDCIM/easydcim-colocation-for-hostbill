<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\productConfig\sections;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Models\ListWithType;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Os\InstallParams;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Os\Configuration;

class DefaultOptions
{
    /**
     * @var EasyDCIM
     */
    protected $api;

    public function __construct($api)
    {
        $this->api = $api;
    }

    public function getLocationList()
    {
        return $this->api->locations->getLists();
    }

    public function getModelList($type)
    {
        $model = new ListWithType();
        $model->setType($type);
        return $this->api->models->listModelsWithType($model);
    }

    public function getTemplateList()
    {
        return $this->api->os->getTemplateList();
    }

    public function getAddonsList($templateId = null)
    {
        $provisioningServerId = $this->api->os->getOsTemplateForLocation(1)->id;
        $model = new InstallParams();
        if ($templateId != null)
        {
            $model->setFilter([
                'server_id'=>$provisioningServerId,
                'template_id'=>$templateId,
            ]);
        }else{
            $model->setFilter([
                'server_id'=>$provisioningServerId,
            ]);
        }
        $configuration = new Configuration();
        $configuration->setConfiguration($model);
        return $this->api->os->getAddonList($configuration);
    }
}