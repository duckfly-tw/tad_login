<script type="text/javascript">
    $().ready(function(){
        <{if $type=="email"}>
            $("#kind_schoolcode").hide();
            $("#kind_email").show();
        <{else}>
            $("#kind_schoolcode").show();
            $("#kind_email").hide();
        <{/if}>

        $("#type").change(function() {
            if($("#type").val()=="email"){
                $("#kind_schoolcode").hide();
                $("#kind_email").show();
            }else{
                $("#kind_schoolcode").show();
                $("#kind_email").hide();
            }
        });
    });
</script>

<form action="<{$action}>" method="post" id="myForm" enctype="multipart/form-data">

    <!--學校代碼或Email-->
    <div class="row">
        <div class="col-sm-2">
            <select name="type" id="type" class="form-control">
                <option value="email" <{if $type=="email"}>selected<{/if}>><{$smarty.const._MA_TADLOGIN_EMAIL}></option>
                <option value="schoolcode" <{if $type!="email"}>selected<{/if}>><{$smarty.const._MA_TADLOGIN_SCHOOLCODE}></option>
            </select>
        </div>

        <div id="kind_schoolcode">
            <div class="col-sm-2">
                <input type="text" name="item_schoolcode" class="form-control " value="<{$item}>" placeholder="<{$smarty.const._MA_TADLOGIN_SCHOOLCODE}>">
            </div>
        </div>

        <div id="kind_email">
            <div class="col-sm-2">
                <textarea name="item_email" rows=3 class="form-control " placeholder="<{$smarty.const._MA_TADLOGIN_EMAIL_DESC}>"><{$item}></textarea>
            </div>
        </div>

        <label class="col-sm-1 text-right">
            <{$smarty.const._MA_TADLOGIN_JOB}>
        </label>
        <div class="col-sm-2">
            <select name="kind_schoolcode" class="form-control">
                <option value="" <{if $kind=="email" or $kind==""}>selected<{/if}>></option>
                <option value="teacher" <{if $kind=="teacher"}>selected<{/if}>><{$smarty.const._MA_TADLOGIN_TEACHER}></option>
                <option value="student" <{if $kind=="student"}>selected<{/if}>><{$smarty.const._MA_TADLOGIN_STUDENT}></option>
            </select>
        </div>

        <!--群組-->
        <label class="col-sm-1 text-right">
            <{$smarty.const._MA_TADLOGIN_GROUP_ID}>
        </label>
        <div class="col-sm-3">
            <{$group_menu}>
        </div>

        <div class="col-sm-1 text-center">
            <!--編號-->
            <input type='hidden' name="config_id" value="<{$config_id}>">
            <input type="hidden" name="op" value="<{$next_op}>">
            <button type="submit" class="btn btn-primary"><{$smarty.const._TAD_SAVE}></button>
        </div>
        </div>
</form>