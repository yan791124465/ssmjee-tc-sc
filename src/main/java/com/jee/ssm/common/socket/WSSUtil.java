package com.jee.ssm.common.socket;

import com.alibaba.fastjson.JSON;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.io.Serializable;
import java.util.*;

/**
 * WebSocketSessionUtil 工具
 * @author GaoXiang
 * @version 1.0
 * @since 2016/11/7.
 */
public class WSSUtil implements Serializable {

    private static Map<String, WebSocketSession> wssMap = Collections.synchronizedMap(new HashMap<>());

    /**
     * 给某用户发消息
     * @param message 消息
     * @throws IOException 异常
     */
    public static void sendToAccount(Message message) throws IOException {
        WebSocketSession session = wssMap.get(message.getToUser());
        session.sendMessage(new TextMessage(JSON.toJSONString(message)));
    }

    /**
     * 给所有人发消息
     * @param message 消息
     */
    public static void sendToAll(Message message) {

        wssMap.values().forEach(session -> {
            try {
                session.sendMessage(new TextMessage(JSON.toJSONString(message)));
            } catch (IOException e) {
                //e.printStackTrace();
            }
        });
    }


    public static boolean exists(String userName){
        if(!wssMap.containsKey(userName)){
            return false;
        }else{
            return true;
        }
    }

    public static void put(String userName, WebSocketSession session){
        wssMap.put(userName, session);
    }

    public static WebSocketSession get(String userName){
        return wssMap.get(userName);
    }

    public static void remove(String userName){
        wssMap.remove(userName);
    }

    public static List<WebSocketSession> getAllSession(){
        return new ArrayList<>(wssMap.values());
    }

    public static List<String> getAllUser() {
        return new ArrayList<>(wssMap.keySet());
    }
}
