package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.common.config.Logger;
import com.jee.ssm.model.json.Tip;
import com.jee.ssm.model.Account;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 页跳转服务
 * Created by GaoXiang on 2016/5/3 0003.
 */

@Controller
@RequestMapping("/page")
public class PageController {

    /**
     * 单纯获取某页面
     * @param path
     * @return
     */
    @RequestMapping(value="/forward")
    public ModelAndView forward(@RequestParam("path") String path, ModelMap model){

        return new ModelAndView(path,model);
    }

    /**
     * 转到某页面
     * @param path
     * @return
     */
    @RequestMapping(value="/redirect")
    public String redirect(@RequestParam("path") String path){
        
        return "redirect:"+path;
    }


    /**
     * 进入测试页
     * @param request 测试
     * @param model 测试
     * @return 跳页
     */
    @RequestMapping(value="/toParamTest")
    public String forward(HttpServletRequest request, ModelMap model){

        return "manager/test/paramTest";
    }

    /**
     * 测试接收参数
     * @param list 集合
     * @return 状态
     */
    @RequestMapping(value="/paramTest")
    @ResponseBody
    public Tip redirect(List<Account> list){
        Logger.info(list.size());
        list.forEach(account -> {
            Logger.info(account.getUserName());
            Logger.info(account.getPassword());
        });
        return new Tip(list.size());
    }

}
