<%--
  Created by IntelliJ IDEA.
  User: gaoxiang
  Date: 2017/3/14
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <jsp:include page="body/link.jsp"/>
</head>
<!-- END HEAD -->
<body class="page-header-fixed page-sidebar-fixed page-sidebar-closed-hide-logo page-content-white">

<jsp:include page="body/header.jsp"/>

<!-- BEGIN CONTAINER -->
<div class="page-container">

    <jsp:include page="body/sidebar.jsp"/>

    <!-- BEGIN CONTENT -->

    <div class="page-content-wrapper">

        <!-- BEGIN CONTENT BODY -->

        <div class="page-content " style="padding: 0px;">

            <jsp:include page="body/page-bar.jsp"/>


            <div class="tab-content" id="tabContent">
                <iframe class="iframe-item tab-pane active" src="/home" frameborder="0" id="tab_1" seamless></iframe>
            </div>

        </div>
        <!-- END CONTENT BODY -->

    </div>
    <!-- END CONTENT -->

   <%-- <jsp:include page="body/quick-sidebar.jsp"/>--%>

</div>
<!-- END CONTAINER -->
<jsp:include page="body/footer.jsp"/>
<jsp:include page="body/javascript.jsp"/>
</body>
</html>