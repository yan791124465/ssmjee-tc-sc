package com.jee.ssm.modules.ssm.services;

import com.jee.ssm.common.config.Global;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 系统管理，安全相关实体的管理类,包括用户、角色、菜单.
 * @author Jiang Xue Li
 * @version 2016-10-25
 */
@Service
@Transactional(readOnly = true)
public class SystemService  {

    /**
     * 获取Key加载信息
     */
    public static boolean printKeyLoadMessage(){
        StringBuilder sb = new StringBuilder();
        sb.append("\r\n================================= ▄︻┻┳═一…… ==================================\r\n");
        sb.append("\r\n                         欢迎使用 "+ Global.getConfig("product.name")+"\r\n");
        sb.append("\r\n================================= ▄︻┻┳═一…… ==================================\r\n");
        System.out.println(sb.toString());
        return true;
    }

}
