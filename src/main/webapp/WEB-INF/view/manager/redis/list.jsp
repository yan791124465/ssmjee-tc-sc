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
    <meta content="后台服务中心" name="description"/>
    <meta content="GaoXiang" name="author"/>
    <jsp:include page="../body/link-page.jsp"/>
</head>
<!-- END HEAD -->
<body class="page-content-white  fade-in-up">

<!-- BEGIN CONTAINER -->
<div class="page-container">


    <!-- BEGIN PAGE TOOLS-->
    <%--<div class="portlet light margin-bottom-1">
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
                    <input type="text" class="form-control" name="name" value="${name}" autofocus placeholder="名称">
                    <div class="form-control-focus"></div>
                </div>
                <button class="btn btn-success btn-tools-search"><i class="icon-magnifier"></i> 搜索</button>
                <button class="btn btn-danger btn-tools-reset" data-url-param="&page=1&size=10"><i
                        class="icon-reload"></i> 重置
                </button>
            </div>
        </div>
    </div>--%>
    <!-- END PAGE TOOLS-->

    <!-- BEGIN PAGE TABLE-->
    <div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-speech  font-blue-hoki"></i>
                <span class="caption-subject font-blue-hoki">Redis</span>
                <span class="caption-helper">
                    redis keys list
                </span>
            </div>
        </div>
        <div class="btn-group">
            <button class="btn btn-info " onclick="location.reload()"> 刷新 <i class="fa fa-times"></i></button>
            <button class="btn btn-danger " onclick="deleteByPattern('*');"> 批量删除 <i class="fa fa-times"></i></button>
        </div>
        <%--<div class="portlet-title">
            <div class="caption">
                <i class="icon-speech  font-blue-hoki"></i>
                <span class="caption-subject font-blue-hoki">数据表</span>
                <span class="caption-helper">
                    当前查询条件下有：<span class="show-page-total">${pageInfo.total}</span> 条数据，
                    总计：<span class="show-page-count">${pageInfo.pages}</span> 页，
                    当前显示第：<span class="show-page-current">${pageInfo.pageNum}</span> 页，
                    首行为第：<span class="show-page-begin">${(pageInfo.pageNum - 1) * pageInfo.pageSize + 1}</span> 条数据。
                </span>
            </div>


        </div>--%>
        <%--<div class="table-toolbar">
            <div class="row">
                <div class="col-md-3">

                    <div class="btn-group">
                        <a href="javascript:history.go(-1);" class="btn blue ">
                            后退 <i class="fa fa-history"></i>
                        </a>
                        <a href="javascript:void(0);" class="btn green btn-module-add">
                            添加 <i class="fa fa-plus"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="btn-group pull-right">
                        <button class="btn btn-danger btn-module-delete-all"> 批量删除 <i class="fa fa-times"></i></button>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="portlet-body table-responsive">

            <table class="table table-bordered table-hover" id="table">

                <thead>
                <tr>
                    <th>编号</th>
                    <th>Key</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${list}" varStatus="status">
                    <tr>
                        <td class="center">${status.count}</td>
                        <td>${item}</td>
                        <td>
                            <div class="btn-group btn-group-xs btn-group-solid ">
                                <button class="btn btn-danger" onclick="deleteByKey('${item}');">删除</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

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
        /*initList({
            table: "table",                                                 //表格ID
            url: "/role/list",                                          //表格分页url
            ajax: true                                                      //为true时伪静态刷新指定ID的table
        });
*/
    });

    /**
     * 删除单个
     * @param id 要删除的id
     */
    function deleteByKey(key){
        layer.confirm("确定删除么？",function() {
            tools.post("/redis/delete", {"key":key}, function (data) {
                if(data.success){
                    layer.msg('删除成功！', {icon: 1,time:1000},function(){
                        //跳转到第一页
                        window.location.reload();
                    });
                }else{
                    tools.errorTip(data.code,data.data);
                }
            });
        });
    }


    /**
     * 批量删除
     */
    function deleteByPattern(pattern){
        /*var keys = getIds($('#table').find(".checkbox-child:checked"));
        if(keys.length === 0){
            layer.msg("请先选择要删除的条目！", {icon: 2,time:1000});
            return;
        }*/
        layer.confirm("确定删除选中信息么？",function(){
            tools.post("/redis/deleteByPattern",{"pattern":pattern},function(data){
                if(data.success){
                    layer.msg('批量删除成功！', {icon: 1,time:1000},function(){
                        //跳转到第一页
                        window.location.reload();
                    });
                }else{
                    tools.errorTip(data.code,data.data);
                }
            });
        });
    }



</script>
<!-- END PAGE JAVASCRIPT-->
<!-- END PAGE JAVASCRIPT-->
</body>
</html>


