<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ssm" uri="http://ssm.elangzhi.com/jsp/tag/functions" %>
<%--
Created by GaoXiang
Date: ${date}
Version: 1.0
${modelName}编辑页面
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
                                <input type="text" class="form-control" name="id" value="${r'${data.id}'}" placeholder="默认生成，ID">
                            </div>
                        </div>
                    </div>
                <#list fieldList as field>
                    <#if (field.name != "id")>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label col-md-3">${field.name}</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" required name="${field.name}" value="${field.nameParam}" placeholder="${field.name}">
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
                                <button type="button" class="btn green" onclick="edit();">修改${modelName}</button>
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
     * 保存编辑的${modelName}
     */
    function edit(){
        var param = tools.formParams("edit-module");
        if(tools.valid("edit-module")){
            tools.post("/${lower}/update",param,function(data){
                if(data.success){
                    layer.msg('${modelName}修改成功', {icon: 1,time:1000},function(){
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