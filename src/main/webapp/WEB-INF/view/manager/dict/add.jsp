<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
Created by GaoXiang
Date: 2017-04-01 10:44:30 星期六
Version: 1.0
字典添加页面
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
                            <label class="control-label col-md-3">name</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="name" placeholder="name">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">code</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="code" placeholder="code">
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
                            <label class="control-label col-md-3">sort</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="sort" placeholder="sort">
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
                            <label class="control-label col-md-3">intro</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="intro" placeholder="intro">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">parentId</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="parentId" placeholder="parentId">
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
                                <button type="button" class="btn green" onclick="save();">保存字典</button>
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

    /**
     * 保存字典
     */
    function save(){
        var param = tools.formParams("save-module");
        if(tools.valid("save-module")){
            tools.post("/dict/save",param,function(data){
                if(data.success){
                    layer.msg('字典保存成功', {icon: 1,time:1000},function(){
                        //刷新列表页面
                        toPage(null);
                        //关闭弹窗
                        layer.close(layer_addModule);
                    });
                }else{
                    tools.errorTip(data.code,data.data);
                }
            });
        }
    }

</script>
<!-- script 结束 -->