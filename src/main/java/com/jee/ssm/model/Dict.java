package com.jee.ssm.model;

import com.jee.ssm.model.base.BaseModel;

/**
 * 
 * 表名 t_dict
 * @author GaoXiang
 * @version 1.0
 * Create time 2017/04/01
 */
public class Dict extends BaseModel {
    /**
     * 
     * 表字段 : t_dict.id
     * Create time 2017/04/01
     */
    private String id;

    /**
     * 名称
     * 表字段 : t_dict.name
     * Create time 2017/04/01
     */
    private String name;

    /**
     * 代码
     * 表字段 : t_dict.code
     * Create time 2017/04/01
     */
    private String code;

    /**
     * 类型
     * 表字段 : t_dict.type
     * Create time 2017/04/01
     */
    private String type;

    /**
     * 排序
     * 表字段 : t_dict.sort
     * Create time 2017/04/01
     */
    private String sort;

    /**
     * 内容
     * 表字段 : t_dict.content
     * Create time 2017/04/01
     */
    private String content;

    /**
     * 备注
     * 表字段 : t_dict.intro
     * Create time 2017/04/01
     */
    private String intro;

    /**
     * 
     * 表字段 : t_dict.parent_id
     * Create time 2017/04/01
     */
    private String parentId;

    /**
     * 构造方法
     */
    public Dict(String id, String name, String code, String type, String sort, String content, String intro, String parentId) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.type = type;
        this.sort = sort;
        this.content = content;
        this.intro = intro;
        this.parentId = parentId;
    }

    /**
     * 构造方法
     */
    public Dict() {
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
     * 名称
     * @return name 名称
     */
    public String getName() {
        return name;
    }

    /**
     * 名称
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 代码
     * @return code 代码
     */
    public String getCode() {
        return code;
    }

    /**
     * 代码
     * @param code 代码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 类型
     * @return type 类型
     */
    public String getType() {
        return type;
    }

    /**
     * 类型
     * @param type 类型
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 排序
     * @return sort 排序
     */
    public String getSort() {
        return sort;
    }

    /**
     * 排序
     * @param sort 排序
     */
    public void setSort(String sort) {
        this.sort = sort;
    }

    /**
     * 内容
     * @return content 内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 内容
     * @param content 内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 备注
     * @return intro 备注
     */
    public String getIntro() {
        return intro;
    }

    /**
     * 备注
     * @param intro 备注
     */
    public void setIntro(String intro) {
        this.intro = intro;
    }

    /**
     * 
     * @return parent_id 
     */
    public String getParentId() {
        return parentId;
    }

    /**
     * 
     * @param parentId 
     */
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
}