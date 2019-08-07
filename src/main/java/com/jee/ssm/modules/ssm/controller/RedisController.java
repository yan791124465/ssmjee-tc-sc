package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.common.config.Logger;
import com.jee.ssm.model.json.Tip;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/redis")
public class RedisController {

    /**
     * 获取缓存列表
     * @param pattern 搜索条件 - 正则
     * @return 缓存列表页面
     */
    @RequestMapping(value="/list")
    public String list(HttpServletRequest request, Model model, String pattern){
        Set<String> keys = redisTemplate.keys(pattern);
        keys.forEach(key -> {
            Logger.info(key);
        });
        List<String> list = new ArrayList<>(keys);
        model.addAttribute("list",list);
        return "manager/redis/list";
    }


    /**
     * 根据正则批量删除
     * @param pattern
     * @return
     */
    @RequestMapping(value="/deleteByPattern")
    @ResponseBody
    public Tip deleteByPattern(String pattern){
        try {
            Collection<String> keys = redisTemplate.keys(pattern);
            redisTemplate.delete(keys);
            return new Tip();
        } catch (Exception e) {
            e.printStackTrace();
            return new Tip(1);
        }
    }


    /**
     * 删除指定缓存
     * @param key 缓存key
     * @return 缓存删除结果
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    public Tip delete(String key){
        try {
            redisTemplate.delete(key);
            return new Tip();
        } catch (Exception e) {
            e.printStackTrace();
            return new Tip(1);
        }
    }


    @Resource
    private RedisTemplate<String, Object> redisTemplate;
}
