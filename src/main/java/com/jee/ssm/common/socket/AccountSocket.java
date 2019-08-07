package com.jee.ssm.common.socket;

import com.jee.ssm.model.Account;
import org.springframework.web.socket.WebSocketSession;

/**
 * @author GaoXiang
 * @version 1.0
 * @since 2016/11/7.
 */
public class AccountSocket extends Account {

    public AccountSocket(){}

    public AccountSocket(String id){
        this.setId(id);
    }

    public AccountSocket(String id,WebSocketSession socketSession){
        this.setId(id);
        this.socketSession = socketSession;
    }
    /**
     * WebSocket
     * session 会话信息
     */
    private WebSocketSession socketSession;

    public WebSocketSession getSocketSession() {
        return socketSession;
    }

    public void setSocketSession(WebSocketSession socketSession) {
        this.socketSession = socketSession;
    }

}
