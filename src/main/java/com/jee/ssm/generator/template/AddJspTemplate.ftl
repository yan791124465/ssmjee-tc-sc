<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
Created by GaoXiang
Date: ${date}
Version: 1.0
${modelName}添加页面
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
                                <input type="text" class="form-control" name="id" value="${r'${longId}'}" placeholder="默认生成，ID">
                            </div>
                        </div>
                    </div>
        <#list fieldList as field>
            <#if (field.name != "id")>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">${field.name}</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="${field.name}" placeholder="${field.name}">
                            </div>
                        </div>
                    </div>
            </#if>
        </#list>
                </div>
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" class="btn green" onclick="save();">保存${modelName}</button>
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
     * 保存${modelName}
     */
    function save(){
        var param = tools.formParams("save-module");
        if(tools.valid("save-module")){
            tools.post("/${lower}/save",param,function(data){
                if(data.success){
                    layer.msg('${modelName}保存成功', {icon: 1,time:1000},function(){
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