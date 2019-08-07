<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ssm" uri="http://ssm.elangzhi.com/jsp/tag/functions" %>
<%--
Created by GaoXiang
Date: 2017-03-28 09:07:57 星期二
Version: 1.0
日志编辑页面
--%>

<div class="portlet light" >
    <div class="portlet-body form">
        <!-- BEGIN FORM-->
        <form action="#" class="form-horizontal" id="edit-module">
            <div class="form-body">

                <div class="row">
                    <div class="col-md-6 hide">
                        <div class="form-group">
                            <label class="control-label col-md-3">ID</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="id" value="${data.id}" placeholder="默认生成，ID">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">content</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="content" value="${data.content}" placeholder="content">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">type</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="type" value="${data.type}" placeholder="type">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">setTime</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="setTime" value="${data.setTime}" placeholder="setTime">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">accountId</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="accountId" value="${data.accountId}" placeholder="accountId">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">status</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="status" value="${data.status}" placeholder="status">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">ip</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="ip" value="${data.ip}" placeholder="ip">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">method</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="method" value="${data.method}" placeholder="method">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">params</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="params" value="${data.params}" placeholder="params">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" class="btn green" onclick="edit();">修改日志</button>
                                <button type="button" class="btn default" onclick="layer.close(layer_editModule);">取消</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6"> </div>
                </div>
            </div>
        </form>
        <!-- END FORM-->
    </div>
</div>
<!-- script 开始 -->
<script>

    $(function(){
        //初始化页面
        initPage();
    });

    function edit(){
        var param = tools.formParams("edit-module");
        if(tools.valid("edit-module")){
            tools.post("/log/update",param,function(data){
                if(data.success){
                    layer.msg('保存成功', {icon: 1,time:1000},function(){
                        //刷新列表页面
                        toPage(null);
                        //关闭弹窗
                        layer.close(layer_editModule);
                    });
                }else{
                    tools.errorTip(data.code,data.msg);
                }
            });
        }
    }
</script>
<!-- script 结束 -->