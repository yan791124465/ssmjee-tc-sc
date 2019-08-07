<%--
  Created by IntelliJ IDEA.
  User: gaoxiang
  Date: 2017/3/14
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if IE 8]> <html lang="zh" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <title> 后台登录 </title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
<%--    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />--%>
    <link href="/static/metronic/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/metronic/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/metronic/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/metronic/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="/static/metronic/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="/static/metronic/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="/static/metronic/global/css/components-rounded.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="/static/metronic/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="/static/metronic/pages/css/login.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="/favicon.ico" /> </head>
<!-- END HEAD -->

<body class=" login">
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="/login">
        <img src="/images/project/logo_baidu.png" alt="" /> </a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form class="login-form" action="/login/manager" method="post" id="loginForm">

        <h3 class="form-title font-green">请登录</h3>

        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">Username</label>
            <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="您的用户名" name="userName" /> </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Password</label>
            <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="您的密码" name="password" /> </div>
        <div class="form-actions">
            <button type="button" class="btn green btn-sm uppercase" onclick="loginForm()">
                <i id="login_btn_ico" class="fa fa-hand-o-right"></i> 登陆
            </button>
            <label class="rememberme check mt-checkbox mt-checkbox-outline">
                <input type="checkbox" name="remember" value="1" />记住我
                <span></span>
            </label>
            <a href="javascript:;" id="forget-password" class="forget-password">忘记密码 ?</a>
        </div>
    </form>
    <!-- END LOGIN FORM -->
    <!-- BEGIN FORGOT PASSWORD FORM -->
    <form class="forget-form" action="#" method="post" id="forgetForm">
        <h3 class="font-green">忘记密码 ?</h3>
        <p> 您的邮箱会收到重置密码的连接。 </p>
        <p> 必须是您注册时填写的邮箱才可以。 </p>
        <div class="form-group">
            <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="您的邮箱地址" name="email" /> </div>
        <div class="form-actions">
            <button type="button" id="back-btn" class="btn green btn-outline">返回</button>
            <button type="submit" class="btn btn-success uppercase pull-right">提交</button>
        </div>
    </form>
    <!-- END FORGOT PASSWORD FORM -->

</div>
<div class="copyright"> 2017 © Gx. Web Service. </div>
<!--[if lt IE 9]>
<script src="/static/metronic/global/plugins/respond.min.js"></script>
<script src="/static/metronic/global/plugins/excanvas.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="/static/metronic/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/static/metronic/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/static/metronic/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="/static/metronic/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="/static/metronic/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/static/metronic/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/static/metronic/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="/static/metronic/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/static/metronic/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="/static/metronic/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="/static/metronic/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/static/metronic/pages/scripts/login.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="/static/plugins/layer/layer.js"></script>
<script src="/static/js/tools.js"></script>
<!-- END THEME LAYOUT SCRIPTS -->
<script>

    $(document).ready(function () {
        console.log("请先登陆。")
    });

    /**
     * 登陆
     * @returns {boolean}
     */
    function loginForm() {
        var param = tools.formParams("loginForm")

        var userName = param["userName"];
        var password = param["password"];
        var remember = param["remember"];

        //验证
        if (userName.trim() == "") {
            layer.msg("请输入用户名",{icon:2});
            return false;
        }
        if (password.trim() == "") {
            layer.msg("请输入密码",{icon:2});
            return false;
        }

        //开始登陆样式
        $("#login_btn_ico").attr("class", "fa fa-spinner fa-spin");

        $.ajax({
            type : "post",
            url : "/login/manager",
            data : {"userName":userName,"password":getPassword(password),"remember":remember},
            dataType : "json",
            success : function(data){

                if (data.success) {
                    layer.msg('登陆成功！',{icon: 1,time:1000}, function(){
                        window.location.href = "/";
                    });

                } else {
                    $("#login_btn_ico").attr("class", "fa fa-arrow-circle-right");
                    $("#password").val("");
                    var _case = {
                        16: "没有此用户。",
                        11: "密码错误！",
                        14: "服务器拒绝登陆！"
                    };
                    tools.errorTip(_case, data.code);
                }
            }
        });
    }

    function getPassword(password){
        var pwdMd5 = "";
        $.ajax({
            type : "post",
            url : "/login/md5",
            data : {pwd:password},
            async : false,
            success : function(data){
                pwdMd5 = data;
            }
        });
        return pwdMd5;
    }


    //绑定回车事件
    $(document).keydown(function (event) {
        if (event.keyCode == 13) {
            loginForm();
        }
    });
</script>
</body>

</html>
