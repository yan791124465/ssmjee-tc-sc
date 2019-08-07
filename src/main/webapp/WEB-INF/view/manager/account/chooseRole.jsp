<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<div id="tree_2" class="tree-demo">
	<ul>
		<li data-jstree='{ "opened" : true ,"icon" : "fa fa-asterisk fa-spin icon-state-info"}' data-id="0" data-name="顶级目录">
			 顶级目录（Root）
			 <ul>
				 <c:forEach var="item" items="${roleList}" varStatus="status">
			 	 	<li  data-id="${item.id}"  data-jstree='{ "selected" : ${item.belong == null ? "false":"true"} }'>
							${item.name}
					</li>
				 </c:forEach>
			</ul>
			 
		</li>
	</ul>
</div>

<script>
$('#tree_2').jstree({
    "core" : {
        "themes" : {
            "responsive": false
        }            
    },
    'plugins': ["checkbox"] 
});



/**
 * 获取全部选中节点
 */
function getAllCheckedRole(){
    var checkedArray = new Array();

    /**
     * 获取选中节点
     * */
    var checkeds = $('#tree_2').jstree().get_checked(true);
    for(var c in checkeds){
        checkedArray.push(checkeds[c].data["id"]);
    }


    return checkedArray;
}
</script>