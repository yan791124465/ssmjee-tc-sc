package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.common.utils.ProjectConfig;

import javax.annotation.Resource;

/**
 * 基础Controller
 * @author GaoXiang
 * @version 1.0
 */
public class AdminBaseController<T> {

    @Resource
    public ProjectConfig projectConfig;

}
