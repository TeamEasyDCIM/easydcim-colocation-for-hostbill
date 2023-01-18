<link href="{$assetsURL}/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="{$assetsURL}/css/layers-ui.css">
<link rel="stylesheet" href="{$assetsURL}/css/mg_styles.css">
<link rel="stylesheet" href="{$assetsURL}/css/select2.css">
<script src="{$assetsURL}/js/select2.js"></script>
<script src="{$assetsURL}/js/index.js"></script>
<script src="{$assetsURL}/js/powerOutlets.js"></script>
<div id="layers">
    <div class="lu-row">
        <div class="lu-col-md-12">
            <div class="lu-widget widgetActionComponent vueDatatableTable">
                <div class="lu-widget__header">
                    <div class="lu-widget__top lu-top">
                        <div class="lu-top__title">
                            {$lang.serverAA.servicePageIntegration.mainContainer.powerOutlets.powerOutlets}
                        </div>
                    </div>
                </div>
                <div class="lu-widget__body">
                    <div data-table-container="" data-check-container=""
                         class="lu-t-c  datatableLoader">
                        <div class="dataTables_wrapper no-footer">
                            <div>
                                <table width="100%" role="grid"
                                       class="lu-table lu-table--mob-collapsible dataTable no-footer dtr-column">
                                    <thead>
                                    <tr role="row">
                                        <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.powerOutlets.tableField.status}</span></th>
                                        <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.powerOutlets.tableField.number}</span></th>
                                        <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.powerOutlets.tableField.label}</span></th>
                                        <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.powerOutlets.tableField.state}</span></th>
                                        <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.powerOutlets.tableField.device}</span></th>
                                        <th class="mgTableActionsHeader"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach from=$rawObject->powerOutlets->getData() key=myId item=i}
                                        <tr id="{$i.id}" role="row">
                                            <td>{if $i.status == 'outletOn' }<span style="color: green; "><i class="fa fa-check-circle fa-2x"></i></span>{else}<span style="color: red; "><i class="fa fa-times-circle fa-2x"></i></span>{/if}</td>
                                            <td>{$i.number}</td>
                                            <td>{$i.label}</td>
                                            <td>{$lang.serverAA.servicePageIntegration.mainContainer.powerOutlets.tableField[$i.state]}</td>
                                            <td>{$i.device}</td>
                                            <td><a href="javascript:;" onclick="loadChangeStateModal('{$i.id}')" data-toggle="lu-tooltip" class="lu-btn lu-btn--link lu-btn--plain lu-btn--default lu-tooltip drop-target" data-title="Change State"><i class="lu-btn__icon lu-zmdi lu-zmdi-edit"></i></a></td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                                <div class="lu-preloader-container lu-preloader-container--full-screen lu-preloader-container--overlay"
                                     style="display: none;">
                                    <div class="lu-preloader lu-preloader--sm"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>