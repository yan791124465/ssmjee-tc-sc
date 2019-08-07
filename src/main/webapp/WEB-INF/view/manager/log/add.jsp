<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
Created by GaoXiang
Date: 2017-03-28 09:07:57 星期二
Version: 1.0
日志添加页面
--%>

<div class="portlet light">

    <div class="portlet-body form">
        <!-- BEGIN FORM-->
        <form action="#" class="form-horizontal" id="save-module">
            <div class="form-body">

                <div class="row">
                    <div class="col-md-6 hide">
                        <div class="form-group">
                            <label class="control-label col-md-3">ID</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" name="id" value="${longId}" placeholder="默认生成，ID">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">content</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="content" placeholder="content">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">type</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="type" placeholder="type">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">setTime</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="setTime" placeholder="setTime">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">accountId</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="accountId" placeholder="accountId">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">status</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="status" placeholder="status">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">ip</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="ip" placeholder="ip">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">method</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="method" placeholder="method">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">params</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="params" placeholder="params">
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
                                <button type="button" class="btn green" onclick="save();">保存日志</button>
                                <button type="button" class="btn default" onclick="layer.close(layer_addModule);">取消</button>
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

    function save(){
        var param = tools.formParams("save-module");
        if(tools.valid("save-module")){
            tools.post("/log/save",param,function(data){
                if(data.success){
                    layer.msg('保存成功', {icon: 1,time:1000},function(){
                        //刷新列表页面
                        toPage(null);
                        //关闭弹窗
                        layer.close(layer_addModule);
                    });
                }else{
                    tools.errorTip(data.code,data.msg);
                }
            });
        }
    }

</script>
<!-- script 结束 -->