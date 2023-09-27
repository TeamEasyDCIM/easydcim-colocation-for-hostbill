<link href="{$assetsURL}/css/fonts.css" rel="stylesheet">
<link rel="stylesheet" href="{$assetsURL}/css/layers-ui.css">
<link rel="stylesheet" href="{$assetsURL}/css/mg_styles.css">
<link rel="stylesheet" href="{$assetsURL}/css/select2.css">
<script src="{$assetsURL}/js/select2.js"></script>
<script src="{$assetsURL}/js/index.js"></script>
<script src="{$assetsURL}/js/chart.js"></script>
<script src="{$assetsURL}/js/chartjs-adapter-date-fns.bundle.min.js"></script>
<script src="{$assetsURL}/js/powerUsage.js"></script>
<div id="layers">
    {if $configuration.BlockPowerUsageTable != 'on'}
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
                                        {foreach from=$rawObject->powerUsageStatistics->getData() key=myId item=i}
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
    {/if}
    {if $configuration.PowerUsageStatisticsGraph == 'on'}
        <div class="lu-row">
            <div class="lu-col-md-12">
                <div class="lu-widget">
                    <div class="lu-widget__header">
                        <div class="lu-widget__top lu-top">
                            <div class="lu-top__title">
                                {$lang.serverAA.servicePageIntegration.mainContainer.powerUsageGraph.title}
                            </div>
                            <div class="lu-top__toolbar">
                                <a onclick="showModal()" data-toggle="modal" data-target="#powerUsageGraphModal">
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
    {/if}

    <div id="confirmationModal" class="lu-modal lu-modal--md">
        <div class="lu-modal__dialog">
            <div id="mgModalContainer" class="lu-modal__content">
                <div class="lu-modal__top lu-top">
                    <div class="lu-top__title lu-type-6"><span class="lu-text-faded lu-font-weight-normal">
                        Scope                    </span></div>
                    <div class="lu-top__toolbar">
                        <button data-dismiss="lu-modal" aria-label="Close"
                                class="lu-btn lu-btn--xs lu-btn--default lu-btn--icon lu-btn--link lu-btn--plain closeModal" onclick="hideModal()">
                            <i class="lu-btn__icon lu-zmdi lu-zmdi-close"></i></button>
                    </div>
                </div>
                <div class="lu-modal__body">
                    <div class="lu-row">
                        <div class="lu-col-md-12">
                            <form>
                                <div class="lu-form-group">
                                    <label class="lu-form-label"> Period </label>
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
                        </div>
                    </div>
                </div>
                <div class="lu-modal__actions">
                    <button id="reloadPowerUsageGraphModal" class="lu-btn lu-btn--success submitForm mg-submit-form">
                        Save Changes
                    </button>
                    <a class="lu-btn lu-btn--danger lu-btn--outline lu-btn--plain" onclick="hideModal()">
                        Cancel
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>