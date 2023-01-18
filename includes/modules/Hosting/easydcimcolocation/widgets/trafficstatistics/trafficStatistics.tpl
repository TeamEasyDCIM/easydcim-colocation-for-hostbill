<link href="{$assetsURL}/css/fonts.css" rel="stylesheet">
<link rel="stylesheet" href="{$assetsURL}/css/layers-ui.css">
<link rel="stylesheet" href="{$assetsURL}/css/mg_styles.css">
<link rel="stylesheet" href="{$assetsURL}/css/select2.css">
<script src="{$assetsURL}/js/select2.js"></script>
<script src="{$assetsURL}/js/index.js"></script>
<script src="{$assetsURL}/js/chart.js"></script>
<script src="{$assetsURL}/js/chartjs-adapter-date-fns.bundle.min.js"></script>
<script src="{$assetsURL}/js/aggregateTraffic.js"></script>
<div id="layers">
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
            <div class="lu-widget">
                <div class="lu-widget__header">
                    <div class="lu-widget__top lu-top">
                        <div class="lu-top__title">
                            {$lang.serverAA.servicePageIntegration.mainContainer.aggregateTraffic.title}
                        </div>
                        <div class="lu-top__toolbar">
                            <a data-toggle="modal" data-target="#aggregateModal" onclick="showModal()">
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
            <div class="lu-widget widgetActionComponent vueDatatableTable">
                <div class="lu-widget__header">
                    <div class="lu-widget__top lu-top">
                        <div class="lu-top__title">
                            {$lang.serverCA.devicesTraffic.mainContainer.networkPortsTable.networkPortsTable}
                        </div>
                    </div>
                </div>
                <div class="lu-widget__body">
                    <div id="networkPortsTable" data-table-container="" data-check-container="" class="lu-t-c  datatableLoader">
                        {if empty($rawObject->networkPorts->getData())}
                            <div style="padding: 15px; text-align: center; border-top: 1px solid rgb(233, 235, 240);">
                                No Data Available
                            </div>
                        {else}
                            <table width="100%" role="grid"
                                   class="lu-table lu-table--mob-collapsible dataTable no-footer dtr-column">
                                <thead>
                                <tr role="row">
                                    <th aria-sort="descending" name="label" class="sorting "><span
                                                class="lu-table__text">{$lang.serverCA.devicesTraffic.mainContainer.networkPortsTable.table.label}</span></th>
                                    <th aria-sort="descending" name="device" class="sorting "><span
                                                class="lu-table__text">{$lang.serverCA.devicesTraffic.mainContainer.networkPortsTable.table.device}</span></th>
                                    <th aria-sort="descending" name="last_hour_traffic" class="sorting "><span
                                                class="lu-table__text">{$lang.serverCA.devicesTraffic.mainContainer.networkPortsTable.table.last_hour_traffic}</span></th>
                                    <th aria-sort="descending" name="last_day_traffic" class="sorting "><span
                                                class="lu-table__text">{$lang.serverCA.devicesTraffic.mainContainer.networkPortsTable.table.last_day_traffic}</span></th>
                                    <th aria-sort="descending" name="last_month_traffic" class="sorting "><span
                                                class="lu-table__text">{$lang.serverCA.devicesTraffic.mainContainer.networkPortsTable.table.last_month_traffic}</span></th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$rawObject->networkPorts->getData() key=myId item=i}
                                    <tr role="row">
                                        <td>{$i.label}</td>
                                        <td>{$i.device}</td>
                                        <td>{$i.last_hour_traffic}</td>
                                        <td>{$i.last_day_traffic}</td>
                                        <td>{$i.last_month_traffic}</td>
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                    <button id="reloadAggregateTraffic" class="lu-btn lu-btn--success submitForm mg-submit-form">
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



