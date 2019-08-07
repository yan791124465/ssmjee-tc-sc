package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.common.config.Const;
import com.jee.ssm.common.shiro.ShiroAccount;
import com.jee.ssm.common.utils.MD5;
import com.jee.ssm.common.utils.StringUtils;
import com.jee.ssm.modules.ssm.services.AdminService;
import com.jee.ssm.modules.ssm.services.PowerService;
import com.jee.ssm.model.json.Tip;
import com.jee.ssm.model.Admin;
import com.jee.ssm.model.Power;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登陆
 * @version 1.0
 */
@Controller
@RequestMapping("/login")
public class LoginController extends AdminBaseController{

    /**
     * 跳转到登陆页面
     * @return 登陆界面
     */
    @RequestMapping(value="",method = RequestMethod.GET)
    public ModelAndView loginPage(){
        // 验证码操作
        return new ModelAndView("manager/login");
    }

    /**
     * 登陆验证
     * @param account 用户信息{userName,password}
     * @return success = true 登陆成功，
     */
    @ResponseBody
    @RequestMapping(value="/manager",method = RequestMethod.POST)
    public Tip login(com.jee.ssm.model.Account account, HttpSession session) throws Exception {

        String msg = "登陆成功";
        if (StringUtils.isBlank(account.getUserName())) {
            msg = "用户名不能为空！";
            return new Tip(3,msg);
        }
        if (StringUtils.isBlank(account.getPassword())) {
            msg = "密码不能为空！";
            return new Tip(4,msg);
        }
        //获取当前会话主体
        Subject subject = SecurityUtils.getSubject();

        //获取token
        UsernamePasswordToken token = new UsernamePasswordToken(account.getUserName(), account.getPassword());

        //是否记住密码
        //token.setRememberMe(true);

        try {
            //登陆
            subject.login(token);

            //如果登陆成功
            if (subject.isAuthenticated()) {

                ShiroAccount shiroAccount = (ShiroAccount) subject.getPrincipal();

                com.jee.ssm.model.Account dba = shiroAccount.getAccount();
                session.setAttribute(Const.ACCOUNT,dba);

                // 检查分类并获取详细信息
                checkType(session,dba);

                //检查权限并缓存
                checkPower(session,dba.getId());

                //保存成功日志
                /*logService.loginLog(account,1,request.getRemoteAddr());*/

                return new Tip(msg);
            }
        } catch (IncorrectCredentialsException e) {
            msg = "登录密码错误！";
            return new Tip(11,msg);
        } catch (ExcessiveAttemptsException e) {
            msg = "登录失败次数过多！";
            return new Tip(12,msg);
        } catch (LockedAccountException e) {
            msg = "帐号已被锁定！";
            return new Tip(13,msg);
        } catch (DisabledAccountException e) {
            msg = "帐号已被禁用！";
            return new Tip(14,msg);
        } catch (ExpiredCredentialsException e) {
            msg = "帐号已过期！";
            return new Tip(15,msg);
        } catch (UnknownAccountException e) {
            msg = "帐号不存在！";
            return new Tip(16,msg);
        } catch (UnauthorizedException e) {
            msg = "您没有得到相应的授权！";
            return new Tip(17,msg);
        }

        return new Tip(1);
    }

    /**
     * 加密字符串 （网页javascript加密有加载延迟）
     * @param pwd 密码
     * @return 加密结果
     */
    @RequestMapping(value="/md5")
    @ResponseBody
    public String md5(String pwd){
        if(pwd != null){
            return MD5.md5(pwd);
        }
        return "";
    }

    /**
     * 检查并获取权限
     * @param session session对象
     * @param accountId 账户id
     */
    private void checkPower(HttpSession session,String accountId) {
        List<Power> powerList = powerService.findByAccountId(accountId);
        session.setAttribute(Const.POWER_LIST,powerList);
    }


    /**
     * 检查分类并分类缓存详细信息
     */
    private void checkType(HttpSession session, com.jee.ssm.model.Account resoult) throws Exception {
        // 判断类型 1 表示管理员
        if(resoult.getType() == 1){
            Admin admin = adminService.selectById(resoult.getInfoId());
            session.setAttribute(Const.ADMIN,admin);
        }/*else if(resoult.getType() == 2){

        }*/
    }

    /**
     * 注销登陆
     * @return sussess 成功 ，code = 1 失败
     */
    @RequestMapping(value="/logout")
    public String logout(HttpSession session){

        try {
            session.removeAttribute(Const.ACCOUNT);
            session.removeAttribute(Const.ADMIN);
            Subject subject = SecurityUtils.getSubject();
            subject.logout();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/login";
    }




    //--------------------------------- property --------------------------------
/*
    @Resource
    private AccountService accountService;
*/

    @Resource
    private AdminService adminService;

    @Resource
    private PowerService powerService;
}
