<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: gaoxiang
  Date: 2017/3/14
  Time: 11:04
  权限菜单页面
--%>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="false" data-slide-speed="200" >
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper hide">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler">
                    <span></span>
                </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>

            <li class="nav-item start sidebar-home" >
                <a href="/home" class="nav-link nav-power">
                    <i class="icon-home"></i>
                    <span class="title">主页</span>
                    <%--<span class="arrow open"></span>--%>
                </a>
            </li>

            <shiro:hasRole name="admin">
                <li class="heading">
                    <h3 class="uppercase">超级管理员菜单</h3>
                </li>
                <li>
                    <a href="/power/list" data-param="&page=1&size=10&parentId=0" class="nav-link nav-power">
                        <i class="fa fa-cogs "></i>
                        <span class="title">权限管理</span>
                    </a>
                </li>
            </shiro:hasRole>

            <shiro:hasAnyRoles name="admin,manager">
                <li class="heading">
                    <h3 class="uppercase">页面工具</h3>
                </li>

                <li class="nav-item ">
                    <a href="" class="nav-link nav-toggle">
                        <i class="fa fa-cogs "></i>
                        <span class="title">工具集合</span>
                        <span class="arrow "></span>
                    </a>
                    <ul  class="sub-menu fade-in-up">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <span>测试某个url地址：</span>
                                <div>
                                    <input class="form-control" id="urlTest" placeholder="URL:/controller/list">
                                    <div style="margin-top: 5px;">
                                        <button style="width:100%;" class="btn btn-success nav-power" href="" data-param="&page=1&size=10" onclick="$(this).attr('href',$('#urlTest').val())">测试</button>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="javascript:closeNowTab()" class="nav-link">
                                <i class="fa fa-close"></i>
                                <span>关闭当前显示的标签页</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="javascript:closeAllTab()" class="nav-link">
                                <i class="fa fa-power-off"></i>
                                <span>关闭全部标签页</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="javascript:refreshNowTab()" class="nav-link">
                                <i class="fa fa-refresh"></i>
                                <span>刷新当前显示的标签页</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </shiro:hasAnyRoles>

            <li class="heading">
                <h3 class="uppercase">菜单</h3>
            </li>
            <c:forEach var="item" items="${powerList}" varStatus="status">
                <li class="nav-item">
                    <a href="${item.url }" title="${item.intro }" data-param="${item.param }" class="nav-link nav-toggle ${item.url != '' ? 'nav-power':''}">
                        <i class="${item.icon}"></i>
                        <span class="title" >${item.name }</span>
                        <c:if test="${item.url == '' }">
                            <span class="arrow "></span>
                        </c:if>
                    </a>
                    <c:if test="${item.url == '' }">
                        <ul class="sub-menu">
                            <c:forEach var="item2" items="${item.powers}" varStatus="status2">
                                <li class="nav-item">
                                    <a href="${item2.url }" title="${item2.intro }" data-param="${item2.param }" class="nav-link nav-toggle ${item2.url != '' ? 'nav-power':''}">
                                        <i class="${item2.icon}"></i> ${item2.name }
                                        <c:if test="${item2.url == ''}">
                                            <span class="arrow "></span>
                                        </c:if>
                                    </a>
                                    <c:if test="${item2.url == ''}">
                                        <ul class="sub-menu">
                                            <c:forEach var="item3" items="${item2.powers}" varStatus="status2">
                                                <li class="nav-item">
                                                    <a  href="${item3.url == ''?'#':item3.url }" title="${item3.intro }" data-param="${item3.param }" class="nav-link nav-power">
                                                        <i class="${item3.icon}"></i> ${item3.name }
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                </li>
            </c:forEach>
        </ul>
        <!-- END SIDEBAR MENU -->
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->