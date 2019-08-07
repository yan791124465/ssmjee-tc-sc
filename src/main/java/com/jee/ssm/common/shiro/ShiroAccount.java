package com.jee.ssm.common.shiro;

import com.jee.ssm.model.Account;

import java.io.Serializable;

/**
 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息
 * @author GaoXiang
 * @version 1.0
 * @since 2016/10/28.
 */
public class ShiroAccount implements Serializable {

    private static final long serialVersionUID = -1373760761780840081L;

    private String id;
    private String userName;
    private Account account;

    ShiroAccount(String id, String userName) {
        this.id = id;
        this.userName = userName;
    }

    ShiroAccount(String id, String userName, Account account) {
        this.id = id;
        this.userName = userName;
        this.account = account;
    }

    /**
     * 本函数输出将作为默认的<shiro:principal/>输出.
     */
    @Override
    public String toString() {
        return userName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}
