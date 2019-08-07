<%--
  Created by IntelliJ IDEA.
  User: gaoxiang
  Date: 2017/2/25
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<div id="tree_1" class="tree-demo">
    <ul>
        <li data-jstree='{ "opened" : true ,"icon" : "fa fa-asterisk fa-spin icon-state-info"}' data-id="0" data-name="顶级目录">
            顶级权限
            <ul>
                <c:forEach var="item" items="${powerList}" varStatus="status">
                    <li data-id="${item.id}" data-jstree='{"icon" : "${item.icon}"}'>
                        ${item.name}
                        <c:if test="${item.powers.size() > 0}">
                            <ul>
                                <c:forEach var="item2" items="${item.powers}" varStatus="status2">
                                    <li data-id="${item2.id}" data-jstree='{ "selected" : ${item2.belong == null ? "false":"true"},"icon" : "${item2.icon}" }'>
                                        ${item2.name}
                                        <c:if test="${item2.powers.size() > 0}">
                                            <ul>
                                                <c:forEach var="item3" items="${item2.powers}" varStatus="status3">
                                                    <li data-id="${item3.id}" data-jstree='{ "selected" : ${item3.belong == null ? "false":"true"},"icon" : "${item3.icon}" }'>
                                                            ${item3.name}
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:if>
                    </li>
                </c:forEach>
            </ul>
        </li>
    </ul>
</div>

<script>

    $("#tree_1").ready(function(){
        $("#tree_1").jstree({
            'plugins': [ "checkbox", "types"],
            "core" : {
                "themes" : {
                    "responsive": false
                }
            }
        });
    });

    /**
     * 获取全部选中节点
     */
    function getAllCheckedPower(){
        var checkedArray = new Array();

        /**
         * 获取选中节点
         * */
        var checkeds = $('#tree_1').jstree().get_checked(true);
        for(var c in checkeds){
            checkedArray.push(checkeds[c].data["id"]);
        }

        /**
         * 获取父级节点
         */
        $("#tree_1").find("li").each(function(){
            var lii = $(this).find("a").eq(0).find("i").eq(0);
            if(lii.hasClass("jstree-undetermined")){
                var id = $(this).data("id");
                if(id != undefined){
                    checkedArray.push(id);
                }
            }
        });

        return checkedArray;
    }
</script>
