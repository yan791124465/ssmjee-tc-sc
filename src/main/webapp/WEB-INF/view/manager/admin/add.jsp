<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!-- BEGIN FORM-->
<div class="portlet light">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red-sunglo bold uppercase">管理员添加</span>
			<span class="caption-helper">添加一个权限为空的管理员（未授权之前只能看主页）</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
	<form action="#" class="form-horizontal" id="save-module">
		<div class="form-body">

			<div class="form-group frist">
				<label class="col-md-3 control-label">用户名</label>
				<div class="col-md-4">
					<div class="input-icon">
						<i class="fa  fa-qq"></i>
						<input type="text" class="form-control" required minlength="5" name="userName" placeholder="用户名">
						<input type="hidden" name="head" value="/images/account/default_head.jpg">
						<input type="hidden" name="id" value="${longId}">
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label class="col-md-3 control-label">请输入密码</label>
				<div class="col-md-4">
					<div class="input-icon">
						<i class="fa fa-lock"></i>
						<input type="password" class="form-control" required minlength="6"  id="rePassword-add" placeholder="密码">
					</div>
				</div>
			</div>

			<div class="form-group last">
				<label class="col-md-3 control-label">再次输入密码</label>
				<div class="col-md-4">
					<div class="input-icon">
						<i class="fa fa-lock"></i>
						<input type="password" class="form-control"  required equalTo="#rePassword-add" onfocus="md5SetPwd();" onblur="md5SetPwd2()" name="password"  placeholder="再次输入密码">
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
	</form>
	<!-- END FORM-->
	</div>
</div>

<script>

	function md5SetPwd(){
        var md5 = $.md5($("#rePassword-add").val());
        $("#rePassword-add").val(md5);
    }

	function md5SetPwd2(){
        var md5 = $.md5($("input[name='password']").eq(0).val());
        $("input[name='password']").eq(0).val(md5);
    }


    $(function(){
        //初始化页面
        initPage();
    });

    function save(){
        var param = tools.formParams("save-module");
        if(tools.valid("save-module")){
            tools.post("/admin/save",param,function(data){
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