<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/03/20
  Time: 下午 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="ssm" uri="http://ssm.elangzhi.com/jsp/tag/functions" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>后台服务中心</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="后台服务中心"/>
    <meta content="" name="GaoXiang"/>
    <jsp:include page="../body/link-page.jsp"/>
</head>
<!-- END HEAD -->
<body class="fade-in-up page-content-white">

<!-- BEGIN CONTAINER -->
<div class="page-container">

    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-paper-plane font-green-haze"></i>
                <span class="caption-subject bold font-green-haze uppercase">WebSocket</span>
                <span class="caption-helper"> 即时通讯测试 </span>
            </div>
            <div class="tools">
                <a href="javascript:void(0);" class="collapse" data-original-title="收起" title="收起"></a>
                <a href="javascript:void(0);" class="fullscreen" data-original-title="全屏" title="全屏"></a>
            </div>
        </div>
        <div class="portlet-body">

            <div class="row">
                <div class="col-md-6 ">
                    <fieldset>
                        <legend id="connTitle">正在连接服务器...</legend>
                    </fieldset>
                    <button id="connect" class="btn btn-success" onclick="connect()">连接</button>
                    <button id="disconnect" class="btn btn-danger" onclick="disconnect()">断开连接</button>
                    <button id="allUsers" class="btn btn-primary" onclick="showall()">获取当前在线</button>
                    <button id="clear" class="btn btn-info" onclick="clearDiv()">清空消息记录</button>
                    <hr>
                    <!-- BEGIN SAMPLE FORM PORTLET-->
                    <div class="portlet  box blue-hoki">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i> 发送给服务器
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="form-body">

                                <div class="input-group">
                                    <span class="input-group-addon"> <i class="fa fa-envelope"></i> </span>
                                    <input id="message" title="contentText" class="form-control" placeholder="输入内容"/>
                                </div>
                                <br>
                                <button onclick="sendName()" class="btn btn-primary">发送消息给服务器</button>
                            </div>
                        </div>
                    </div>
                    <div class="portlet  box red-sunglo">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i> 发送消息
                            </div>
                        </div>
                        <div class="portlet-body ">
                            <div class="form-body">
                                <div class="radio-list">

                                    <div class="icheck-inline">
                                        <label class="inline">在线列表：</label>
                                        <div class="inline" id="onLineList">

                                        </div>

                                    </div>
                                </div>
                                <br>
                                <div class="input-group input-medium">
                                    <span class="input-group-addon"> <i class="fa fa-user"></i> </span>
                                    <input id="accountValue" title="accountText" class="form-control"
                                           placeholder="用户登陆名"/>
                                </div>
                                <br>
                                <div class="input-group">
                                    <span class="input-group-addon"> <i class="fa fa-envelope"></i> </span>
                                    <input id="messageValue" title="contentText" class="form-control"
                                           placeholder="输入内容"/>
                                </div>
                                <br>
                                <button onclick="sendMessage('1')" class="btn btn-primary">发送给指定人</button>
                                <button onclick="sendMessage('0')" class="btn btn-info">发送给所有人</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 ">
                    <!-- BEGIN SAMPLE FORM PORTLET-->
                    <div class="portlet  box blue">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i> 接收的消息
                            </div>
                        </div>
                        <div class="portlet-body ">
                            <div class="form-body" style="height: 500px;overflow: scroll;">
                                <div id="response"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

</div>

<jsp:include page="../body/javascript-page.jsp"/>
<script type="text/javascript">

    $(document).ready(function () {
        connect();

        //setConnected(window.socket != undefined);
    });

    function setConnected(connected) {
        document.getElementById('connect').disabled = connected;
        document.getElementById('disconnect').disabled = !connected;
        document.getElementById('response').innerHTML = '';
        if (connected) {
            $("#connTitle").text("已连接");
        } else {
            $("#connTitle").text("已断开");
        }
    }


    function connect() {

        var host = window.location.host + "/webSocket";
        //var host = "60.205.169.174:8080";
        if ('WebSocket' in window) {

            window.socket = new WebSocket("ws://" + host);

            socket.onopen = function (evnt) {
                setConnected(true);
            };

            socket.onclose = function (evnt) {
                console.log('连接已关闭！');
                alert("连接已关闭");
                setConnected(false);
            };

            socket.onmessage = function (evt) {
                var received_msg = JSON.parse(evt.data);
                showMessage("[" + received_msg["userName"] + "]:" + received_msg["message"], "green");
                console.log('已接收');
            };
            socket.onerror = function (evnt) {
                console.log("webSocket Error");
            };
        } else {
            console.log('不支持 new WebSocket 方式连接！');
        }
    }

    function disconnect() {
        socket.close();
        window.socket = undefined;
    }

    function sendName() {
        var message = $("#message").val();
        socket.send(message);
    }

    function sendMessage(type) {
        var message = $("#messageValue").val();
        var toUser = $("#accountValue").val();

        if (type == "1") {
            tools.post("/socket/sta", {'message': message, 'toUser': toUser}, function (data) {
                console.log(data)
            })
        } else {
            tools.post("/socket/stall", {'message': message}, function (data) {
                console.log(data)
            })
        }
        showMessage("[${sessionScope.account.userName}]:" + message, "red");
    }

    function showall() {
        tools.post("/socket/getAll", null, function (data) {
            $("#onLineList").html("");
            for (var user in data) {
                console.log(data[user]);
                var label = $("<label> <input type='radio' value='" + data[user] + "' name='onlineUser' onclick='accountValue.value=this.value'  class='icheck' >" + data[user] + "  </label>");
                label.appendTo($("#onLineList"));
            }

            console.log(data);
        });
    }

    function clearDiv() {
        $("#response").html("");
    }

    function showMessage(message, color) {
        var response = document.getElementById('response');
        var p = document.createElement('p');
        p.style.wordWrap = 'break-word';
        if (color != undefined) p.style.color = color;
        p.appendChild(document.createTextNode(message));
        response.appendChild(p);
    }

    /*
     1. new WebSocket('ws://localhost:8080//webSocket')尝试与服务器建立连接;
     2. 握手成功并建立连接后，socket.onopen被调用
     3. 当接收来自服务器的消息，socket.onmessage被调用
     4. socket.send()用来发送消息至服务端
     */
</script>
</body>
</html>