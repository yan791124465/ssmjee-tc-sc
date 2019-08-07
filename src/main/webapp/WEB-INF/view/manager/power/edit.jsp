<%--
  Created by IntelliJ IDEA.
  User: GaoXiang
  Date: 2016/5/6 0006
  Time: 下午 12:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- BEGIN FORM-->
<div class="portlet light bg-inverse">
    <div class="portlet-title">
        <div class="caption">
            <span class="caption-subject font-red-sunglo bold uppercase">权限编辑</span>
            <span class="caption-helper">不要乱选父级权限</span>
        </div>
    </div>
    <div class="portlet-body form">
        <!-- BEGIN FORM-->
        <form action="#" class="form-horizontal" id="edit-module">
            <div class="form-body">
                <div class="form-group last">
                    <label class="col-md-3 control-label">父级权限</label>
                    <div class="col-md-5">
                        已选择：<span id="powerNameShow" class="form-control-static" style="color:blue;">隐藏(编号：${data.parentId })</span>
                        <input type="hidden" name="parentId" value="${data.parentId }">
                        <a class="btn btn-info  pull-right" href="javascript:chooseParent();">选择父级权限</a>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限ID</label>
                    <div class="col-md-4">
                        <label style="margin-top:7px;;">${data.id }</label>
                        <input type="hidden" name="id" value="${data.id }">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限名称</label>
                    <div class="col-md-5">
                        <div class="input-icon">
                            <i class="fa  fa-qq"></i>
                            <input type="text" class="form-control" value="${data.name }" name="name" placeholder="权限名称">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限图标</label>
                    <div class="col-md-5">
                        <div class="input-icon">
                            <i class="fa  fa-smile-o "></i>
                            <input type="text" class="form-control" value="${data.icon }"  name="icon" placeholder="权限图标">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限URL</label>
                    <div class="col-md-5">
                        <div class="input-icon">
                            <i class="fa fa-anchor"></i>
                            <input type="text" class="form-control" value="${data.url }"  name="url"  placeholder="/controller/method">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限标识</label>
                    <div class="col-md-5">
                        <div class="input-icon">
                            <i class="fa fa-anchor"></i>
                            <input type="text" class="form-control" value="${data.shiro }"  name="shiro"  placeholder="权限标识">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限参数</label>
                    <div class="col-md-5">
                        <div class="input-icon">
                            <i class="fa fa-anchor"></i>
                            <input type="text" class="form-control" value="${data.param }"  name="param"  placeholder="权限参数：&page=1&size=10">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限排序</label>
                    <div class="col-md-5">
                        <div class="input-icon">
                            <i class="fa fa-arrows-v"></i>
                            <input type="text" class="form-control" value="${data.sort }"  name="sort"  placeholder="0">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限简介</label>
                    <div class="col-md-5">
                        <div class="input-icon">
                            <i class="fa fa-book"></i>
                            <input type="text" class="form-control" value="${data.intro }"  name="intro"  placeholder="权限简介">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">权限类型</label>
                    <div class="col-md-5">
                        <div class="md-radio-inline">
                            <div class="md-radio">
                                <input type="radio" id="checkbox2_8" name="type" class="md-radiobtn" value="0" ${data.type==0?"checked":"" } >
                                <label for="checkbox2_8">
                                    <span class="inc"></span>
                                    <span class="check"></span>
                                    <span class="box"></span> 菜单权限
                                </label>
                            </div>
                            <div class="md-radio">
                                <input type="radio" id="checkbox2_9" name="type" class="md-radiobtn" value="1" ${data.type==1?"checked":"" }>
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
                                    <button type="button" class="btn green" onclick="edit();">修改</button>
                                    <button type="button" class="btn default" onclick="layer.close(layer_editModule);">取消</button>
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

    $(function(){
        //初始化页面
        initPage();
    });

    function edit(){
        var param = tools.formParams("edit-module");
        if(tools.valid("edit-module")){
            tools.post("/power/update",param,function(data){
                if(data.success){
                    layer.msg('修改成功', {icon: 1,time:1000},function(){
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
                yes: function(index, layero){
                    changeParent();
                    layer.close(layer_chooseParent)
                },
                cancel: function(){},
                btn2: function(index, layero){}
            });
        });
    }

</script>
