package com.jee.ssm.common.socket;

import java.util.Map;

import com.jee.ssm.common.config.Const;
import com.jee.ssm.model.Account;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import javax.servlet.http.HttpSession;

/**
 * 握手拦截器
 * 用来拦截和处理客户端和服务器端分别在握手前和握手后的事件
 * @author GaoXiang
 * @version 1.0
 * @since 2016/11/7.
 */
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{

    @Override
    public boolean beforeHandshake(ServerHttpRequest request,
                                   ServerHttpResponse response, WebSocketHandler wsHandler,
                                   Map<String, Object> attributes) throws Exception {
        //Logger.socket("请求握手之前...");
        Account account = (Account) getSession(request).getAttribute(Const.ACCOUNT);
        attributes.put(Const.WEBSOCKET_ID,account.getId());
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }



    @Override
    public void afterHandshake(ServerHttpRequest request,
                               ServerHttpResponse response, WebSocketHandler wsHandler,
                               Exception ex) {
        //Logger.socket("请求握手之后...");
        super.afterHandshake(request, response, wsHandler, ex);
    }

    /**
     * 用来获取session
     * @param request 请求
     * @return session
     */
    private HttpSession getSession(ServerHttpRequest request) {
        if(request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest serverRequest = (ServletServerHttpRequest)request;
            return serverRequest.getServletRequest().getSession(this.isCreateSession());
        } else {
            return null;
        }
    }

}