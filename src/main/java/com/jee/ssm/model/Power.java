package com.jee.ssm.model;

import com.jee.ssm.model.base.BaseModel;
import com.jee.ssm.common.utils.StringUtils;

import java.util.List;

public class Power extends BaseModel {

    /**
     *
     * 表字段 : t_power.id
     * Create By GaoXiang 2016/10/31
     */
    private String id;

    /**
     * 权限名称
     * 表字段 : t_power.name
     * Create By GaoXiang 2016/10/31
     */
    private String name;

    /**
     * 简介
     * 表字段 : t_power.intro
     * Create By GaoXiang 2016/10/31
     */
    private String intro;

    /**
     * 父级权限
     * 表字段 : t_power.parent_id
     * Create By GaoXiang 2016/10/31
     */
    private String parentId;

    /**
     * 权限类型
     * 表字段 : t_power.type
     * Create By GaoXiang 2016/10/31
     */
    private Integer type;

    /**
     * 权限跳转url
     * 表字段 : t_power.url
     * Create By GaoXiang 2016/10/31
     */
    private String url;

    /**
     * 权限排序
     * 表字段 : t_power.sort
     * Create By GaoXiang 2016/10/31
     */
    private Integer sort;

    /**
     * 权限图标
     * 表字段 : t_power.icon
     * Create By GaoXiang 2016/10/31
     */
    private String icon;

    /**
     * 权限标识
     * 表字段 : t_power.shiro
     * ：role:list
     */
    private String shiro;

    /**
     * 相关参数
     * 表字段 : t_power.param
     * ：&page=1&size=10
     */
    private String param;

    //自定义
    private String belong;//是否包含在某个集合里 我的权限 或者某个角色
    private List<Power> powers; // 下级权限
    private Integer powerCount;//下级权限数量

    /**
     * 获取SimpleAuthorizationInfo 用的权限字符串
     * @return 处理后的格式
     */
    public String getParamUrl(){
        String pUrl = null;
        try {
            if(!StringUtils.isEmpty(url)){
                pUrl = url.replaceAll("/",":");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pUrl;
    }

    public String getShiro() {
        return shiro;
    }

    public void setShiro(String shiro) {
        this.shiro = shiro;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public String getBelong() {
        return belong;
    }

    public void setBelong(String belong) {
        this.belong = belong;
    }

    public List<Power> getPowers() {
        return powers;
    }

    public void setPowers(List<Power> powers) {
        this.powers = powers;
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

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public Integer getPowerCount() {
        if(powerCount == null) return 0;
        return powerCount;
    }

    public void setPowerCount(Integer powerCount) {
        this.powerCount = powerCount;
    }
}