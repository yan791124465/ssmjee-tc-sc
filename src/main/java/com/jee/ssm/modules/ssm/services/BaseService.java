package com.jee.ssm.modules.ssm.services;

import com.jee.ssm.modules.ssm.dao.LzDao;
import org.springframework.stereotype.Service;

/**
 * 基础数据访问服务封装
 * @author GaoXiang
 * @version 2.0
 */
@Service
public class BaseService<T> extends LzDao<T> {



}
