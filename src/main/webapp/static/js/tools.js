/*
 * js 工具类 用于获取参数提交、提醒等。
 * @author gx
 */

// ============================================ tools utils =========================================
var tools = function(){};

tools.paramToString = function(param){
    var paramString = "";
    for(var p in param){
        paramString += "&" + p + "=" + param[p+""];
    }
    return paramString;
};

/**
 * 获取form表单参数
 * @param _formId form表单ID
 * @returns {{}} 参数对象
 */
tools.formParams = function(_formId) {

    var nodes = $("#" + _formId).find("input[type='text'],input[type='password']" +
    		",input[type='hidden'],input[type='radio']:checked," +
        	"input[type='checkbox']:checked,textarea,select");
    var params = {};
    
    for (var i = 0; i < nodes.length; i++) {
    	//当前表单
        var e = $(nodes[i]);
        //表单name
        var name = e.attr("name");
        //如果有name
        if(name !== undefined){
            //如果没有同名数据
            if (params[name] === undefined) {
                params[name] = e.val();
            } else {
                //同名表单用逗号拼接
                params[name] += "," + e.val();
            }
        }
        //没有name属性的表单将会被忽略
    }
    return params;
};

tools.valid = function(formId){
    return $("#" + formId).valid();
};


/**
 * 异常返回时候用到的提示
 * @param code 异常代号
 * @param msg 异常说明
 */
tools.errorTip = function(code,msg) {

    if(code === -1) { //登陆超时
        layer.msg('登陆超时！请重新登录！', function(){
            window.location.href="/login"
        });
    }else{
        layer.msg("操作失败！原因：" + msg + "(" + code + ")", {icon: 2,time:1000});
    }
};

/**
 * ajax post 提交方法 异步
 * @param _url 地址
 * @param _param 参数
 * @param _success 成功回调
 */
tools.post = function(_url,_param,_success) {
    var time;
    $.ajax({
        url: _url,
        type: "post",
        data: _param,
        dataType: "json",
        async: true,
        success: _success,
        error: function (XMLHttpRequest, textStatus) {
            layer.msg("请求出错！提示：" + XMLHttpRequest.responseText + "("+textStatus+")", {icon: 2,time:3000});
            //_success(XMLHttpRequest.responseText);
            //console.log(error);
        },
        beforeSend: function () {
            window.layer_load = layer.load(0, {time: 3*1000});
            time = new Date().getTime();
        },
        complete: function (XMLHttpRequest, textStatus) {
            layer.close(layer_load);
            var time2 = new Date().getTime();
            console.log("返回状态：" + textStatus + ";耗时：" + (time2 - time) + "毫秒;");
        }
    });
};


/**
 * 加载页面用 异步
 * @param _url 地址
 * @param _param 参数
 * @param _success 成功回调
 */
tools.loadPage = function(_url,_param,_success) {
    var time;
    $.ajax({
        url: _url,
        type: "post",
        data: _param,
        dataType: "html",
        async: true,
        success: _success,
        error: function (XMLHttpRequest, textStatus) {
            layer.msg("请求出错！提示：" + XMLHttpRequest.responseText + "("+textStatus+")", {icon: 2,time:3000});
            //_success(XMLHttpRequest.responseText);
            //console.log(error);
        },
        beforeSend: function () {
            window.layer_load = layer.load(0, {time: 3*1000});
            time = new Date().getTime();
        },
        complete: function (XMLHttpRequest, textStatus) {
            layer.close(layer_load);
            var time2 = new Date().getTime();
            console.log("返回状态：" + textStatus + ";耗时：" + (time2 - time) + "毫秒;");
        }
    });
};

/**
 * ajax get 提交方法 异步
 * @param _url 地址
 * @param _param 参数
 * @param _success 成功回调
 */
tools.get = function (_url, _param, _success) {
    var time;
    $.ajax({
        url: _url,
        type: "get",
        data: _param,
        dataType: "json",
        async: true,
        success: _success,
        error: function (XMLHttpRequest, textStatus) {
            layer.msg("请求出错！提示：" + XMLHttpRequest.responseText + "("+textStatus+")", {icon: 2,time:3000});
            //_success(XMLHttpRequest.responseText);
            //console.log(error);
        },
        beforeSend: function () {
            window.layer_load = layer.load(0, {time: 3*1000});
            time = new Date().getTime();
        },
        complete: function (XMLHttpRequest, textStatus) {
            layer.close(layer_load);
            var time2 = new Date().getTime();
            console.log("返回状态：" + textStatus + ";耗时：" + (time2 - time) + "毫秒;");
        }
    });
};

