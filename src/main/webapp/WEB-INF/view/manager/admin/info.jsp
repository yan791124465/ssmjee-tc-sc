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
<body class="fade-in-up  page-content-white">

<!-- BEGIN CONTAINER -->
<div class="page-container">

            <!-- BEGIN FORM-->
            <div class="portlet light">
                <div class="portlet-title">
                    <div class="caption">
                        <span class="caption-subject font-red-sunglo bold uppercase">管理员编辑</span>
                        <span class="caption-helper">修改资料</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="#" class="form-horizontal" id="edit-module">
                        <div class="form-body">

                            <div class="form-group frist">
                                <label class="col-md-3 control-label">用户头像</label>
                                <div class="col-md-4">
                                    <img src="${data.head }" style="max-width: 200px;">
                                    <input type="hidden" name="head" value="${data.head }">
                                </div>
                            </div>

                            <div class="form-group frist">
                                <label class="col-md-3 control-label">昵称</label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa  fa-qq"></i>
                                        <input type="hidden" name="id" value="${data.id }">
                                        <input type="text" class="form-control" name="name" value="${data.name }"
                                               placeholder="昵称">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group last">
                                <label class="col-md-3 control-label">用户邮箱</label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa  fa-hdd-o"></i>
                                        <input type="text" class="form-control" name="email" value="${data.email }"
                                               placeholder="邮箱">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group last">
                                <label class="col-md-3 control-label">用户电话</label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa  fa-mobile-phone "></i>
                                        <input type="text" class="form-control" name="phone" value="${data.phone }"
                                               placeholder="电话">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group last">
                                <label class="col-md-3 control-label">用户地址</label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-home"></i>
                                        <input type="text" class="form-control" name="address" value="${data.address }"
                                               placeholder="用户地址">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group last">
                                <label class="col-md-3 control-label">用户身份证</label>
                                <div class="col-md-4">
                                    <div class="input-icon">
                                        <i class="fa fa-smile-o"></i>
                                        <input type="text" class="form-control" name="idCard" value="${data.idCard }"
                                               placeholder="身份证">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group last">
                                <label class="col-md-3 control-label">用户性别</label>
                                <div class="col-md-4">
                                    <div class="md-radio-inline">
                                        <div class="md-radio">
                                            <input type="radio" id="checkbox2_8" name="sex" class="md-radiobtn"
                                                   value="1" ${data.sex==1?"checked":"" } >
                                            <label for="checkbox2_8">
                                                <span class="inc"></span>
                                                <span class="check"></span>
                                                <span class="box"></span> 男
                                            </label>
                                        </div>
                                        <div class="md-radio">
                                            <input type="radio" id="checkbox2_9" name="sex" class="md-radiobtn"
                                                   value="0" ${data.sex==0?"checked":"" }>
                                            <label for="checkbox2_9">
                                                <span class="inc"></span>
                                                <span class="check"></span>
                                                <span class="box"></span> 女
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-4">
                                        <button type="button" class="btn green" onclick="editInfo();">
                                            <i class="fa  fa-cog fa-spin "></i>提交</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- END FORM-->
                </div>
            </div>
        </div>
<!-- END CONTAINER -->

<!-- BEGIN PAGE JAVASCRIPT-->
<jsp:include page="../body/javascript-page.jsp"/>
<script>
function editInfo(){
    var formId = "edit-module";
    var param = tools.formParams(formId);
    if(tools.valid(formId)) {
        tools.post("/admin/update", param, function (data) {
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
<!-- END PAGE JAVASCRIPT-->
<!-- END PAGE JAVASCRIPT-->
</body>
</html>
