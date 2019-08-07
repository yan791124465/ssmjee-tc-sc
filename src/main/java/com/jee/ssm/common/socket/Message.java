package com.jee.ssm.common.socket;

import java.io.Serializable;
import java.util.Date;

/**
 * 消息封装实体
 * @author GaoXiang
 * @version 1.0
 * @since 2016/11/7.
 */
public class Message implements Serializable {

    private String id;
    private String userName;
    private String toUser;
    /**
     * 1，即时消息
     * 2，群发
     * 分类
     */
    private Integer type;
    private String message;
    private Date setTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getSetTime() {
        return setTime;
    }

    public void setSetTime(Date setTime) {
        this.setTime = setTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getToUser() {
        return toUser;
    }

    public void setToUser(String toUser) {
        this.toUser = toUser;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
