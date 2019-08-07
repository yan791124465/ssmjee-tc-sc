package com.jee.ssm.model;

import com.jee.ssm.model.base.BaseModel;

public class RolePower extends BaseModel {

    private String id;

    /**
     * 角色Id
     */
    private String roleId;

    /**
     * 权限Id
     */
    private String powerId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getPowerId() {
        return powerId;
    }

    public void setPowerId(String powerId) {
        this.powerId = powerId;
    }
}