<link href="{$assetsURL}/css/fonts.css" rel="stylesheet">
<link rel="stylesheet" href="{$assetsURL}/css/layers-ui.css">
<link rel="stylesheet" href="{$assetsURL}/css/mg_styles.css">
<link rel="stylesheet" href="{$assetsURL}/css/select2.css">
<link rel="stylesheet" href="{$assetsURL}/css/buttonLoader.css">
<script src="{$assetsURL}/js/select2.js"></script>
<script src="{$assetsURL}/js/index.js"></script>
<script src="{$assetsURL}/js/productconfig.js"></script>
<script src="{$assetsURL}/js/jquery.buttonLoader.js"></script>
<div id="layers">
    <div class="lu-widget">
        <div class="lu-widget__header">
            <div class="lu-widget__top lu-top">
                <div class="lu-top__title">
                    {$lang.serverAA.productConfig.mainContainer.configForm.defaultOptions.defaultOptions}
                </div>
            </div>
        </div>
        <div class="lu-widget__body">
            <div class="lu-widget__content">
                <div class="lu-alert lu-alert--sm lu-alert--info lu-alert--faded modal-alert-top">
                    <div class="lu-alert__body">
                        {$lang.serverAA.productConfig.mainContainer.configForm.defaultOptions.message}
                    </div>
                </div>
                <div class="lu-row">
                    <div id="igRow" class="lu-col-md-12 ">
                        <div id="igRow" class="lu-col-md-12 ">
                            <div class="lu-form-group">
                                <label class="lu-form-label">
                                    {$lang.serverAA.productConfig.mainContainer.configForm.defaultOptions.igRow.LocationID.LocationID}<i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.defaultOptions.igRow.LocationID.description}" data-toggle="lu-tooltip" class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target drop-abutted drop-abutted-top drop-element-attached-bottom drop-element-attached-center drop-target-attached-top drop-target-attached-center"> <span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.defaultOptions.igRow.LocationID.description}</span></i>
                                </label>
                                <select name="options[LocationID]"  id="LocationID" class="mg-select2" tabindex="-1">
                                    {foreach from=$locationList item=location }
                                        <option {if $moduleConfiguration->LocationID == $location->id}selected{/if} value="{$location->id}">{$location->name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="lu-form-group">
                                <label for="ModelID" class="lu-form-label">
                                    {$lang.serverAA.productConfig.mainContainer.configForm.defaultOptions.igRow.ModelID.ModelID}<i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.defaultOptions.igRow.ModelID.description}" data-toggle="lu-tooltip" class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target drop-abutted drop-abutted-top drop-element-attached-bottom drop-element-attached-center drop-target-attached-top drop-target-attached-center"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.defaultOptions.igRow.ModelID.description}</span></i>
                                </label>
                                <select name="options[ModelID]" id="ModelID" class="mg-select2" >
                                    {foreach from=$modelList item=model }
                                        <option {if $moduleConfiguration->ModelID == $model->id}selected{/if} value="{$model->id}">{$model->name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="lu-widget">
        <div class="lu-widget__header">
            <div class="lu-widget__top lu-top">
                <div class="lu-top__title">
                    {$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.easyDCIMAutomationSettings}
                </div>
            </div>
        </div>
        <div class="lu-widget__body">
            <div class="lu-widget__content">
                <div class="lu-row">
                    <div class="lu-alert lu-alert--sm lu-alert--info lu-alert--faded modal-alert-top">
                        <div class="lu-alert__body">
                            {$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.message}
                        </div>
                    </div>
                    <div class="lu-col-md-12">
                        <div class="lu-form-check lu-m-b-2x">
                            <label>
                            <span class="lu-form-text">
                                {$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.AutoAccept.AutoAccept}
                                <i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.AutoAccept.description}" data-toggle="lu-tooltip" class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.AutoAccept.description}</span></i>
                            </span>
                                <div class="lu-switch">
                                    <input type="checkbox" name="options[AutoAccept]" {if $moduleConfiguration->AutoAccept == 'on'}checked{/if} class="lu-switch__checkbox">
                                    <span class="lu-switch__container">
                                    <span class="lu-switch__handle">

                                    </span>
                                </span>
                                </div>
                            </label>
                        </div>
                        <div class="lu-form-check lu-m-b-2x">
                            <label>
                            <span class="lu-form-text">
                                {$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.SuspensionAction.SuspensionAction}
                                <i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.SuspensionAction.description}" data-toggle="lu-tooltip" class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.SuspensionAction.description}</span></i>
                            </span>
                                <div class="lu-switch">
                                    <input type="checkbox" name="options[SuspensionAction]" {if $moduleConfiguration->SuspensionAction == 'on'}checked{/if} class="lu-switch__checkbox">                                    <span class="lu-switch__container">
                                    <span class="lu-switch__handle">

                                    </span>
                                </span>
                                </div>
                            </label>
                        </div>
                        <div class="lu-form-check lu-m-b-2x">
                            <label>
                            <span class="lu-form-text">
                                {$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.UnsuspensionAction.UnsuspensionAction}
                                <i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.UnsuspensionAction.description}" data-toggle="lu-tooltip" class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.UnsuspensionAction.description}</span></i>                            </span>
                                <div class="lu-switch">
                                    <input type="checkbox" name="options[UnsuspensionAction]" {if $moduleConfiguration->UnsuspensionAction == 'on'}checked{/if} class="lu-switch__checkbox">
                                    <span class="lu-switch__container">
                                    <span class="lu-switch__handle">

                                    </span>
                                </span>
                                </div>
                            </label>
                        </div>
                        <div class="lu-form-check lu-m-b-2x">
                            <label>
                            <span class="lu-form-text">
                                {$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.TerminateAction.TerminateAction}
                                <i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.TerminateAction.description}" data-toggle="lu-tooltip" class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target drop-element-attached-bottom drop-element-attached-center drop-target-attached-top drop-target-attached-center drop-abutted drop-abutted-top"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.TerminateAction.description}</span></i>                            </span>
                                <div class="lu-switch">
                                    <input type="checkbox" name="options[TerminateAction]" {if $moduleConfiguration->TerminateAction == 'on'}checked{/if} class="lu-switch__checkbox">                                    <span class="lu-switch__container">
                                    <span class="lu-switch__handle">

                                    </span>
                                </span>
                                </div>
                            </label>
                        </div>
                        <div class="lu-form-group">
                            <label class="lu-form-label">
                                {$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.serviceAccessID.serviceAccessID}<i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.serviceAccessID.description}" data-toggle="lu-tooltip" class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.easyDCIMAutomationSettings.igRow.serviceAccessID.description}</span></i>
                            </label>
                            <select name="options[serviceAccessID]" id="serviceAccessID" class="mg-select2">
                                {foreach from=$accessLevelList item=level }
                                    <option {if $moduleConfiguration->serviceAccessID == $level->id}selected{/if} value="{$level->id}">{$level->name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="lu-widget">
        <div class="lu-widget__header">
            <div class="lu-widget__top lu-top">
                <div class="lu-top__title">
                    {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.clientAreaFeaturesSection}
                </div>
            </div>
        </div>
        <div class="lu-widget__body">
            <div class="lu-widget__content">
                <div class="lu-alert lu-alert--sm lu-alert--info lu-alert--faded modal-alert-top">
                    <div class="lu-alert__body">
                        {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.message}
                    </div>
                </div>
                <div class="lu-row">
                    <div class="lu-col-md-6">
                        <div id="serviceInfo" class="lu-widget">
                            <div class="lu-widget__header">
                                <div class="lu-widget__top lu-top">
                                    <div  class="lu-top__title">
                                        {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.leftSection.serviceInfo.serviceInfo}
                                    </div>
                                    <div  class="lu-top__toolbar" style="padding-top: 15px;">
                                        <div onchange="checkSection('',[],event)"
                                             class="lu-form-check lu-m-b-2x configSelectAllButton"><label><span
                                                        class="lu-form-text">
                            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.leftSection.serviceInfo.serviceInfoSelectAll.serviceInfoSelectAll}</span>
                                                <div class="lu-switch"><input type="checkbox" name="serviceInfoSelectAll"
                                                                               class="lu-switch__checkbox">
                                                    <span class="lu-switch__container"><span
                                                                class="lu-switch__handle"></span></span></div>
                                            </label></div>
                                    </div>
                                </div>
                            </div>
                            <div  class="lu-widget__body">
                                <div class="lu-widget__content">
                                    <div class="lu-row">
                                        <div class="lu-col-md-6 lu-p-r-4x">
                                            <div  class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.leftSection.serviceInfo.Label.Label}</span>
                                                    <div class="lu-switch"><input type="checkbox" name="options[Label]"
                                                                {if $moduleConfiguration->Label == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                            <div  class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.leftSection.serviceInfo.Model.Model}</span>
                                                    <div class="lu-switch"><input type="checkbox" name="options[Model]"
                                                                                  {if $moduleConfiguration->Model == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                            <div  class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.leftSection.serviceInfo.Location.Location}</span>
                                                    <div  class="lu-switch"><input type="checkbox" name="options[Location]"
                                                                                  {if $moduleConfiguration->Location == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                            <div  class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.leftSection.serviceInfo.IPAddresses.IPAddresses}</span>
                                                    <div  class="lu-switch"><input type="checkbox" name="options[IPAddresses]"
                                                                                  {if $moduleConfiguration->IPAddresses == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                            <div  class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.leftSection.serviceInfo.HideHostingInformation.HideHostingInformation}</span>
                                                    <div class="lu-switch"><input type="checkbox"
                                                                                  name="options[HideHostingInformation]"
                                                                                  {if $moduleConfiguration->HideHostingInformation == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="lu-col-md-6">
                        <div id="graphTypes" class="lu-widget">
                            <div class="lu-widget__header">
                                <div class="lu-widget__top lu-top">
                                    <div  class="lu-top__title">
                                        {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.graphTypes.graphTypes}
                                    </div>
                                    <div class="lu-top__toolbar" style="padding-top: 15px;">
                                        <div onchange="checkSection('',[],event)"
                                             class="lu-form-check lu-m-b-2x configSelectAllButton"><label><span
                                                        class="lu-form-text">
                            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.graphTypes.graphTypesSelectAll.graphTypesSelectAll}</span>
                                                <div class="lu-switch"><input type="checkbox" name="graphTypesSelectAll"
                                                                               class="lu-switch__checkbox">
                                                    <span class="lu-switch__container"><span
                                                                class="lu-switch__handle"></span></span></div>
                                            </label></div>
                                    </div>
                                </div>
                            </div>
                            <div  class="lu-widget__body">
                                <div class="lu-widget__content">
                                    <div class="lu-row">
                                        <div class="lu-col-md-6 lu-p-r-4x">
                                            <div class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.graphTypes.AggregateTraffic.AggregateTraffic}</span>
                                                    <div class="lu-switch"><input type="checkbox" name="options[AggregateTraffic]"
                                                                                  {if $moduleConfiguration->AggregateTraffic == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                            <div  class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.graphTypes.PowerUsageStatisticsGraph.PowerUsageStatisticsGraph}</span>
                                                    <div class="lu-switch"><input type="checkbox" name="options[PowerUsageStatisticsGraph]"
                                                                                  {if $moduleConfiguration->PowerUsageStatisticsGraph == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="serverActions" class="lu-widget">
                            <div class="lu-widget__header">
                                <div class="lu-widget__top lu-top">
                                    <div class="lu-top__title">
                                        {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.serverActions.serverActions}
                                    </div>
                                    <div class="lu-top__toolbar" style="padding-top: 15px;">
                                        <div onchange="checkSection('',[],event)"
                                             class="lu-form-check lu-m-b-2x configSelectAllButton"><label><span
                                                        class="lu-form-text">
                            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.serverActions.serverActionsSelectAll.serverActionsSelectAll}</span>
                                                <div class="lu-switch"><input type="checkbox" name="serverActionsSelectAll"
                                                                               class="lu-switch__checkbox">
                                                    <span class="lu-switch__container"><span
                                                                class="lu-switch__handle"></span></span></div>
                                            </label></div>
                                    </div>
                                </div>
                            </div>
                            <div class="lu-widget__body">
                                <div class="lu-widget__content">
                                    <div class="lu-row">
                                        <div class="lu-col-md-6 lu-p-r-4x">
                                            <div class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.serverActions.AutoLoginLink.AutoLoginLink}</span>
                                                    <div class="lu-switch"><input type="checkbox" name="options[AutoLoginLink]"
                                                                                  {if $moduleConfiguration->AutoLoginLink == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="modules" class="lu-widget">
                            <div class="lu-widget__header">
                                <div class="lu-widget__top lu-top">
                                    <div class="lu-top__title">
                                        {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.modules.modules}
                                    </div>
                                    <div class="lu-top__toolbar" style="padding-top: 15px;">
                                        <div onchange="checkSection('',[],event)"
                                             class="lu-form-check lu-m-b-2x configSelectAllButton"><label><span
                                                        class="lu-form-text">
                            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.modules.modulesSelectAll.modulesSelectAll}</span>
                                                <div class="lu-switch"><input type="checkbox" name="modulesSelectAll"
                                                                               class="lu-switch__checkbox">
                                                    <span class="lu-switch__container"><span
                                                                class="lu-switch__handle"></span></span></div>
                                            </label></div>
                                    </div>
                                </div>
                            </div>
                            <div class="lu-widget__body">
                                <div class="lu-widget__content">
                                    <div class="lu-row">
                                        <div class="lu-col-md-6 lu-p-r-4x">
                                            <div  class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.modules.DevicesTraffic.DevicesTraffic}</span>
                                                    <div class="lu-switch"><input type="checkbox"
                                                                                  name="options[TrafficStatistics]"
                                                                                  {if $moduleConfiguration->TrafficStatistics == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                            <div class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.modules.PowerUsageStatistics.PowerUsageStatistics}</span>
                                                    <div class="lu-switch"><input type="checkbox" name="options[PowerUsageStatistics]"
                                                                                  {if $moduleConfiguration->PowerUsageStatistics == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                            <div class="lu-form-check lu-m-b-2x"><label><span class="lu-form-text">
            {$lang.serverAA.productConfig.mainContainer.configForm.clientAreaFeaturesSection.rightSection.modules.PowerOutlets.PowerOutlets}</span>
                                                    <div class="lu-switch"><input type="checkbox" name="options[PowerOutlets]"
                                                                                  {if $moduleConfiguration->PowerOutlets == 'on'}checked{/if}
                                                                                  onchange="checkOptionUnderSection(event)"
                                                                                  class="lu-switch__checkbox"> <span
                                                                class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                                                    </div>
                                                </label></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="lu-widget">
        <div class="lu-widget__header">
            <div class="lu-widget__top lu-top">
                <div class="lu-top__title">
                    {$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.serviceNotification}
                </div>
            </div>
        </div>
        <div class="lu-widget__body">
            <div class="lu-widget__content">
                <div class="lu-row">
                    <div class="lu-col-md-6 lu-p-r-4x">
                        <div class="lu-form-group"><label class="lu-form-label">
                                {$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.CreateServerNotification.CreateServerNotification}<i
                                        data-title="{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.CreateServerNotification.description}"
                                        data-toggle="lu-tooltip"
                                        class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.CreateServerNotification.description}</span></i></label>
                            <select name="options[CreateServerNotification]" id="CreateServerNotification"
                                    class="mg-select2" tabindex="-1">
                                {foreach from=$clientEmailTemplateList item=emailTemplate }
                                    <option {if $moduleConfiguration->CreateServerNotification == $emailTemplate->id}selected{/if} value="{$emailTemplate->id}">{$emailTemplate->tplname}</option>
                                {/foreach}                               </select>
                            <div hidden="hidden" class="lu-form-feedback lu-form-feedback--icon"></div>
                        </div>
                        <div class="lu-form-group"><label class="lu-form-label">
                                {$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.SuspensionTemplate.SuspensionTemplate} <i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.SuspensionTemplate.description}" data-toggle="lu-tooltip"
                                                       class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.SuspensionTemplate.description}</span></i></label>
                            <select name="options[SuspensionTemplate]" id="SuspensionTemplate"
                                    class="mg-select2" tabindex="-1">
                                {foreach from=$adminEmailTemplateList item=emailTemplate }
                                    <option {if $moduleConfiguration->SuspensionTemplate == $emailTemplate->id}selected{/if} value="{$emailTemplate->id}">{$emailTemplate->tplname}</option>
                                {/foreach}                                </select>
                            <div hidden="hidden" class="lu-form-feedback lu-form-feedback--icon"></div>
                        </div>
                        <div class="lu-form-group"><label class="lu-form-label">
                                {$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.TerminateTemplate.TerminateTemplate} <i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.TerminateTemplate.description}" data-toggle="lu-tooltip"
                                                      class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.TerminateTemplate.description}</span></i></label>
                            <select name="options[TerminateTemplate]" id="TerminateTemplate"
                                    class="mg-select2" tabindex="-1">
                                {foreach from=$adminEmailTemplateList item=emailTemplate }
                                    <option {if $moduleConfiguration->TerminateTemplate == $emailTemplate->id}selected{/if} value="{$emailTemplate->id}">{$emailTemplate->tplname}</option>
                                {/foreach}                            </select>
                            <div hidden="hidden" class="lu-form-feedback lu-form-feedback--icon"></div>
                        </div>
                    </div>
                    <div class="lu-col-md-6">
                        <div class="lu-form-group"><label class="lu-form-label">
                                {$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.hps.adminID.adminID} <i
                                        data-title="{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.hps.adminID.description}"
                                        data-toggle="lu-tooltip"
                                        class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.hps.adminID.description}</span></i></label>
                            <select name="options[adminID]" id="adminID" class="mg-select2"
                                    tabindex="-1">
                                {foreach from=$adminList item=admin }
                                    <option {if $moduleConfiguration->adminID == $admin->id}selected{/if} value="{$admin->id}">{$admin->firstname} {$admin->lastname}</option>
                                {/foreach}                            </select>
                            <div hidden="hidden" class="lu-form-feedback lu-form-feedback--icon"></div>
                        </div>
                        <div class="lu-form-group"><label class="lu-form-label">
                                {$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.hps.UnsuspensionTemplate.UnsuspensionTemplate}<i data-title="{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.hps.UnsuspensionTemplate.description}" data-toggle="lu-tooltip"
                                                         class="lu-i-c-2x lu-zmdi lu-zmdi-help-outline lu-form-tooltip-helper lu-tooltip drop-target"><span class="tooltiptext">{$lang.serverAA.productConfig.mainContainer.configForm.serviceNotification.hps.UnsuspensionTemplate.description}</span></i></label>
                            <select name="options[UnsuspensionTemplate]" id="UnsuspensionTemplate"
                                    class="mg-select2" tabindex="-1">
                                {foreach from=$adminEmailTemplateList item=emailTemplate }
                                    <option {if $moduleConfiguration->UnsuspensionTemplate == $emailTemplate->id}selected{/if} value="{$emailTemplate->id}">{$emailTemplate->tplname}</option>
                                {/foreach}                                </select>
                            <div hidden="hidden" class="lu-form-feedback lu-form-feedback--icon"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="optionsWidget" class="lu-widget mg-configurable-options-panel mg-configurable-options-widget">
        <div class="lu-widget__header">
            <div class="lu-widget__top lu-top">
                <div class="lu-top__title">
                    Configurable Options
                </div>
            </div>
            <div class="lu-top__toolbar"></div>
        </div>
        <div class="lu-widget__body">
            <div class="lu-widget__content config-option-box">
                <div class="col-md-12 confirm-row">
                    <a id="first" href="javascript:;" class="lu-btn lu-btn--success has-spinner" onclick="createConfigurableOptions(this)">
                        <i class="lu-btn__icon lu-zmdi lu-zmdi-plus"></i>
                        <span class="lu-btn__text">Create Configurable Options</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>