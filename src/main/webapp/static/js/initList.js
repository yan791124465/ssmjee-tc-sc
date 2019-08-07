
var option = {};

/**
 * 初始化入口
 * @param _option 相关配置
 */
function initList(_option){

    option = _option;

    //初始化按钮点击事件
    initClick();

    //获取table绑定的数据
    var table = $("#" + option["table"]);
    initPageParam(table);

}


/**
 * 主要用来初始化添加和编辑页面
 */
function initPage(){
    //bootstrap-select 插件
    if ($().selectpicker) {
        $(".bs-select").selectpicker({iconBase:"fa",tickIcon:"fa-check"})
    }

    //bootstrap-datetimepicker 插件
    if ($().datetimepicker) {
        $('.bs-date').datetimepicker({
            format: 'yyyy/mm/dd',
            autoclose: true,
            todayBtn: true,
            todayHighlight:true
        });
        $('.bs-datetime').datetimepicker({
            format: 'yyyy/mm/dd HH:ii:ss',
            autoclose: true,
            todayBtn: true,
            todayHighlight:true
        });
    }
}


/**
 * 重设分页参数；
 * @param table 表格对象
 */
function initPageParam(table){
    //分页插件用
    option["pageSize"] = table.data("pageSize");
    option["currentPage"] = table.data("currentPage");
    option["visiblePages"] = table.data("visiblePages");
    option["totalCounts"] = table.data("totalCounts");

    //自取 总页数
    option["pageCounts"] = table.data("pageCounts");

    //初始化显示数据
    $("span.show-page-total").text(option["totalCounts"]);
    $("span.show-page-count").text(option["pageCounts"]);
    $("span.show-page-current").text(option["currentPage"]);
    $("span.show-page-begin").text((option["currentPage"] - 1) * option["pageSize"] + 1);

    //重新生成分页
    initPagination();

}

/**
 * 初始化分页插件
 */
function initPagination(){

    $('#pagination').jqPaginator(getPaginationOption());

    //添加跳页模块
    addGoPage();

    //添加表格内点击事件和跳页点击事件
    initClickTable();
}

/**
 * 为分页追加跳转页面的功能
 */
function addGoPage(){
    var li = "<li><input type=\"text\" id=\"goText\" class=\"form-control input-xsmall input-go-page\" value=\""
        + option["currentPage"] + '/' + option["pageCounts"]
        + "\" placeholder=\"页码\" onclick=\"$(this).val('');\"><a class=\"btn-go\">跳转</a></li>";
    $("#pagination").append($(li));

}

/**
 * 初始化绑定操作
 */
function initChoose() {
    var table = $('#table');
    //全选
    $(".checkbox-all").click(function () {
        var group = $(this);
        table.find(".checkbox-child").each(function () {
            var isCheck = group.is(":checked");
            $(this).prop('checked', isCheck);
            isCheck ? $(this).parents('tr').addClass("active") : $(this).parents('tr').removeClass("active");
        });
    });

    //选择一行
    $(".checkbox-child").click(function () {
        var isCheck = $(this).is(":checked");
        isCheck ? $(this).parents('tr').addClass("active") : $(this).parents('tr').removeClass("active");
    });

    //点击每一行空白处 标记 table-notr class 的表格不加载此点击事件
    if(!table.hasClass("table-notr")){
        table.find("tbody tr").click(function (e) {
            var targetElement = e.target.nodeName;
            //如果是checkbook标签 则不执行以下内容（和自身点击事件冲突）
            if (!(targetElement === "SPAN\nINPUT")) {
                var checkbox = $(this).find(".checkbox-child").eq(0);
                var isCheck = checkbox.is(":checked");
                if (isCheck) {
                    checkbox.prop('checked', false);
                    $(this).removeClass("active");
                } else {
                    checkbox.prop('checked', true);
                    $(this).addClass("active");
                }
            }
        });
    }
}


/**
 * 按钮点击事件
 */
function initClick() {

    //重置
    $(".btn-tools-reset").click(function(){
        var urlParam = $(this).data("urlParam");
        window.location.href = option["url"] + "?t=" + new Date().getTime() + urlParam;
    });

    //刷新
    $(".btn-tools-refresh").click(function(){
        toPage(null);
    });

    //搜索按钮
    $(".btn-tools-search").click(function(){
        toPage(1);
    });

    //添加 按钮
    $(".btn-module-add").click(function(){
        addModule();
    });

    //批量删除按钮
    $(".btn-module-delete-all").click(function(){
        deleteByIds();
    });

    //更改每页显示数量之后
    $("#pageSize").change(function(){

        option["pageSize"] = parseInt($("#pageSize").val());
        toPage(1);
    });

}

/**
 * 表格内部按钮操作初始化
 */
function initClickTable(){

    //初始化勾选框
    initChoose();

    //编辑/查看 按钮
    $(".btn-module-edit").click(function(){
        try {
            var id = $(this).data("id");
        } catch (e) {
            layer.msg("执行失败！请在编辑标签上增加 data-id 列存放数据id！", {icon: 2,time:1000});
        }
        editModule(id);
    });

    //删除按钮
    $(".btn-module-delete").click(function(){
        try {
            var id = $(this).data("id");
        } catch (e) {
            layer.msg("执行失败！请在删除标签上增加 data-id 列存放数据id！", {icon: 2,time:1000});
        }
        deleteById(id);
    });


    //自定义跳页
    $(".btn-go").click(function(){
        var num = parseInt($("#goText").val());
        var pageCount = 0;
        if(isNaN(num)){
            layer.msg("请输入正确的数字！");
            return;
        }

        //计算总页数
        if(option["totalCounts"] % option["pageSize"] ===0 ){
            pageCount = option["totalCounts"] / option["pageSize"];
        }else{
            pageCount = option["totalCounts"] / option["pageSize"] + 1;
        }
        if(num > pageCount  || num <= 0){
            layer.msg("不能大于总页数或小于等于0！");
            return;
        }

        toPage(num);
    });
}

/**
 * 获取分页插件参数
 * @returns {{pageSize: *, totalCounts: *, visiblePages: *, currentPage: *, first: string, prev: string, next: string, last: string, page: string, onPageChange: onPageChange}} 参数
 */
function getPaginationOption(){

    var pageSize =  option["pageSize"];
    var currentPage =  option["currentPage"];
    //var totalPages =  option["totalPages"];
    var visiblePages =  option["visiblePages"];
    var totalCounts =  option["totalCounts"];

    if(totalCounts === 0){
        totalCounts = 1;
    }
    if(pageSize === 0){
        pageSize = totalCounts;
    }

    return {
        //totalPages: totalPages,
        pageSize: pageSize,
        totalCounts: totalCounts,
        visiblePages: visiblePages,
        currentPage: currentPage,
        first: "<li class=\"first\"><a href=\"javascript:void(0);\">首页</a></li>",
        prev: "<li class=\"prev\"><a href=\"javascript:void(0);\">上一页</a></li>",
        next: "<li class=\"next\"><a href=\"javascript:void(0);\">下一页</a></li>",
        last: "<li class=\"last\"><a href=\"javascript:void(0);\">尾页</a></li>",
        page: "<li class=\"page\"><a href=\"javascript:void(0);\">{{page}}</a></li>",
        onPageChange: function (num, type) { //页码更改事件

            if(type === "change"){
                toPage(num);
            }
        }
    }
}

/**
 * 跳转到页面
 * @param num 目标页码
 */
function toPage(num){
    var param = tools.formParams("table-param");
    if(num === undefined || num === null || num === ""){
        try {
            num = parseInt($("#goText").val());
        } catch (e) {
            num = 1;
        }
        if(isNaN(num)){
            num = 1;
        }
    }
    param["page"] = num;
    param["size"] = option["pageSize"];
    delNullParam(param);

    if(option["ajax"]){
        tools.loadPage(option["url"] + "?t=" + new Date().getTime(),param,function(data){

            var table = "#" + option["table"];
            $(table).html($(data).find(table).html());
            option["currentPage"] = parseInt(num);
            //更新分页数据
            initPageParam($(data).find(table));

        })
    }else{
        var paramString = tools.paramToString(param);
        window.location.href = option["url"] + "?t=" + new Date().getTime() + paramString;
    }
}

/**
 * 删除没有值的参数
 * @param param 要清空的参数
 */
function delNullParam(param){

    for(var p in param){
        if(param[p+""] === ""){
            delete param[p+""];
        }
    }
}


/**
 * 获取勾选了多少
 * @returns {Array}
 */
function getIds(checks){
    var ids = [];
    checks.each(function(){
        ids.push($(this).val());
    });
    return ids;
}

