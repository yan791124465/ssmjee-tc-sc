package com.jee.ssm.common.tld;

import com.alibaba.fastjson.JSON;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author GaoXiang
 * @version 1.0
 * @since 2016/10/27.
 */
public class TagUtils {

    /**
     * 获取字典列表
     * @param name key值
     * @return 列表
     */
    public static List getDictList(String name){
        System.out.println(name);
        return new ArrayList();
    }


    /**
     * 处理时间格式
     * @param dateTime 时间类型
     * @return 字符串
     */
    public static String dateToString(Date dateTime){
        return new SimpleDateFormat("yyyy/MM/dd").format(dateTime);
    }

    /**
     * 处理时间格式 显示长时间
     * @param dateTime 时间类型
     * @return 字符串
     */
    public static String dateToStringTime(Date dateTime){
        return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(dateTime);
    }

    /**
     * 判断长度是否大于 length 大于就截取并加上 ...
     * @param value 未处理的值
     * @param length 预期长度
     * @return 处理以后的字符串
     */
    public static String showStringLength(String value,Integer length){
        Integer count = value.length();
        String temp = value ;
        if(count > length){
            temp = value.substring(0,length)+ "...";
        }
        return temp;
    }

    /**
     * 将对象转成json输出
     * @param object 对象
     * @return json字符串
     */
    public static String toJson(Object object){
        return JSON.toJSONString(object);
    }

}
