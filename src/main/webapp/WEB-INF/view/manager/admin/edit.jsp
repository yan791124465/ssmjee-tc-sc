<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!-- BEGIN FORM-->
<div class="portlet light">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red-sunglo bold uppercase">管理员编辑</span>
			<span class="caption-helper">修改资料</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
	<form action="#" class="form-horizontal" id="edit-module">
		<div class="form-body">

			<div class="form-group frist">
				<label class="col-md-3 control-label">用户头像</label>
				<div class="col-md-4">
					<img src="${data.head }" style="max-width: 200px;">
					<input type="hidden" name="head" value="${data.head }">
				</div>
			</div>

			<div class="form-group frist">
				<label class="col-md-3 control-label">昵称</label>
				<div class="col-md-4">
					<div class="input-icon">
						<i class="fa  fa-qq"></i>
						<input type="hidden" name="id" value="${data.id }">
						<input type="text" class="form-control" name="name" value="${data.name }" placeholder="昵称">
					</div>
				</div>
			</div>

			<div class="form-group last">
				<label class="col-md-3 control-label">用户邮箱</label>
				<div class="col-md-4">
					<div class="input-icon">
						<i class="fa  fa-hdd-o"></i>
						<input type="text" class="form-control" name="email" value="${data.email }"  placeholder="邮箱">
					</div>
				</div>
			</div>
									
			<div class="form-group last">
				<label class="col-md-3 control-label">用户电话</label>
				<div class="col-md-4">
					<div class="input-icon">
						<i class="fa  fa-mobile-phone "></i>
						<input type="text" class="form-control" name="phone" value="${data.phone }"  placeholder="电话">
					</div>
				</div>
			</div>
									
			<div class="form-group last">
				<label class="col-md-3 control-label">用户地址</label>
				<div class="col-md-4">
					<div class="input-icon">
						<i class="fa fa-home"></i>
						<input type="text" class="form-control" name="address" value="${data.address }"  placeholder="用户地址">
					</div>
				</div>
			</div>
													
			<div class="form-group last">
				<label class="col-md-3 control-label">用户身份证</label>
				<div class="col-md-4">
					<div class="input-icon">
						<i class="fa fa-smile-o"></i>
						<input type="text" class="form-control" name="idCard" value="${data.idCard }"  placeholder="身份证">
					</div>
				</div>
			</div>
							
			<div class="form-group last">
				<label class="col-md-3 control-label">用户性别</label>
				<div class="col-md-4">
					<div class="md-radio-inline">
						<div class="md-radio">
							<input type="radio" id="checkbox2_8" name="sex" class="md-radiobtn" value="1" ${data.sex==1?"checked":"" } >
							<label for="checkbox2_8">
								<span class="inc"></span>
								<span class="check"></span>
								<span class="box"></span> 男
							</label>
						</div>
						<div class="md-radio">
							<input type="radio" id="checkbox2_9" name="sex" class="md-radiobtn" value="0" ${data.sex==0?"checked":"" }>
							<label for="checkbox2_9">
								<span class="inc"></span>
								<span class="check"></span>
								<span class="box"></span> 女
							</label>
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
							<button type="button" class="btn green" onclick="edit();">修改</button>
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
            tools.post("/admin/update",param,function(data){
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
</script>
<!-- script 结束 -->