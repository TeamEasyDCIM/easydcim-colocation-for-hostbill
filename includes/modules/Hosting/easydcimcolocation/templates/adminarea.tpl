<link href="{$assetsURL}/css/fonts.css" rel="stylesheet">
<link rel="stylesheet" href="{$assetsURL}/css/layers-ui.css">
<link rel="stylesheet" href="{$assetsURL}/css/mg_styles.css">
<link rel="stylesheet" href="{$assetsURL}/css/select2.css">
<script src="{$assetsURL}/js/select2.js"></script>
<script src="{$assetsURL}/js/index.js"></script>
<script src="{$assetsURL}/js/showcustomfn.js"></script>
<script src="{$assetsURL}/js/chart.js"></script>
<script src="{$assetsURL}/js/chartjs-adapter-date-fns.bundle.min.js"></script>
<script src="{$assetsURL}/js/aggregateTraffic.js"></script>
<script src="{$assetsURL}/js/powerUsage.js"></script>

<ul class="accor">
    <li>
        <a href="#">{$lang.serverAA.servicePageIntegration.mainContainer.statusWidget.statusWidget}</a>
        <div class="sor">
            <div id="layers">
                <div class="lu-col-md-12">
                    <div class="lu-h5 lu-m-b-3x lu-m-t-2x">{$lang.serverAA.servicePageIntegration.mainContainer.statusWidget.statusWidgetTitle}</div>
                    <div class="lu-tiles lu-row lu-row--eq-height">
                        <div class="lu-col-xs-6 lu-col-md-20p">
                            <a href="javascript:;" class="lu-tile lu-tile--btn lu-tooltip drop-target drop-abutted drop-abutted-top drop-element-attached-bottom drop-element-attached-center drop-target-attached-top drop-target-attached-center" onclick="generateModal(this,'{$lang.serverAA.adminServicesTabFields.logInToPanelInstance.logInToPanelForm.confirmLogInToPanelInstance}','logIntoPanel')">
                                <div class="lu-i-c-6x">
                                    <img class="serviceActionsImages" src="{$assetsURL}/img/logIntopanel.png" alt="">
                                </div>
                                <span class="lu-tile__title">{$lang.serverAA.adminServicesTabFields.logInToPanelInstance.modal.logInToPanelInstance}</span>
                            </a>
                        </div>
                    </div>
                </div>
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
                                                <tr role="row">
                                                        <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.model}</td>
                                                        <td>{$serverInformation.model}</b></td>
                                                    </tr>
                                                    <tr role="row">
                                                        <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.label}</td>
                                                        <td>{$serverInformation.label}</b></td>
                                                    </tr>
                                                    <tr role="row">
                                                        <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.location}</td>
                                                        <td>{$serverInformation.location}</b></td>
                                                    </tr>
                                                    <tr role="row">
                                                        <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.location.tableField.labeledRackWithPosition}</td>
                                                        <td>{$serverInformation.labeledRackWithPosition}</b></td>
                                                    </tr>
                                                    <tr role="row">
                                                        <td class="informationTablesWidth">{$lang.serverAA.servicePageIntegration.mainContainer.details.tableField.ipaddresses}</td>
                                                        <td>{$serverInformation.ipaddresses}</b></td>
                                                    </tr>
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
                <div class="lu-row">
                    <div class="lu-col-md-12">
                        <div class="lu-widget widgetActionComponent vueDatatableTable">
                            <div class="lu-widget__header">
                                <div class="lu-widget__top lu-top">
                                    <div class="lu-top__title">
                                        {$lang.serverAA.servicePageIntegration.mainContainer.bandwidthTable.bandwidthTable}
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
                                                        <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.bandwidthTable.table.bandwidthInterval}</span></th>
                                                        <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.bandwidthTable.table.bandwidthIn}</span></th>
                                                        <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.bandwidthTable.table.bandwidthOut}</span></th>
                                                        <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.bandwidthTable.table.bandwidthTotal}</span></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                {foreach from=$rawObject->bandwidth->getData() key=myId item=i}
                                                    <tr role="row">
                                                        <td>{$i.bandwidthInterval}</td>
                                                        <td>{$i.bandwidthIn}</td>
                                                        <td>{$i.bandwidthOut}</td>
                                                        <td>{$i.bandwidthTotal}</td>
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
                <div class="lu-row">
                    <div class="lu-col-md-12">
                        <div class="lu-widget widgetActionComponent vueDatatableTable">
                            <div class="lu-widget__header">
                                <div class="lu-widget__top lu-top">
                                    <div class="lu-top__title">
                                        {$lang.serverAA.servicePageIntegration.mainContainer.powerUsageStatisticsTable.powerUsageStatisticsTable}
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
                                                    <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.powerUsageStatisticsTable.table.powerUsageInterval}</span></th>
                                                    <th><span class="lu-table__text">{$lang.serverAA.servicePageIntegration.mainContainer.powerUsageStatisticsTable.table.AVG_TOTAL_USAGE}</span></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                {foreach from=$powerUsageStatistics key=myId item=i}
                                                    <tr role="row">
                                                        <td>{$i.powerUsageInterval}</td>
                                                        <td>{$i.AVG_TOTAL_USAGE}</td>
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
                <div class="lu-row">
                    <div class="lu-col-md-12">
                        <div class="lu-widget">
                            <div class="lu-widget__header">
                                <div class="lu-widget__top lu-top">
                                    <div class="lu-top__title">
                                        {$lang.serverAA.servicePageIntegration.mainContainer.aggregateTraffic.title}
                                    </div>
                                    <div class="lu-top__toolbar">
                                        <a data-toggle="modal" data-target="#aggregateModal">
                                            <i class="lu-btn__icon lu-zmdi lu-zmdi-edit"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="lu-widget__body">
                                <canvas id="aggregateTraffic" style="height: 400px;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="lu-row">
                    <div class="lu-col-md-12">
                        <div class="lu-widget">
                            <div class="lu-widget__header">
                                <div class="lu-widget__top lu-top">
                                    <div class="lu-top__title">
                                        {$lang.serverAA.servicePageIntegration.mainContainer.powerUsageGraph.title}
                                    </div>
                                    <div class="lu-top__toolbar">
                                        <a data-toggle="modal" data-target="#powerUsageGraphModal">
                                            <i class="lu-btn__icon lu-zmdi lu-zmdi-edit"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="lu-widget__body">
                                <canvas id="powerUsageGraph" style="height: 400px;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </li>
</ul>

<!-- Modals -->
<div class="modal fade" id="powerUsageGraphModal" tabindex="-1" role="dialog" aria-labelledby="powerUsageGraphModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="powerUsageGraphModalLabel">Scope <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button></h5>
            </div>
            <div class="modal-body">
                <select id="scope2" class="mg-select2">
                    <option value="td">{$lang.serverAA.adminServicesTabFields.today}</option>
                    <option value="yd">{$lang.serverAA.adminServicesTabFields.yesterday}</option>
                    <option value="tw">{$lang.serverAA.adminServicesTabFields.this_1week}</option>
                    <option value="lw">{$lang.serverAA.adminServicesTabFields.last_1week}</option>
                    <option value="tm">{$lang.serverAA.adminServicesTabFields.this_1month}</option>
                    <option value="lm">{$lang.serverAA.adminServicesTabFields.last_1month}</option>
                    <option value="ty">{$lang.serverAA.adminServicesTabFields.this_1year}</option>
                    <option value="ly">{$lang.serverAA.adminServicesTabFields.last_1year}</option>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="reloadPowerUsageGraphModal" data-dismiss="modal">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="aggregateModal" tabindex="-1" role="dialog" aria-labelledby="aggregateModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="aggregateModalLabel">Scope <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button></h5>
            </div>
            <div class="modal-body">
                <select id="scope3" class="mg-select2">
                    <option value="td">{$lang.serverAA.adminServicesTabFields.today}</option>
                    <option value="yd">{$lang.serverAA.adminServicesTabFields.yesterday}</option>
                    <option value="tw">{$lang.serverAA.adminServicesTabFields.this_1week}</option>
                    <option value="lw">{$lang.serverAA.adminServicesTabFields.last_1week}</option>
                    <option value="tm">{$lang.serverAA.adminServicesTabFields.this_1month}</option>
                    <option value="lm">{$lang.serverAA.adminServicesTabFields.last_1month}</option>
                    <option value="ty">{$lang.serverAA.adminServicesTabFields.this_1year}</option>
                    <option value="ly">{$lang.serverAA.adminServicesTabFields.last_1year}</option>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="reloadAggregateTraffic" data-dismiss="modal">Save changes</button>
            </div>
        </div>
    </div>
</div>
<!-- Modals -->