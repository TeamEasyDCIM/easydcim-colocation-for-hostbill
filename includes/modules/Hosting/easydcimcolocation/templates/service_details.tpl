{if $currentTemplate eq '2019'}
    {if $custom_template}
        {include file="services/service_upgrades.tpl"}
        {include file=$custom_template}
    {elseif $widget.replacetpl}
        <div class="widget">
            {include file=$widget.replacetpl}
        </div>
    {else}
        <section class="d-flex flex-row flex-wrap align-items-center mb-3">
            <p class="mb-0">
                <i class="material-icons icon-info-color">cloud</i>
                <span class="h2 mb-0 pb-0 ml-3 align-middle">{$service.name}</span>
                {if $service.label!=''}
                    <span class="ml-3 badge badge-secondary badge-styled">{$service.label}</span>
                {/if}
                <span class="ml-3 badge badge-{$service.status}">{$lang[$service.status]}</span>
            </p>
        </section>

        <div class="font-weight-normal m-0 p-0">
            <a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/">
                {if $service.domain}
                    {$service.domain}
                {else}
                    {$service.catname}
                {/if}
            </a>
        </div>

        <section class="section-account section-account-service row {if $service.layout === 'right'} flex-row-reverse {/if}">
            {if $service.layout === 'left' || $service.layout === 'right'}
                <div class="px-0 col-12 col-md-3">
                    <div class="mb-5 {if $service.layout === 'left'}pr-md-3{elseif $service.layout === 'right'}pl-md-5{/if}">
                        <ul class="leftnavigation-box nav flex-column">
                            {include file='services/left_nav_service.tpl' widget_group='sidemenu'}
                        </ul>
                    </div>
                </div>
                <hr class="d-block d-md-none border-light">
            {/if}
            <div class="px-0 col-12 {if $service.layout === 'top'}{else}col-md-9{/if}">
                <div class="w-100">
                    <div class="mb-2 mt-1 cloud d-flex flex-row justify-content-between position-relative align-items-center">
                        {if !$widget.appendtpl}
                            <h4>{$lang.servicedetails}</h4>
                        {else}
                            <div></div>
                        {/if}
                        <ul class="position-relative service-header-menu d-fle flex-row align-items-center" id="vm-menu">
                            {if $service.layout === 'top'}
                                {include file='services/left_nav_service.tpl' widget_group='all'}
                            {else}
                                {include file='services/left_nav_service.tpl' widget_group='apps'}
                            {/if}
                        </ul>
                    </div>
                    {include file="services/service_upgrades.tpl"}
                    {if $widget.appendtpl}
                        <div class="widget">
                            {include file=$widget.appendtpl}
                        </div>
                    {else}
                        {include file='services/service_billing2.tpl'}
                        {if $custom_clientarea}
                            {include file=$custom_clientarea}
                        {/if}
                    {if $widget.appendaftertpl}
                        <div class="widget">
                            {include file=$widget.appendaftertpl}
                        </div>
                    {/if}
                    {if $service.isvpstpl}
                        {include file="services/services.vps.tpl"}
                    {elseif $service.isvps && !$service.isvpstpl}
                        <section class="bordered-section mt-2 service-details">
                            {if $service.bw_limit!='0'}
                                <div class="service-details-line p-4">
                                    <small class="d-block font-weight-bold mb-2">{$lang.bandwidth}</small>
                                    <span class="text-small break-word">{$service.bw_limit} {$lang.gb}</span>
                                </div>
                            {/if}
                            {if $service.disk_limit!='0'}
                                <div class="service-details-line p-4">
                                    <small class="d-block font-weight-bold mb-2">{$lang.disk_limit}</small>
                                    <span class="text-small break-word">{$service.disk_limit} {$lang.gb}</span>
                                </div>
                            {/if}
                            {if $service.guaranteed_ram!='0'}
                                <div class="service-details-line p-4">
                                    <small class="d-block font-weight-bold mb-2">{$lang.memory}</small>
                                    <span class="text-small break-word">{$service.guaranteed_ram} {$lang.mb}</span>
                                </div>
                            {/if}
                            {if $service.burstable_ram!='0'}
                                <div class="service-details-line p-4">
                                    <small class="d-block font-weight-bold mb-2">{$lang.burstable_ram}</small>
                                    <span class="text-small break-word">{$service.burstable_ram}  {$lang.mb}</span>
                                </div>
                            {/if}

                            {if $ipam_ips}
                                {foreach from=$ipam_ips.servers item=serv}
                                    <div class="service-details-line p-4">
                                        <small class="d-block font-weight-bold mb-2">{$lang.ips}</small>
                                        <div class="table-responsive">
                                            <table class="table position-relative stackable">
                                                <tr>
                                                    <td style="padding-left: 0" width="50%"><b>{$lang.ip_subnet}:</b></td>
                                                    <td width="50%">{$serv.subnet}</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 0" width="50%"><b>{$lang.ip_gateway}:</b> </td>
                                                    <td width="50%">{$serv.gateway}</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 0" width="50%"><b>{$lang.main_ip}:</b></td>
                                                    <td width="50%">{if $serv.main_ip}{$serv.main_ip}{else}{$ipam_ips.main_ip}{/if}</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 0" width="50%"><b>{$lang.additionalip}:</b></td>
                                                    <td width="50%">{foreach from=$serv.ips_ranges item=ip}{$ip}<br />{/foreach}</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                {/foreach}
                            {else}
                                <div class="service-details-line p-4">
                                    <small class="d-block font-weight-bold mb-2">{$lang.ipadd}</small>
                                    <span class="text-small break-word">{if $service.vpsip}{$service.vpsip}{else}{$service.ip}{/if}</span>
                                </div>
                                {if $service.additional_ip}
                                    <div class="service-details-line p-4">
                                        <small class="d-block font-weight-bold mb-2">{$lang.additionalip}</small>
                                        <span class="text-small break-word">{foreach from=$service.additional_ip item=ip}{$ip}<br />{/foreach}</span>
                                    </div>
                                {/if}
                            {/if}
                            {if $service.extra_details.ipmi}
                                <!-- ipmi data -->
                                <div class="service-details-line p-4">
                                    {if $service.extra_details.ipmi.vnc}
                                        <div class="mb-3">
                                            <small class="d-block font-weight-bold mb-2">{$lang.urlKVM}</small>
                                            <span class="text-small break-word">
                                                    <a href="{$service_url}&make=openipmi" target="_blank">{$lang.urlKVM}</a>
                                                </span>
                                        </div>
                                    {else}
                                        <div class="mb-3">
                                            <small class="d-block font-weight-bold mb-2">{$lang.urlKVM}</small>
                                            <span class="text-small break-word">{if $service.extra_details.ipmi.ipmiweburl}{$service.extra_details.ipmi.ipmiweburl}{else}{$service.extra_details.ipmi.ipmiweburl}{/if}</span>
                                        </div>
                                        <div class="mb-3">
                                            <small class="d-block font-weight-bold mb-2">{$lang.ipaddressKVM}</small>
                                            <span class="text-small break-word">{if $service.extra_details.ipmi.ipmiip}{$service.extra_details.ipmi.ipmiip}{else}{$service.extra_details.ipmi.ipmiip}{/if}</span>
                                        </div>
                                    {/if}
                                    <div class="mb-3">
                                        <small class="d-block font-weight-bold mb-2">{$lang.usernameKVM}</small>
                                        <span class="text-small break-word">{if $service.extra_details.ipmiuser}{$service.extra_details.ipmiuser}{else}{$service.extra_details.ipmiuser}{/if}</span>
                                    </div>
                                    <div class="mb-3">
                                        <small class="d-block font-weight-bold mb-2">{$lang.passwordKVM}</small>
                                        <span class="text-small break-word"><span style="display:none" id="showpassword">{$service.password}</span> <a href="#" onclick="$(this).hide();$('#showpassword').show();return false;" class="fs11">{$lang.revealpassword}</a></span>
                                    </div>
                                </div>
                            {/if}
                        </section>
                    {/if}
                        {include file='services/service_forms.tpl'}
                    {if $addons || $haveaddons}
                        <div class="d-flex flex-row justify-content-between align-items-center mt-5 mb-3">
                            <h4 class="">{$lang.accaddons|capitalize}</h4>
                            <span>
                            {if $service.status!='Fraud' && $service.status!='Cancelled' && $service.status!='Terminated'}
                                <a href="?cmd=cart&cat_id=addons&account_id={$service.id}" class="btn btn-success btn-sm"><i class="material-icons size-sm">add</i> {$lang.addaddons}</a>
                            {/if}
                        </span>
                        </div>
                        <div class="table-responsive table-borders table-radius">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="w-25">{$lang.addon}</th>
                                    {if $service.showbilling}
                                        {if "acl_user:billing.serviceprices"|checkcondition}
                                            <th>{$lang.price}</th>
                                        {/if}
                                        <th>{$lang.nextdue}</th>
                                        <th >{$lang.status}</th>
                                    {/if}
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$addons item=addon name=foo}
                                    <tr>
                                        <td>
                                            {$addon.name}
                                            {if $addon.info && $addon.status == 'Active'}
                                                <a class="text-danger text-small" href="" onclick="showAddonInfo(this,{$addon.id}); return false;">
                                                    {$lang.moreinfo}
                                                </a>
                                            {/if}
                                        </td>
                                        {if $service.showbilling}
                                            {if "acl_user:billing.serviceprices"|checkcondition}
                                                <td>{$addon.recurring_amount|price:$currency}</td>
                                            {/if}
                                            <td align="center">{$addon.next_due|dateformat:$date_format}</td>
                                            <td align="center" ><span class="badge badge-{$addon.status}">{$lang[$addon.status]}</span></td>
                                        {/if}
                                    </tr>
                                    {if $addon.info && $addon.status == 'Active'}
                                        <tr class="addoninfo_r{$addon.id}" style="display:none">
                                            <td colspan="4">
                                                <div class="pt-2 pb-2">
                                                    {$addon.info|replace:'"':"'"|nl2br}
                                                </div>
                                            </td>
                                        </tr>
                                    {/if}
                                    {foreachelse}
                                    <tr>
                                        <td colspan="4">{$lang.nothing}</td>
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {/if}
                        <link href="{$assetsURL}/css/fonts.css" rel="stylesheet">
                        <link rel="stylesheet" href="{$assetsURL}/css/layers-ui.css">
                        <link rel="stylesheet" href="{$assetsURL}/css/mg_styles.css">
                        <link rel="stylesheet" href="{$assetsURL}/css/select2.css">
                        <script src="{$assetsURL}/js/select2.js"></script>
                        <script src="{$assetsURL}/js/index.js"></script>
                        <script src="{$assetsURL}/js/serviceActions.js"></script>

                        <div id="layers">
                            {if $configuration.AutoLoginLink == 'on'}
                                <div class="lu-col-md-12">
                                    <div class="lu-h5 lu-m-b-3x lu-m-t-2x">{$lang.serverAA.servicePageIntegration.mainContainer.statusWidget.statusWidgetTitle}</div>
                                    <div class="lu-tiles lu-row lu-row--eq-height">
                                        {if $configuration.AutoLoginLink == 'on'}
                                            <div class="lu-col-xs-6 lu-col-md-20p">
                                                <a href="javascript:;" class="lu-tile lu-tile--btn lu-tooltip drop-target drop-abutted drop-abutted-top drop-element-attached-bottom drop-element-attached-center drop-target-attached-top drop-target-attached-center" onclick="generateServiceActionsModal(this,'{$lang.serverAA.adminServicesTabFields.logInToPanelInstance.logInToPanelForm.confirmLogInToPanelInstance}','logIntoPanel')">
                                                    <div class="lu-i-c-6x">
                                                        <img class="serviceActionsImages" src="{$assetsURL}/img/logIntopanel.png" alt="">
                                                    </div>
                                                    <span class="lu-tile__title">{$lang.serverAA.adminServicesTabFields.logInToPanelInstance.modal.logInToPanelInstance}</span>
                                                </a>
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                            {/if}
                            {if $configuration.Model == 'on' || $configuration.Label == 'on' || $configuration.Location == 'on' || $configuration.LabeledRackWithPosition == 'on' || $configuration.IPAddresses == 'on'}
                            <div class="lu-row">
                                <div class="lu-col-md-12">
                                    <div class="lu-widget widgetActionComponent vueDatatableTable">
                                        <div class="lu-widget__header">
                                            <div class="lu-widget__top lu-top">
                                                <div class="lu-top__title">
                                                    {$lang.serverAA.servicePageIntegration.mainContainer.details.tableTitle}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="lu-widget__body">
                                            <div data-table-container="" data-check-container="" class="lu-t-c  datatableLoader">
                                                <div class="dataTables_wrapper no-footer">
                                                    <div>
                                                        <table width="100%" role="grid" class="lu-table lu-table--mob-collapsible dataTable no-footer dtr-column" style="margin-top:0px!important">
                                                            <tbody>
                                                            {if $configuration.Model == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.model}</td>
                                                                    <td>{$details.model}</b></td>
                                                                </tr>
                                                            {/if}

                                                            {if $configuration.Label == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.label}</td>
                                                                    <td>{$details.label}</b></td>
                                                                </tr>
                                                            {/if}

                                                            {if $configuration.Location == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.location}</td>
                                                                    <td>{$details.location}</b></td>
                                                                </tr>
                                                            {/if}

                                                            {if $configuration.LabeledRackWithPosition == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.location.tableField.labeledRackWithPosition}</td>
                                                                    <td>{$details.labeledRackWithPosition}</b></td>
                                                                </tr>
                                                            {/if}

                                                            {if $configuration.IPAddresses == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.ipaddresses}</td>
                                                                    <td>{$details.ipaddresses}</b></td>
                                                                </tr>
                                                            {/if}
                                                            </tbody>
                                                        </table>
                                                        <div class="lu-preloader-container lu-preloader-container--full-screen lu-preloader-container--overlay" style="display: none;">
                                                            <div class="lu-preloader lu-preloader--sm">

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {/if}
                        </div>
                    {/if}
                </div>
            </div>
        </section>
    {literal}
        <script type="text/javascript">
            function showAddonInfo(elem, id) {
                if ($('.addoninfo_r' + id).hasClass('shown')) {
                    $('.addoninfo_r' + id).removeClass('shown').hide();
                    $(elem).html('{/literal}{$lang.moreinfo}{literal}');
                }
                else {
                    $('.addoninfo_r' + id).addClass('shown').show();
                    $(elem).html('{/literal}{$lang.hide}{literal}');
                }
            }
        </script>
    {/literal}
    {/if}
{else}
    {include file="services/service_upgrades.tpl"}




    {if $custom_template}
        {include file=$custom_template}
    {elseif $widget.replacetpl}
        {include file=$widget.replacetpl}

    {else}


        <div class="header-title">
            {if $service.domain!=''}{$service.domain}{/if}
            <h2>{$service.name}</h2>
            <a href="{$ca_url}clientarea/services/{$service.slug}/" class="btn btn-mini backbtn"><i class="icon-chevron-left"></i></a>
        </div>
        <div class="row flex-container bordered-section">

            <div class="span3 left-content flex-box-1">

                {include file='services/service_sidemenu.tpl'}
            </div>


            <div class="span9 right-content flex-box-1">



                <div class="brcrm">
                    <ul class="breadcrumb left">
                        <li><a href="{$ca_url}clientarea/"><strong>{$lang.clientarea}</strong></a> <span class="divider">/</span></li>
                        <li><a href="{$ca_url}clientarea/services/{$service.slug}/"><strong>{$service.catname}</strong></a> <span class="divider">/</span></li>

                        {if $widget} <li><a href="{$ca_url}clientarea/services/{$service.slug}/{$service.id}/"><strong>{$service.name}</strong></a>  <span class="divider">/</span></li>
                            <li class="active">{if $lang[$widget.name]}{$lang[$widget.name]}{elseif $widget.fullname}{$widget.fullname}{else}{$widget.name}{/if}</li>{else}
                            <li class="active">{$service.name}</li>{/if}
                    </ul>


                    <div class="clear"></div>
                </div>



                {if $widget.appendtpl }
                    <div class="p19">
                        {include file=$widget.appendtpl}
                    </div>
                {else}

                    {include file='services/service_billing2.tpl'}

                    {if $custom_clientarea}
                        {include file=$custom_clientarea}
                    {/if}


                {if $service.isvpstpl  }

                    {include file="services/services.vps.tpl"}

                {elseif $service.isvps && !$service.isvpstpl}
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="table table-striped fullscreen">

                        {if $service.bw_limit!='0'}
                            <tr class="even">
                                <td align="right">{$lang.bandwidth}</td>
                                <td>{$service.bw_limit} {$lang.gb}</td>
                            </tr>
                        {/if} {if $service.disk_limit!='0'}
                            <tr>
                                <td align="right">{$lang.disk_limit}</td>
                                <td>{$service.disk_limit} {$lang.gb}</td>
                            </tr>
                        {/if}
                        {if $service.guaranteed_ram!='0'}
                            <tr class="even">
                                <td align="right">{$lang.memory}</td>
                                <td>{$service.guaranteed_ram} {$lang.mb}</td>
                            </tr>   {/if}
                        {if $service.burstable_ram!='0'}
                            <tr>
                                <td align="right">{$lang.burstable_ram}</td>
                                <td>{$service.burstable_ram}  {$lang.mb}</td>
                            </tr>   {/if}

                        {if $ipam_ips}
                            {foreach from=$ipam_ips.servers item=serv}
                                <tr>
                                    <td width="30%" valign="top"><strong>{$lang.ips}</strong></td>
                                    <td width="70%">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td><b>{$lang.ip_subnet}:</b></td>
                                                <td>{$serv.subnet}</td>
                                            </tr>
                                            <tr>
                                                <td><b>{$lang.ip_gateway}:</b> </td>
                                                <td>{$serv.gateway}</td>
                                            </tr>
                                            <tr>
                                                <td><b>{$lang.main_ip}:</b></td>
                                                <td>{$ipam_ips.main_ip}</td>
                                            </tr>
                                            <tr>
                                                <td><b>{$lang.additionalip}:</b></td>
                                                <td>{foreach from=$serv.ips_ranges item=ip}{$ip}<br />{/foreach}</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            {/foreach}
                        {else}
                            <tr>
                                <td><strong>{$lang.ipadd}</strong></td>
                                <td>{if $service.vpsip}{$service.vpsip}{else}{$service.ip}{/if}</td>
                            </tr>
                            {if $service.additional_ip}
                                <tr>
                                    <td valign="top" ><strong>{$lang.additionalip}</strong></td>
                                    <td>{foreach from=$service.additional_ip item=ip}{$ip}<br />{/foreach}</td>
                                </tr>
                            {/if}
                        {/if}
                    </table>
                {/if}


                    {include file='services/service_forms.tpl'}


                {if $addons || $haveaddons}
                    <div class="p19">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#">{$lang.accaddons|capitalize}</a></li>
                        </ul>


                        <table cellspacing="0" cellpadding="0" border="0" width="100%" class="table table-striped table-condensed">
                            <colgroup class="firstcol"></colgroup>
                            <colgroup class="alternatecol"></colgroup>
                            <colgroup class="firstcol"></colgroup>
                            <colgroup class="alternatecol"></colgroup>

                            <tbody>
                            <tr>
                                <th width="40%" align="left">{$lang.addon}</th>
                                {if $service.showbilling} <th align="left">{$lang.price}</th>
                                    <th>{$lang.nextdue}</th>
                                    <th >{$lang.status}</th>{/if}

                            </tr>
                            {foreach from=$addons item=addon name=foo}
                                <tr {if $smarty.foreach.foo.index%2 == 0}class="even"{/if}>
                                    <td>{$addon.name} {if $addon.info && $addon.status == 'Active'}<a href="" onclick="showAddonInfo(this,{$addon.id}); return false;" style="color: red; font-size: 11px">{$lang.moreinfo}</a>{/if}</td>
                                    {if $service.showbilling}<td>{$addon.recurring_amount|price:$currency}</td>
                                        <td align="center">{$addon.next_due|dateformat:$date_format}</td>
                                        <td align="center" ><span class="label label-{$addon.status}">{$lang[$addon.status]}</span></td>{/if}

                                </tr>
                                {if $addon.info && $addon.status == 'Active'}
                                    <tr class="addoninfo_r{$addon.id} {if $smarty.foreach.foo.index%2 == 0} even{/if}" style="display:none">
                                        <td colspan="4"> <div style="padding: 10px">
                                                {$addon.info|replace:'"':"'"|nl2br}</div>
                                        </td>
                                    </tr>
                                {/if}
                                {foreachelse}
                                <tr><td colspan="4">{$lang.nothing}</td></tr>
                            {/foreach}
                            </tbody>

                        </table>

                        {if $service.status!='Fraud' && $service.status!='Cancelled' && $service.status!='Terminated'}{$service.id|string_format:$lang.clickaddaddons}{/if}



                    </div>
                {/if}
                    <link href="{$assetsURL}/css/fonts.css" rel="stylesheet">
                    <link rel="stylesheet" href="{$assetsURL}/css/layers-ui.css">
                    <link rel="stylesheet" href="{$assetsURL}/css/mg_styles.css">
                    <link rel="stylesheet" href="{$assetsURL}/css/select2.css">
                    <script src="{$assetsURL}/js/select2.js"></script>
                    <script src="{$assetsURL}/js/index.js"></script>
                    <script src="{$assetsURL}/js/serviceActions.js"></script>

                    <div id="layers">
                        {if $configuration.AutoLoginLink == 'on'}
                            <div class="lu-col-md-12">
                                <div class="lu-h5 lu-m-b-3x lu-m-t-2x">{$lang.serverAA.servicePageIntegration.mainContainer.statusWidget.statusWidgetTitle}</div>
                                <div class="lu-tiles lu-row lu-row--eq-height">
                                    {if $configuration.AutoLoginLink == 'on'}
                                        <div class="lu-col-xs-6 lu-col-md-20p">
                                            <a href="javascript:;" class="lu-tile lu-tile--btn lu-tooltip drop-target drop-abutted drop-abutted-top drop-element-attached-bottom drop-element-attached-center drop-target-attached-top drop-target-attached-center" onclick="generateServiceActionsModal(this,'{$lang.serverAA.adminServicesTabFields.logInToPanelInstance.logInToPanelForm.confirmLogInToPanelInstance}','logIntoPanel')">
                                                <div class="lu-i-c-6x">
                                                    <img class="serviceActionsImages" src="{$assetsURL}/img/logIntopanel.png" alt="">
                                                </div>
                                                <span class="lu-tile__title">{$lang.serverAA.adminServicesTabFields.logInToPanelInstance.modal.logInToPanelInstance}</span>
                                            </a>
                                        </div>
                                    {/if}
                                </div>
                            </div>
                        {/if}
                        {if $configuration.Model == 'on' || $configuration.Label == 'on' || $configuration.Location == 'on' || $configuration.LabeledRackWithPosition == 'on' || $configuration.IPAddresses == 'on'}
                            <div class="lu-row">
                                <div class="lu-col-md-12">
                                    <div class="lu-widget widgetActionComponent vueDatatableTable">
                                        <div class="lu-widget__header">
                                            <div class="lu-widget__top lu-top">
                                                <div class="lu-top__title">
                                                    {$lang.serverAA.servicePageIntegration.mainContainer.details.tableTitle}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="lu-widget__body">
                                            <div data-table-container="" data-check-container="" class="lu-t-c  datatableLoader">
                                                <div class="dataTables_wrapper no-footer">
                                                    <div>
                                                        <table width="100%" role="grid" class="lu-table lu-table--mob-collapsible dataTable no-footer dtr-column" style="margin-top:0px!important">
                                                            <tbody>
                                                            {if $configuration.Model == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.model}</td>
                                                                    <td>{$details.model}</b></td>
                                                                </tr>
                                                            {/if}

                                                            {if $configuration.Label == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.label}</td>
                                                                    <td>{$details.label}</b></td>
                                                                </tr>
                                                            {/if}

                                                            {if $configuration.Location == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.location}</td>
                                                                    <td>{$details.location}</b></td>
                                                                </tr>
                                                            {/if}

                                                            {if $configuration.LabeledRackWithPosition == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.location.tableField.labeledRackWithPosition}</td>
                                                                    <td>{$details.labeledRackWithPosition}</b></td>
                                                                </tr>
                                                            {/if}

                                                            {if $configuration.IPAddresses == 'on'}
                                                                <tr role="row">
                                                                    <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.ipaddresses}</td>
                                                                    <td>{$details.ipaddresses}</b></td>
                                                                </tr>
                                                            {/if}
                                                            </tbody>
                                                        </table>
                                                        <div class="lu-preloader-container lu-preloader-container--full-screen lu-preloader-container--overlay" style="display: none;">
                                                            <div class="lu-preloader lu-preloader--sm">

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/if}
                    </div>


                {/if}
            </div>

        </div>
    {/if}

{literal}

    <script type="text/javascript">
        function showAddonInfo(elem,id) {
            if($('.addoninfo_r'+id).hasClass('shown')) {
                $('.addoninfo_r'+id).removeClass('shown').hide();
                $(elem).html('{/literal}{$lang.moreinfo}{literal}');}
            else {
                $('.addoninfo_r'+id).addClass('shown').show();
                $(elem).html('{/literal}{$lang.hide}{literal}');
            }
        }
    </script>            {/literal}
{/if}
