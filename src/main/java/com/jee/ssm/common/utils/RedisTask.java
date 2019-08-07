package com.jee.ssm.common.utils;

import com.jee.ssm.common.config.Logger;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Collection;

@Component
public class RedisTask {


    /**
     * 第一个定时器测试方法
     */
    public void testJob(){
        Collection<String> keys = redisTemplate.keys("*");
        redisTemplate.delete(keys);
        Logger.info("缓存清除：" + keys);
    }

    @Resource
    private RedisTemplate<String, Object> redisTemplate;
}
