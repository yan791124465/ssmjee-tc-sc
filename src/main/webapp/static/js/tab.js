/**
 * 自定义导航标签页。
 * 基于bootstrap 标签页（Tab）插件的二次开发，每个标签生成了随机ID，但是主要判断依据还是URL，id用来删除(Tab插件必须要有id)。
 * 1， 重新打开已经打开的标签直接跳转。
 * 2，手动切换选项卡不会刷新标签页。
 * 3，权限菜单使用createPowerNavTab(Object:obj)方法来打开标签页。
 * 4，用户自己开启一个标签可以调用 createNewTab(tabTitle:string,loadUrl:string) 方法。
 */

/**
 * 标签栏 ul
 */
var navTabs ;

/**
 * 页面容器 div
 */
var tabContent ;

$(function(){

    //初始化
    navTabs = $("#navTabs");
    tabContent = $("#tabContent");

    //绑定 a 标签 点击事件
    $(".nav-power").on("click",function(){
        createNewTab(this);
        return false;
    });

    console.info("小伙子，你要干嘛~ =￣ω￣= ");
});


/**
 * 用户自己新建标签 调用此方法即可
 * @param obj 标签信息
 */
function createNewTab(obj){

    // 获取标题 、url 和 参数
    var title = $(obj).text();
    var url = $(obj).attr("href");
    var paramString = $(obj).data("param");

    // 待完成的权限标签
    if(url === "#"){ layer.msg("此功能完善中... 敬请期待！");  return; }

    // 判断是否已经打开该标签，如果已经打开过，则切换到该标签并刷新。
    if(isHave(url)){
        //切换到该标签
        navTabs.find("a[data-url='"+url+"']").tab('show');
        return;
    }

    // 创建新的标签页并加载
    createTabContent(title,url,paramString);
}


/**
 * 关闭标签页
 * @param obj 当前关闭按钮
 */
function closeTabNav(obj){
    closeTab($(obj).parent().data("id"));
    autoDrop();
}

/**
 * 关闭指定ID的标签页
 * @param liId
 */
function closeTab(liId){

    var a = $("#navTabs").find("a[data-id='"+ liId +"']");
    var url = a.data("url");
    if(url !== undefined && url !== "/home"){
        var li = a.parent();
        //判断，如果是当前标签。显示其它标签。
        if(li.hasClass("active")){
            li.prev().find("a").tab("show");
        }
        //移除Li
        li.remove();
        //获取div 移除
        $("#tab_"+liId).remove();
    }

}

/**
 * 创建新的标签页并加载
 * @param tabTitle 标题
 * @param loadUrl 请求地址
 * @param paramString  预备参数
 */
function createTabContent(tabTitle,loadUrl,paramString){

    //生成唯一识别ID，关闭标签用
    var loadID = new Date().getTime();
    //创建点击用的a标签
    var tabNavLiA = $("<a href=\"#tab_"+loadID+"\" data-toggle=\"tab\" aria-expanded=\"false\" data-id=\""+loadID+"\" data-url=\""+loadUrl+"\"></a>");
    //创建导航标签
    $("<span title=\"" + tabTitle + "\"> " + tabTitle + " </span>").appendTo(tabNavLiA);
    //创建关闭按钮
    $("<i class=\"fa fa-times tab-close\" onclick=\"closeTabNav(this)\"></i>").appendTo(tabNavLiA);
    //创建li包含a 放入导航栏
    $("<li></li>").append(tabNavLiA).appendTo(navTabs);

    var url = "";
    if(loadUrl.indexOf("http") === 0){
        url = loadUrl;
    }else if(loadUrl.indexOf("/") === 0){
       url = loadUrl + "?t=" + new Date().getTime() + paramString;
    }

    //创建主体并加载内容
    var iframe = $("<iframe src=\""+url+"\" frameborder=\"0\" class=\"iframe-item tab-pane\" id=\"tab_"+loadID+"\" seamless></iframe>");
    iframe.appendTo(tabContent);

    //打开这个标签
    tabNavLiA.tab("show");

    autoDrop();
}

/**
 * 判断当前是否已存在要打开的链接标签
 * @param url 检测的url
 */
function isHave(url){
    if(navTabs.find("a[data-url='"+url+"']").length > 0){
        return true;
    }
}

/**
 * 关闭当前显示的标签
 * 主页不可关闭
 */
function closeNowTab(){
    var a = navTabs.find("li.active").find("a");
    var url = a.data("url");
    if(url != undefined && url != "/home"){
        var id = a.data("id");
        closeTab(id);
    }else if(url == "/home"){
        layer.msg("不能关闭主页！");
    }
    closeTab(id);
}

/**
 * 关闭除去主页的所有标签
 */
function  closeAllTab() {
    var tabs = navTabs.find("a");
    tabs.each(function(){
        var id = $(this).data("id");
        closeTab(id);
    })
}


/**
 * 刷新当前显示的标签
 */
function refreshNowTab(){
    var id = findNowNavTab();
    reloadTab(id);
}

/**
 * 获取当前正在显示的标签
 * @returns {jQuery}
 */
function findNowNavTab(){
    return navTabs.find("li.active").find("a").data("id");
}

/**
 * 刷新指定标签页
 */
function reloadTab(id){
    var src = $('#tab_'+id).attr('src');
    $('#tab_' + id).attr('src' , src);
}

/**
 * 获取显示的标签条UL的长度
 * @returns {jQuery}
 */
function countNavTabsWidth(){
    return navTabs.width();
}

/**
 * 统计打开的li的总长度
 */
function countNavTabsLisSumWidth(){
    var lis = navTabs.find("li");
    var width = 0;
    lis.filter(function(index){
        if( lis.eq(index).parent().attr("id") === "navTabs"){
            width += lis.eq(index).width();
        }
    });
    return width;
}

/**
 * 自动整理标签隐藏或显示
 */
function autoDrop(){
    var dropTabs = $("#dropdownTabs");
    var ntw = countNavTabsWidth();
    var ntlw = countNavTabsLisSumWidth();
    var ntdc = dropTabs.find("li").length;
    if((ntw - ntlw) < 25){
        var last = navTabs.find("li:last").appendTo(dropTabs);
        last.appendTo(dropTabs);
        last.tab("show");
    }else{
        if(ntdc > 0){
            //var fw = dropTabs.find("li:first").width();
            if(175 < (ntw - ntlw)){
                var lf = dropTabs.find("li:first");
                lf.appendTo(navTabs);
                if(lf.hasClass("active")){
                    dropTabs.parent().removeClass("active");
                }
                autoDrop();
            }
        }
    }
    aotuCountHide();
}

/**
 * 改变大小的时候显示或者隐藏标签
 */
$(window).resize(function(){
    autoDrop();
});

/**
 * 自动统计剩余未展示标签数量
 */
function aotuCountHide(){
    var showCountSpan = $("#dropLiCount");
    var count = $("#dropdownTabs").find("li").length;
    showCountSpan.text(count);
    if(count === 0){
        showCountSpan.parent().parent().removeClass("open");
    }
}
