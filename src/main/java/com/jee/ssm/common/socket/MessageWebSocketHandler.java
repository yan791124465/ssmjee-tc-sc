package com.jee.ssm.common.socket;

import com.jee.ssm.common.config.Const;
import com.jee.ssm.model.Account;
import com.jee.ssm.common.config.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * @author GaoXiang
 * @version 1.0
 * @since 2016/11/7.
 */
class MessageWebSocketHandler extends TextWebSocketHandler {

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        Account account = (Account) session.getAttributes().get(Const.ACCOUNT);
        Logger.socket(" 收到消息 === > [" + account.getUserName() + "]" + message.getPayload());
        Logger.socket(" 消息来自 === > [" + session.getAttributes().get(Const.WEBSOCKET_ID) + "]");
        /*TextMessage returnMessage = new TextMessage("服务器已收到！");
        session.sendMessage(returnMessage);*/
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        Account account = (Account) session.getAttributes().get(Const.ACCOUNT);
        Logger.socket("成功链接[" + account.getUserName() + "]");

        WSSUtil.put(account.getUserName(), session);
        super.afterConnectionEstablished(session);
    }

    //抛出异常时处理
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        if (session.isOpen()) {
            session.close();
        }
        Account account = (Account) session.getAttributes().get(Const.ACCOUNT);
        WSSUtil.remove(account.getUserName());
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        Logger.socket("会话关闭之后...");
        Account account = (Account) session.getAttributes().get(Const.ACCOUNT);
        WSSUtil.remove(account.getUserName());
        super.afterConnectionClosed(session, status);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }


}
