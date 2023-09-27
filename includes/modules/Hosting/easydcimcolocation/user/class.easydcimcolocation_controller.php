<?php

require_once dirname(__DIR__).DS.'vendor/autoload.php';

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;
use ModulesGarden\Servers\EasyDCIMv2\App\Api\EasyDCIMConfigFactory;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Pages\ServiceActions;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Buttons\AutoLoginLink;
use ModulesGarden\Servers\EasyDCIMv2\App\UI\client\Home\Pages\Details;

class easydcimcolocation_controller extends HBController
{
    public function accountdetails($params)
    {
        $this->serverDetails = $this->module->connection;
        $clientModel = HBLoader::LoadModel("Clients");
        $params['account']['clientsdetails'] = $clientModel->getClient($params['account']['client_id']);
        $this->client = (new EasyDCIMConfigFactory())->fromParams($this->serverDetails,$params['account']);
        $this->api = new EasyDCIM($this->client);
        $this->serviceActions = new ServiceActions($this->api,$this->client);
        $this->details = new Details($this->api);
        $this->autoLoginLink = new AutoLoginLink();

        $assetsUrl = './includes/modules/Hosting/easydcimcolocation/templates/assets';
        if (isset($_GET['deviceButtonsAction']))
        {
            $this->serviceActions->manageServiceActions($_GET['deviceButtonsAction']);
        }
        $this->template->render(APPDIR_MODULES.'Hosting/easydcimcolocation/templates/service_details.tpl');
        $this->template->assign('assetsURL',$assetsUrl);
        $this->template->assign('autoLoginLink',$this->autoLoginLink->createRawUrl($this->client));
        $this->template->assign('details',$this->details->getDetailsInformation());
        $this->template->assign('configuration',$params['account']['options']);
        $this->template->assign('currentTemplate',$_SESSION['AppSettings']['UserTemplate']);

    }
}