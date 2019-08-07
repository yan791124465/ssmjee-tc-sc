package com.jee.ssm.model;

import com.jee.ssm.model.base.BaseModel;

import java.util.Date;

public class Log extends BaseModel {

    /**
     *
     * 表字段 : t_log.id
     * Create By GaoXiang 2016/10/26
     */
    private String id;

    /**
     *
     * 表字段 : t_log.content
     * Create By GaoXiang 2016/10/26
     */
    private String content;

    /**
     * 0,异常，1,操作日志，2,登陆日志
     * 表字段 : t_log.type
     * Create By GaoXiang 2016/10/26
     */
    private Integer type;

    /**
     *
     * 表字段 : t_log.set_time
     * Create By GaoXiang 2016/10/26
     */
    private Date setTime;

    /**
     *
     * 表字段 : t_log.account_id
     * Create By GaoXiang 2016/10/26
     */
    private String accountId;

    /**
     *
     * 表字段 : t_log.status
     * Create By GaoXiang 2016/10/26
     */
    private Integer status;

    /**
     *
     * 表字段 : t_log.ip
     * Create By GaoXiang 2016/10/26
     */
    private String ip;

    /**
     *
     * 表字段 : t_log.method
     * Create By GaoXiang 2016/10/26
     */
    private String method;

    /**
     *
     * 表字段 : t_log.params
     * Create By GaoXiang 2016/10/26
     */
    private String params;

    public Log(String id, String content, Integer type, Date setTime, String accountId, Integer status, String ip, String method, String params) {
        this.id = id;
        this.content = content;
        this.type = type;
        this.setTime = setTime;
        this.accountId = accountId;
        this.status = status;
        this.ip = ip;
        this.method = method;
        this.params = params;
    }

    public Log() {
        super();
    }

    /**
     *
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     *
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     *
     * @return content
     */
    public String getContent() {
        return content;
    }

    /**
     *
     * @param content
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     *
     * @return type
     */
    public Integer getType() {
        return type;
    }

    /**
     *
     * @param type
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     *
     * @return set_time
     */
    public Date getSetTime() {
        return setTime;
    }

    /**
     *
     * @param setTime
     */
    public void setSetTime(Date setTime) {
        this.setTime = setTime;
    }

    /**
     *
     * @return account_id
     */
    public String getAccountId() {
        return accountId;
    }

    /**
     *
     * @param accountId
     */
    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    /**
     *
     * @return status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     *
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     *
     * @return ip
     */
    public String getIp() {
        return ip;
    }

    /**
     *
     * @param ip
     */
    public void setIp(String ip) {
        this.ip = ip;
    }

    /**
     *
     * @return method
     */
    public String getMethod() {
        return method;
    }

    /**
     *
     * @param method
     */
    public void setMethod(String method) {
        this.method = method;
    }

    /**
     *
     * @return params
     */
    public String getParams() {
        return params;
    }

    /**
     *
     * @param params
     */
    public void setParams(String params) {
        this.params = params;
    }
}