function loadChangeStateModal(encodedId) {
    let id = JSON.parse(atob(encodedId));
    const layers = $('#layers');
    const modal = '<div id="confirmationModal" class="lu-modal show lu-modal--info modal--sm modal--zoomIn">\n' +
        '    <div class="lu-modal__dialog">\n' +
        '        <div id="mgModalContainer" class="lu-modal__content">\n' +
        '            <div class="lu-modal__top lu-top"><i\n' +
        '                class="lu-top__icon lu-zmdi lu-zmdi-info-outline lu-text-success"></i>\n' +
        '                <div class="lu-top__title lu-type-5 lu-text-success">\n' +
        '                    Change State\n' +
        '                </div>\n' +
        '                <div class="lu-top__toolbar">\n' +
        '                    <button data-dismiss="lu-modal" aria-label="Close"\n' +
        '                            class="lu-btn lu-btn--xs lu-btn--default lu-btn--icon lu-btn--link lu-btn--plain closeModal" onclick="closeModal()">\n' +
        '                        <i class="lu-btn__icon lu-zmdi lu-zmdi-close"></i></button>\n' +
        '                </div>\n' +
        '            </div>\n' +
        '            <div class="lu-modal__body">\n' +
        '                <form id="changeState">' +
        '                   <div class="lu-form-group">' +
        '                       <label class="lu-form-label"> State </label> ' +
        '                       <select id="changeStateSelect" name="changeStateSelect" class="lu-form-control selectized">\n' +
        '                           <option value="outletOn">Outlet On</option>\n' +
        '                           <option value="outletOff">Outlet Off</option>\n' +
        '                           <option value="outletReboot">Outlet Reboot</option>\n' +
        '                       </select>\n' +
        '                    <input type="hidden" name="indexID" value="'+id.indexID+'"> <input type="hidden" name="deviceID" value="'+id.deviceID +'">\n' +
        '                </form>\n' +
        '            </div>\n' +
        '            <div class="lu-modal__actions">\n' +
        '                <button class="lu-btn lu-btn--success submitForm mg-submit-form" onclick="changeState()">\n' +
        '                    Save Changes\n' +
        '                </button>\n' +
        '                <button class="lu-btn lu-btn--danger lu-btn--outline lu-btn--plain closeModal" onclick="closeModal()">\n' +
        '                    Cancel\n' +
        '                </button>\n' +
        '            </div>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '</div>'

    layers.append(modal);

    $('#changeStateSelect').select2({
    });
}

function closeModal()
{
    $('#confirmationModal').remove();
}

function getFormData(form){
    var o = {};
    var a = form.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
}

function changeState()
{
    let form = $('#changeState');
    let serializeData = getFormData(form);
    let url = window.location.href;
    let data = {
        "ajax": "1",
        "changeState": "1",
        "formdata": serializeData,
    }

    $.ajax({
        type: "GET",
        url: url,
        data: data,
        success: function(data){
            let message = JSON.parse(data).data.message;
            console.log(message)
            closeModal()
            let div = $('#infos');
            div.html('');
            div.css("display", "block");
            div.append('<div class="alert alert-info">\n' +
                '<a class="close">×</a>\n' +
                ''+message+'<br></div>')
        },
        error: function(data) {
            let error = JSON.parse(data.responseText).data.error;
            console.log(error)
            closeModal()
            let div = $('#errors');
            div.html('');
            div.css("display", "block");
            div.append('<div class="alert alert-error">\n' +
                '<a class="close">×</a>\n' +
                ''+error+'<br></div>')
        }
    });
}

