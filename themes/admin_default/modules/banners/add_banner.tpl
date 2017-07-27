<!-- BEGIN: upload_blocked -->
<div class="alert alert-info">{CONTENTS.upload_blocked}</div>
<!-- END: upload_blocked -->
<!-- BEGIN: main -->
<div class="alert alert-info">{CONTENTS.info}</div>

<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.validator-{NV_LANG_INTERFACE}.js"></script>
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>

<form id="frm" method="post" enctype="multipart/form-data" action="{CONTENTS.action}">
    <input type="hidden" value="1" name="save" id="save" />
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <col class="w300"/>
            <col class="w20">
            <col>
            <tbody>
                <tr>
                    <td>{CONTENTS.title.0}:</td>
                    <td><sup class="required">&lowast;</sup></td>
                    <td><input class="w300 required form-control" name="{CONTENTS.title.1}" type="text" value="{CONTENTS.title.2}" maxlength="{CONTENTS.title.3}" /></td>
                </tr>
                <tr>
                    <td>{CONTENTS.plan.0}:</td>
                    <td><sup class="required">&lowast;</sup></td>
                    <td>
                    <select name="{CONTENTS.plan.1}" id="{CONTENTS.plan.1}" class="form-control w300" onchange="chancePlan()" onload="chancePlan()" >
                        <!-- BEGIN: plan -->
                        <option value="{PLAN.key}" class="{PLAN.require_image}" {PLAN.selected}>{PLAN.title}</option>
                        <!-- END: plan -->
                    </select></td>
                </tr>
                <tr>
                    <td>{LANG.assign_to_user}:</td>
                    <td>&nbsp;</td>
                    <td>
                        <div class="autosearchpersion w300 pull-left" data-checkss="{NV_CHECK_SESSION}">
                            <span class="searchloading hidden"><i class="fa fa-spin fa-spinner"></i></span>
                            <input type="text" class="form-control" name="assign_user" value="{CONTENTS.assign_user}" autocomplete="off"/>
                            <div class="searchresultaj"></div>
                        </div>
                        <a href="javascript:void(0);" title="{LANG.assign_to_user_tip}" data-toggle="tooltip" class="form-info-circle"><i class="fa fa-info-circle"></i></a>
                    </td>
                </tr>
                <tr>
                    <td>{CONTENTS.upload.0}:</td>
                    <td><sup class="required" id="require_image" ></sup></td>
                    <td><input name="{CONTENTS.upload.1}" type="file" /></td>
                </tr>
                <tr>
                    <td>{CONTENTS.file_alt.0}:</td>
                    <td>&nbsp;</td>
                    <td><input class="form-control w300" name="{CONTENTS.file_alt.1}" type="text" value="{CONTENTS.file_alt.2}" maxlength="{CONTENTS.file_alt.3}" /></td>
                </tr>
                <tr>
                    <td>{CONTENTS.click_url.0}:</td>
                    <td>&nbsp;</td>
                    <td><input class="form-control w300 url" name="{CONTENTS.click_url.1}" type="text" value="{CONTENTS.click_url.2}" maxlength="{CONTENTS.click_url.3}" /></td>
                </tr>
                <tr>
                    <td>{CONTENTS.target.0}:</td>
                    <td>&nbsp;</td>
                    <td>
                    <select name="{CONTENTS.target.1}" class="form-control w300">
                        <!-- BEGIN: target -->
                        <option value="{TARGET.key}"{TARGET.selected}>{TARGET.title}</option>
                        <!-- END: target -->
                    </select></td>
                </tr>
                <tr>
                    <td>{CONTENTS.publ_date.0}:</td>
                    <td>&nbsp;</td>
                    <td>
                        <div class="input-group pull-left" style="margin-right: 10px">
                            <input name="{CONTENTS.publ_date.1}" id="publ_date" value="{CONTENTS.publ_date.2}" maxlength="{CONTENTS.publ_date.3}" class="form-control" style="width: 100px;" readonly="readonly" type="text" />
                            <span class="input-group-btn pull-left">
                                <button class="btn btn-default" type="button" id="publ_date-btn"> <em class="fa fa-calendar fa-fix">&nbsp;</em></button>
                            </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>{CONTENTS.exp_date.0}:</td>
                    <td>&nbsp;</td>
                    <td>
                        <div class="input-group pull-left" style="margin-right: 10px">
                            <input name="{CONTENTS.exp_date.1}" id="exp_date" value="{CONTENTS.exp_date.2}" maxlength="{CONTENTS.exp_date.3}" class="form-control" style="width: 100px;" readonly="readonly" type="text" />
                            <span class="input-group-btn pull-left">
                                <button class="btn btn-default" type="button" id="exp_date-btn"> <em class="fa fa-calendar fa-fix">&nbsp;</em></button>
                            </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p class="m-bottom">{CONTENTS.bannerhtml.0}:</p>
                        {CONTENTS.bannerhtml.1}
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="text-center">
        <input type="submit" value="{CONTENTS.submit}" class="btn btn-primary" />
    </div>
    <div id="demo"></div>
</form>
<script type="text/javascript">
    $(document).ready(function() {
        chancePlan();
        $('#frm').validate();
        $("#publ_time,#exp_date").datepicker({
            dateFormat : "dd/mm/yy",
            changeMonth : true,
            changeYear : true,
            showOtherMonths : true,
            showOn: 'focus'
        });

        $('#publ_time-btn').click(function(){
            $("#publ_time").datepicker('show');
        });

        $('#exp_date-btn').click(function(){
            $("#exp_date").datepicker('show');
        });
    });
    function chancePlan() {
        var x =    $('select option:selected').attr('class');
           if (x == 'require_image') {
           document.getElementById("require_image").innerHTML = "&lowast;";
        }else{
               document.getElementById("require_image").innerHTML = "&nbsp;";
        };
}
</script>
<!-- END: main -->