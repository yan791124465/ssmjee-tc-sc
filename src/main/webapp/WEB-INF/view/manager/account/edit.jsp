<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/03/20
  Time: 下午 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="ssm" uri="http://ssm.elangzhi.com/jsp/tag/functions" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>后台服务中心</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="后台服务中心"/>
    <meta content="" name="GaoXiang"/>
    <jsp:include page="../body/link-page.jsp"/>
</head>
<!-- END HEAD -->
<body class="fade-in-up page-content-white">

<!-- BEGIN CONTAINER -->
<div class="page-container">

            <!-- BEGIN FORM-->
            <div class="portlet light">
                <div class="portlet-title">
                    <div class="caption">
                        <span class="caption-subject font-red-sunglo bold uppercase">密码修改</span>
                        <span class="caption-helper">请谨慎修改</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="#" class="form-horizontal" id="edit-module">
                        <div class="form-body">

                            <div class="form-group frist">
                                <label class="col-md-3 control-label">用户名</label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa  fa-qq"></i>
                                        <input type="hidden" name="id" value="${account.id }">
                                        <input type="text" class="form-control" disabled name="userName"
                                               value="${account.userName }" placeholder="用户名">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label class="col-md-3 control-label">输入新密码</label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-lock"></i>
                                        <input type="password" class="form-control" required minlength="6"
                                               id="rePassword" value="" placeholder="新密码">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group last">
                                <label class="col-md-3 control-label">再次输入新密码</label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-lock"></i>
                                        <input type="password" class="form-control" required equalTo="#rePassword"
                                               name="password" value="" placeholder="再次输入新密码">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-5">
                                    <button type="button" class="btn green" onclick="editPwd();">
                                        <i class="fa  fa-cog fa-spin "></i>提交
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- END FORM-->
                </div>
            </div>
        </div>

<jsp:include page="../body/javascript-page.jsp"/>
<script>

    //$("#editForm").validate();

    function editPwd() {

        //加密
        var pwd_old = $("input[name='password']").eq(0);
        if (pwd_old.val().trim().length == 0) {
            tools.valid("edit-module")
            return;
        }
        var md5_pwd = $.md5(pwd_old.val());
        pwd_old.val(md5_pwd);
        $("#rePassword").val(md5_pwd);


        var formId = "edit-module";
        var param = tools.formParams(formId);
        if(tools.valid(formId)) {
            tools.post("/account/update", param, function (data) {
                if(data.success){
                    layer.msg('修改成功', {icon: 1,time:1000},function(){

                    });
                }else{
                    layer.msg("修改失败！错误代号："+data.code, {icon: 2,time:1000});
                }
            });
        }

    }

</script>
</body>
</html>