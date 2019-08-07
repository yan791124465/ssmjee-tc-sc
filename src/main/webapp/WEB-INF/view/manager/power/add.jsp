<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/5 0005
  Time: 下午 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="portlet light" >
    <div class="portlet-title">
        <div class="caption">
            <span class="caption-subject font-red-sunglo bold uppercase">权限添加</span>
            <span class="caption-helper">请先选择父级权限,默认属于超级管理员角色</span>
        </div>
    </div>
    <div class="portlet-body form">
        <!-- BEGIN FORM-->
        <form action="#" class="form-horizontal" id="save-module">
            <div class="form-body">
                <div class="form-group last">
                    <label class="col-md-3 control-label">父级权限</label>
                    <div class="col-md-4 ">
                        已选择：<span id="powerNameShow" class="form-control-static" style="color:blue;">顶级权限</span>
                        <input type="hidden" name="parentId" value="0">
                        <a class="btn btn-info  pull-right " href="javascript:void(0);" onclick="chooseParent()">选择父级权限</a>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">权限ID</label>
                    <div class="col-md-4">
                        <label style="margin-top:7px;;">${longId}</label>
                        <input type="hidden" name="id" value="${longId}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限名称</label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa  fa-qq"></i>
                            <input type="text" class="form-control input-large" name="name" placeholder="权限名称">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限图标</label>
                    <div class="col-md-9">
                        <div class="input-icon" >
                            <i class="fa  fa-smile-o "></i>
                            <input type="text" class="form-control input-inline input-large" value="fa fa-file icon-state-info icon-lg " name="icon" placeholder="权限图标 fa">
                            <span class="help-inline">
                                <a class="btn btn-xs change" data-val="fa fa-list-ul icon-state-success"><i class=" fa fa-list-ul icon-state-success "></i> 列表</a>
                                <a class="btn btn-xs change" data-val="fa  fa-plus icon-state-info"><i class=" fa  fa-plus icon-state-info "></i> 添加</a>
                                <a class="btn btn-xs change" data-val="fa  fa-edit icon-state-warning"><i class=" fa  fa-edit icon-state-warning "></i> 编辑</a>
                                <a class="btn btn-xs change" data-val="fa  fa-trash-o icon-state-danger"><i class=" fa  fa-trash-o icon-state-danger "></i> 删除</a>
                            </span>
                        </div>

                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限URL</label>
                    <div class="col-md-9">
                        <div class="input-icon">
                            <i class="fa fa-anchor"></i>
                            <input type="text" class="form-control input-inline input-large" name="url" value="" placeholder="权限URL：/controller/method">
                            <span class="help-inline" >
                                <a class="btn btn-xs change" data-val="/controller/method"><i class="fa fa-ra "></i> 模块URL</a>
                                <a class="btn btn-xs change" data-val=""><i class="fa fa-ban "></i> 空的</a>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限标识</label>
                    <div class="col-md-9">
                        <div class="input-icon">
                            <i class="fa fa-square-o"></i>
                            <input type="text" class="form-control input-inline input-large" name="shiro" value="" placeholder="权限标识，shiro用：controller:method">
                            <span class="help-inline" >
                                <a class="btn btn-xs change-by-url"><i class="fa fa-ra "></i> 根据url获取</a>
                                <a class="btn btn-xs change" data-val=""><i class="fa fa-ban "></i> 空的</a>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限参数</label>
                    <div class="col-md-9">
                        <div class="input-icon">
                            <i class="fa fa-indent"></i>
                            <input type="text" class="form-control input-inline input-large" name="param" value="" placeholder="权限默认参数：&page=1&size=10">
                            <span class="help-inline" >
                                <a class="btn btn-xs change" data-val="&page=1&size=10"><i class="fa fa-ra "></i> 默认分页</a>
                                <a class="btn btn-xs change" data-val=""><i class="fa fa-ban "></i> 空的</a>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限排序</label>
                    <div class="col-md-8">
                        <div class="input-icon">
                            <i class="fa fa-arrows-v"></i>
                            <input type="text" class="form-control input-inline input-large" name="sort" value="0"  placeholder="0">
                            <span class="help-inline">
                                <a class="btn btn-xs change change-order" data-val=""><i class="fa  fa-ge "></i> 获取</a>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限简介</label>
                    <div class="col-md-4">
                        <div class="input-icon">
                            <i class="fa fa-book"></i>
                            <input type="text" class="form-control input-large" name="intro"  placeholder="权限简介">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限类型</label>
                    <div class="col-md-4">
                        <div class="md-radio-inline">
                            <div class="md-radio">
                                <input type="radio" id="checkbox2_8" name="type" class="md-radiobtn" value="0" checked>
                                <label for="checkbox2_8">
                                    <span class="inc"></span>
                                    <span class="check"></span>
                                    <span class="box"></span> 菜单权限
                                </label>
                            </div>
                            <div class="md-radio">
                                <input type="radio" id="checkbox2_9" name="type" class="md-radiobtn" value="1">
                                <label for="checkbox2_9">
                                    <span class="inc"></span>
                                    <span class="check"></span>
                                    <span class="box"></span> 操作权限
                                </label>
                            </div>
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
            </div>
        </form>
        <!-- END FORM-->
    </div>
</div>
<script>


    $(document).ready(function(){
        //初始化页面
        initPage();

        var change = $(".change");

        //进场动画
        change.hide();
        change.show("slow");

        //点击事件
        change.click(function(){
            var data = $(this).attr("data-val");
            $(this).parent().parent().find("input[type='text']").eq(0).val(data);
        });

        //获取当前排序
        $(".change-by-url").click(function(){
            var url = $("input[name='url']").val();
            url = url.substring(1,url.length);
            url.replace(/\//g, ":");
            console.log(url);
            $("input[name='shiro']").val(url);
        });

        //获取当前排序
        $(".change-order").click(function(){
            var parentId = $("input[name='parentId']").eq(0).val();
            if(parentId == ""){
                parentId = "0";
            }
            var input = $("input[name='sort']");
            tools.post("/power/countByParentId",{"parentId":parentId},function(data){
                input.val(++data);
            });
        });
    });


    /**
     * 选择父级权限
     */
    function chooseParent(){

        $.post("/power/listAll", {parentId:0}, function(html){
            window.layer_chooseParent = layer.open({
                id:"chooseParent",
                type: 1,
                title: "父级权限选择",
                area:['400px','600px'],
                content: html,
                anim:1,
                shadeClose:false,
                btn: ['确定', '取消'],
                yes: function(){
                    changeParent();
                    layer.close(layer_chooseParent)
                },
                cancel: function(){},
                btn2: function(){}
            });
        });
    }


    function save(){
        var param = tools.formParams("save-module");
        if(tools.valid("save-module")){
            tools.post("/power/save",param,function(data){
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