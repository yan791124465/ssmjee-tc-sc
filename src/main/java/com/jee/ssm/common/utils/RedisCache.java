package com.jee.ssm.common.utils;

import java.io.Serializable;
import java.util.concurrent.Callable;

import org.apache.commons.lang3.SerializationUtils;
import org.apache.log4j.Logger;
import org.springframework.cache.Cache;
import org.springframework.cache.support.SimpleValueWrapper;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;

public class RedisCache implements Cache{
    private RedisTemplate<String, Object> redisTemplate;
    private String name;
    private Logger logger = Logger.getLogger("RedisCache");

    @Override
    public void clear() {
        try {
            logger.info("CacheClear");
            redisTemplate.execute((RedisCallback<String>) connection -> {
                connection.flushDb();
                return "ok";
            });
        } catch (Exception e) {
            logger.info("无法打开Redis服务");
            //e.printStackTrace();
        }
    }

    @Override
    public void evict(Object key) {
        try {
            logger.info("CacheEvict");
            final String keyf=key.toString();
            redisTemplate.execute((RedisCallback<Long>) connection -> connection.del(keyf.getBytes()));
        } catch (Exception e) {
            logger.info("无法打开Redis服务");
            //e.printStackTrace();
        }

    }

    @Override
    public ValueWrapper get(Object key) {
        try {
            logger.info("GetCacheKey : "+key.toString());
            final String keyf = key.toString();
            Object object = null;
            object = redisTemplate.execute((RedisCallback<Object>) connection -> {
                byte[] key1 = keyf.getBytes();
                byte[] value = connection.get(key1);
                if (value == null) {
                    logger.info("CacheNotFind");
                    return null;
                }
                return SerializationUtils.deserialize(value);
            });
            ValueWrapper obj=(object != null ? new SimpleValueWrapper(object) : null);
            if(obj!=null)logger.info("FindCache : "+obj);
            return  obj;
        } catch (Exception e) {
            logger.info("无法打开Redis服务");
            //e.printStackTrace();
            return null;
        }
    }

    @Override
    public void put(Object key, Object value) {
        try {
            logger.info("CacheKey : "+key);
            logger.info("CacheValue : "+value);
            final String keyString = key.toString();
            final Object valuef = value;
            final long liveTime = 86400;
            redisTemplate.execute((RedisCallback<Long>) connection -> {
                byte[] keyb = keyString.getBytes();
                byte[] valueb = SerializationUtils.serialize((Serializable) valuef);
                connection.set(keyb, valueb);
                if (liveTime > 0) {
                    connection.expire(keyb, liveTime);
                    logger.info("CacheSave...SUCCESS");
                }
                return 1L;
            });
        } catch (Exception e) {
            logger.info("无法打开Redis服务");
            //e.printStackTrace();
        }

    }

    @Override
    public <T> T get(Object arg0, Class<T> arg1) {
        return null;
    }

    @Override
    public <T> T get(Object o, Callable<T> callable) {
        return null;
    }

    @Override
    public String getName() {
        return this.name;
    }

    @Override
    public Object getNativeCache() {
        return this.redisTemplate;
    }

    @Override
    public ValueWrapper putIfAbsent(Object arg0, Object arg1) {
        return null;
    }

    public RedisTemplate<String, Object> getRedisTemplate() {
        return redisTemplate;
    }

    public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void setName(String name) {
        this.name = name;
    }
}
