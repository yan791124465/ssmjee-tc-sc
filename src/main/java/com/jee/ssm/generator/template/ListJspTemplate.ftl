<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="ssm" uri="http://ssm.elangzhi.com/jsp/tag/functions" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
Created by GaoXiang
Date: ${date}
Version: 1.0
${modelName}列表
--%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>${modelName}管理 - 后台服务中心</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="${modelName}管理列表" name="description"/>
    <meta content="GaoXiang" name="author"/>
    <jsp:include page="../body/link-page.jsp"/>
</head>
<!-- END HEAD -->
<body class="page-content-white  fade-in-up">

<!-- BEGIN CONTAINER -->
<div class="page-container">


    <!-- BEGIN PAGE TOOLS-->
    <!--查询条件示例 使用时取消hide样式-->
    <div class="portlet light hide">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-paper-plane font-green-haze"></i>
                <span class="caption-subject bold font-green-haze uppercase">搜索</span>
                <span class="caption-helper">点击右侧搜索按钮开始检索</span>
            </div>
            <div class="tools">
                <a href="javascript:void(0);" class="collapse" data-original-title="收起" title="收起"></a>
                <a href="javascript:void(0);" class="fullscreen" data-original-title="全屏" title="全屏"></a>
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-inline" role="form" id="table-param">
                <div class="form-group form-md-line-input has-success">
                    <input type="text" class="form-control" name="name" value="${r'${name}'}" autofocus placeholder="名称">
                    <div class="form-control-focus"></div>
                </div>
                <button class="btn btn-success btn-tools-search"><i class="icon-magnifier"></i> 搜索</button>
                <button class="btn btn-danger btn-tools-reset" data-url-param="&page=1&size=10"><i class="icon-reload"></i> 重置
                </button>
            </div>
        </div>
    </div>
    <!-- END PAGE TOOLS-->

    <!-- BEGIN PAGE TABLE-->
    <div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech  font-blue-hoki"></i>
                <span class="caption-subject font-blue-hoki">数据表</span>
                <span class="caption-helper">
                    当前查询条件下有：<span class="show-page-total">${r'${pageInfo.total}'}</span> 条数据，
                    总计：<span class="show-page-count">${r'${pageInfo.pages}'}</span> 页，
                    当前显示第：<span class="show-page-current">${r'${pageInfo.pageNum}'}</span> 页，
                    首行为第：<span class="show-page-begin">${r'${(pageInfo.pageNum - 1) * pageInfo.pageSize + 1}'}</span> 条数据。
                </span>
            </div>

            <div class="tools">
                <a href="" class="collapse" data-original-title="" title=""> </a>
                <a href="" class="reload btn-tools-refresh" data-original-title="" title=""> </a>
                <a href="" class="fullscreen" data-original-title="" title=""> </a>
            </div>

        </div>
        <div class="table-toolbar">
            <div class="row">
                <div class="col-md-6">

                    <div class="btn-group">
                        <shiro:hasPermission name="${lower}:add">
                        <a href="javascript:void(0);" class="btn green btn-module-add">
                            添加 <i class="fa fa-plus"></i>
                        </a>
                        </shiro:hasPermission>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="btn-group pull-right">
                        <shiro:hasPermission name="${lower}:delete">
                        <button class="btn btn-danger btn-module-delete-all"> 批量删除 <i class="fa fa-times"></i></button>
                        </shiro:hasPermission>
                    </div>
                </div>
            </div>
        </div>
        <div class="portlet-body table-responsive">
            <div class="table-scrollable">
                <table data-current-page="${r'${pageInfo.pageNum}'}" data-page-size="${r'${pageInfo.pageSize}'}"
                       data-total-counts="${r'${pageInfo.total}'}" data-page-counts="${r'${pageInfo.pages}'}"
                       data-visible-pages="10" class="table table-bordered table-hover" id="table">
                    <thead>
                    <tr>
                        <th class="table-checkbox">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkbox-all" title="全选"><span></span>
                            </label>
                        </th>
                    <#list fieldList as field>
                        <th>${field.name}</th>
                    </#list>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${r'${pageInfo.list}'}" varStatus="status">
                        <tr>
                            <td class="center">
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="checkbox-child" title="选择此条数据" value="${r'${item.id}'}"><span></span>
                                </label>
                            </td>
                        <#list fieldList as field>
                            <td>${field.nameParam}</td>
                        </#list>
                            <td>
                                <div class="btn-group btn-group-xs btn-group-solid">
                                    <shiro:hasPermission name="${lower}:edit">
                                    <button data-id="${r'${item.id}'}" class="btn btn-success btn-module-edit"> 查看\编辑 </button>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="${lower}:delete">
                                    <button data-id="${r'${item.id}'}" class="btn btn-danger btn-module-delete"> 删除 </button>
                                    </shiro:hasPermission>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <ul class="pagination">
                <li>
                    <select class="form-control" id="pageSize">
                        <optgroup label="每页显示行数"></optgroup>
                        <option ${r'${pageInfo.pageSize==3?"selected":""}'} value="3">3</option>
                        <option ${r'${pageInfo.pageSize==5?"selected":""}'} value="5">5</option>
                        <option ${r'${pageInfo.pageSize==10?"selected":""}'} value="10">10</option>
                        <option ${r'${pageInfo.pageSize==20?"selected":""}'} value="20">20</option>
                        <option ${r'${pageInfo.pageSize==50?"selected":""}'} value="50">50</option>
                        <option ${r'${pageInfo.pages==pageInfo.total?"selected":""}'} value="${r'${pageInfo.total}'}">全部</option>
                    </select>
                </li>
            </ul>
            <ul class="pagination" id="pagination"></ul>
        </div>
    </div>
    <!-- END PAGE TABLE-->
</div>
<!-- END CONTAINER -->

<!-- BEGIN PAGE JAVASCRIPT-->
<jsp:include page="../body/javascript-page.jsp"/>
<script>

    $(document).ready(function () {

        //初始化页面
        initList({
            table: "table",                                                 //表格ID
            url: "/${lower}/list",                                      //表格分页url
            ajax: true                                                      //为true时伪静态刷新指定ID的table
        });

    });


    /**
     * 添加${modelName}
     */
    function addModule(){
        $.post("/${lower}/add", null, function(html){
            window.layer_addModule = layer.open({
                id:"addModule",
                type: 1,
                title:"${modelName}添加",
                /* area:['900px','600px'],*/
                area:'900px',
                content: html,
                anim:1,
                shadeClose:false,
                cancel: function(){}
            });
        });
    }


    /**
     * 编辑${modelName}
     * @param id ${modelName}id
     */
    function editModule(id){
        $.post("/${lower}/edit", {"id":id}, function(html){
            window.layer_editModule = layer.open({
                id:"editModule",
                type: 1,
                title:"${modelName}编辑",
                /* area:['900px','600px'],*/
                area:'900px',
                content: html,
                anim:1,
                shadeClose:false,
                cancel: function(){}
            });
        });
    }

    /**
     * 删除单个${modelName}
     * @param id 要删除的${modelName}id
     */
    function deleteById(id){
        layer.confirm("确定删除么？",function() {
            tools.post("/${lower}/delete", {"id":id}, function (data) {
                if(data.success){
                    layer.msg('${modelName}删除成功！', {icon: 1,time:1000},function(){
                        //跳转到第一页
                        toPage(1);
                    });
                }else{
                    tools.errorTip(data.code,data.data);
                }
            });
        });
    }


    /**
     * 批量删除${modelName}
     */
    function deleteByIds(){
        var ids = getIds($('#table').find(".checkbox-child:checked"));
        if(ids.length === 0){
            layer.msg("请先选择要删除的${modelName}！", {icon: 2,time:1000});
            return;
        }
        layer.confirm("确定删除选中${modelName}信息么？",function(){
            tools.post("/${lower}/deleteByIds",{"ids":ids.join(",")},function(data){
                if(data.success){
                    layer.msg('${modelName}批量删除成功！', {icon: 1,time:1000},function(){
                        //跳转到第一页
                        toPage(1);
                    });
                }else{
                    tools.errorTip(data.code,data.data);
                }
            });
        });
    }





</script>
<!-- END PAGE JAVASCRIPT-->
</body>
</html>
