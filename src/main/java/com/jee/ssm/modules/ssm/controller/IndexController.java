package com.jee.ssm.modules.ssm.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * 首页访问控制 Controller
 * @author GaoXiang
 * @version 1.0
 */
@Controller
public class IndexController{

    /**
     * 跳转到首页
     * @return 首页页面
     */
    @RequestMapping(value="/")
    public ModelAndView index(){
        return new ModelAndView("manager/index");
    }

    /**
     * 跳转到欢迎页面
     * @return 欢迎页面
     */
    @RequestMapping(value="/home")
    public ModelAndView home(){
        return new ModelAndView("manager/body/home");
    }




}
