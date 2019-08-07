<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ssm" uri="http://ssm.elangzhi.com/jsp/tag/functions" %>
<%--
Created by GaoXiang
Date: 2017-04-01 10:44:30 星期六
Version: 1.0
字典编辑页面
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
                            <label class="control-label col-md-3">name</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="name" value="${data.name}" placeholder="name">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">code</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="code" value="${data.code}" placeholder="code">
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
                            <label class="control-label col-md-3">sort</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="sort" value="${data.sort}" placeholder="sort">
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
                            <label class="control-label col-md-3">intro</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="intro" value="${data.intro}" placeholder="intro">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">parentId</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="parentId" value="${data.parentId}" placeholder="parentId">
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
                                <button type="button" class="btn green" onclick="edit();">修改字典</button>
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

    /**
     * 保存编辑的字典
     */
    function edit(){
        var param = tools.formParams("edit-module");
        if(tools.valid("edit-module")){
            tools.post("/dict/update",param,function(data){
                if(data.success){
                    layer.msg('字典修改成功', {icon: 1,time:1000},function(){
                        //刷新列表页面
                        toPage(null);
                        //关闭弹窗
                        layer.close(layer_editModule);
                    });
                }else{
                    tools.errorTip(data.code,data.data);
                }
            });
        }
    }
</script>
<!-- script 结束 -->