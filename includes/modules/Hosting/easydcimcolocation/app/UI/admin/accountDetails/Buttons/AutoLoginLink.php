<?php

namespace ModulesGarden\Servers\EasyDCIMv2\App\UI\admin\accountDetails\Buttons;

use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\EasyDCIM;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Interfaces\IClient;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Users\UserDetails;
use ModulesGarden\Servers\EasyDCIMv2\App\Libs\EasyDCIM\Models\Users\UserLoginData;

class AutoLoginLink
{
    public function createRawUrl(IClient $client)
    {
        $check = $this->checkUserExists($client);
        $link = $this->preapareLink($client, $check->user->id);

        return $link->link;
    }


    /**
     * Check is user exists
     *
     * @param IClient $client insteandof ClientAdapter
     * @return object
     */
    private function checkUserExists(IClient $client)
    {
        $userDetails = new UserDetails();
        $userDetails->setEmail($client->getEmail());
        $api         = new EasyDCIM($client);
        return $api->user->checkIfExists($userDetails);
    }

    /**
     * Get Auto Login link to Easy DCIM
     *
     * @param IClient $client insteandof ClientAdapter, integer $easyClientID
     * @param $easyClientID
     * @return object
     */
    public function preapareLink(IClient $client, $easyClientID)
    {
        $api       = new EasyDCIM($client);

        $userModel = new UserLoginData();
        $userModel->setId($easyClientID)
            ->setEmail($client->getEmail())
            ->setPath('services/');

        return $api->user->getKeyLogin($userModel);
    }
}