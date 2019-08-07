<%--
  Created by IntelliJ IDEA.
  User: gaoxiang
  Date: 2017/3/14
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- BEGIN PAGE BAR -->
<div class="tabbable tabbable-tabdrop navbar-fixed-top nav-tabs md-shadow-z-1">
    <ul class="nav nav-pills " id="navTabs" >

        <li class="dropdown pull-right tabdrop">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="更多标签" aria-expanded="false">
                <i class="fa fa-ellipsis-v"></i>&nbsp;
                <i class="fa fa-angle-down"></i>
                <span class="badge badge-info" id="dropLiCount"> 0 </span>
            </a>
            <ul class="dropdown-menu" id="dropdownTabs">
                <%--<li>
                    <a href="#tab_1" data-toggle="tab" data-url="/home" data-id="1">主页</a>
                </li>--%>
            </ul>
        </li>
        <li class="nav-tab-tools-advice">
            <a href="http://192.168.1.145:1060/theme/admin_1/index.html" data-param="&id=123456" class="nav-power"  title="工具"> 模板页面工具 </a>
        </li>
        <%--<li class="nav-tab-tools-close-all">
            <a href="javascript:closeAllTab();" title="关闭所有标签页"> 关闭所有 </a>
        </li>
        <li class="nav-tab-tools-close">
            <a href="javascript:closeNowTab();" title="关闭当前显示的标签页"> 关闭 </a>
        </li>
        <li class="nav-tab-tools-reload">
            <a href="javascript:refreshNowTab();" title="刷新当前显示的标签页" > 刷新 </a>
        </li>--%>
        <li class="active">
            <a href="#tab_1" data-toggle="tab" data-url="/home" data-id="1"> 主页 </a>
        </li>
    </ul>
</div>


<!-- END PAGE BAR -->