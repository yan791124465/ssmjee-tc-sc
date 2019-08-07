<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/5 0005
  Time: 下午 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="portlet light">
    <div class="portlet-title">
        <div class="caption">
            <span class="caption-subject font-red-sunglo bold uppercase">角色添加</span>
            <span class="caption-helper">同名角色可以重复，但是建议只分配一个</span>
        </div>
    </div>
    <div class="portlet-body form">
        <!-- BEGIN FORM-->
        <form action="#" class="form-horizontal" id="save-module">
            <div class="form-body">
                <div class="form-group hide">
                    <label class="col-md-3 control-label">ID</label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa  fa-qq"></i>
                            <input type="text" name="id" value="${longId}">
                            <input type="text" name="accountId" value="${account.id}">
                        </div>
                    </div>
                </div>
                <div class="form-group frist">
                    <label class="col-md-3 control-label">角色名称</label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa  fa-qq"></i>
                            <input type="text" class="form-control" name="name" placeholder="角色名称">
                        </div>
                    </div>
                </div>
                <div class="form-group frist">
                    <label class="col-md-3 control-label">权限标识</label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa  fa-qq"></i>
                            <input type="text" class="form-control" name="shiro" placeholder="角色权限标识">
                        </div>
                    </div>
                </div>
                <div class="form-group last">
                    <label class="col-md-3 control-label">角色备注</label>
                    <div class="col-md-4">
                        <textarea name="intro" class="form-control" style="width: 100%;height: 200px;" placeholder="角色备注"></textarea>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" class="btn green" onclick="save();">保存</button>
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
<script>

    $(function(){
        //初始化页面
        initPage();
    });

    function save(){
        var param = tools.formParams("save-module");
        if(tools.valid("save-module")){
            tools.post("/role/save",param,function(data){
                if(data.success){
                    layer.msg('保存成功', {icon: 1,time:1000},function(){
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