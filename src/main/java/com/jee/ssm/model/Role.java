package com.jee.ssm.model;

import com.jee.ssm.model.base.BaseModel;

import java.util.Date;

public class Role extends BaseModel {

    private String id;

    /**
     * 名称
     */
    private String name;

    /**
     * 简介
     */
    private String intro;

    /**
     * 添加时间
     */
    private Date setTime;

    /**
     * 权限标识
     */
    private String shiro;

    /**
     * 添加人
     */
    private String accountId;

    /**
     * 应用列，做条件用，无实际字段
     */
    private String belong;

    public String getShiro() {
        return shiro;
    }

    public void setShiro(String shiro) {
        this.shiro = shiro;
    }

    public String getBelong() {
        return belong;
    }

    public void setBelong(String belong) {
        this.belong = belong;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public Date getSetTime() {
        return setTime;
    }

    public void setSetTime(Date setTime) {
        this.setTime = setTime;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }
}