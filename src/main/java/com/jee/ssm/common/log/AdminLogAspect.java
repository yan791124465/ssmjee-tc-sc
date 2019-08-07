package com.jee.ssm.common.log;

import com.alibaba.fastjson.JSON;
import com.jee.ssm.common.config.Const;
import com.jee.ssm.common.utils.UUIDFactory;
import com.jee.ssm.model.Account;
import com.jee.ssm.model.Log;
import com.jee.ssm.modules.log.services.LogService;
import com.jee.ssm.common.config.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * 切点类
 * @author GaoXiang
 * @since 2016/10/26
 * @version 1.0
 */
@Aspect
@Component
public  class AdminLogAspect {

    //注入Service用于把日志保存数据库
    @Resource
    private LogService logService;

    //Controller层切点
    @Pointcut("@annotation(com.jee.ssm.common.log.AdminControllerLog)")
    public  void controllerAspect() { }

    /**
     * 前置通知 用于拦截Controller层记录用户的操作
     *
     * @param joinPoint 切点
     */
    @Before("controllerAspect()")
    public  void doBefore(JoinPoint joinPoint) {

        HttpServletRequest request = getRequest();
        HttpSession session = request.getSession();
        //读取session中的用户
        Account account = (Account) session.getAttribute(Const.ACCOUNT);
        //请求的IP
        String ip = request.getRemoteAddr();
        try {
            //*========控制台输出=========*//
            Logger.info("===============================请求日志【开始】===================================");
            Logger.info("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            Logger.info("方法描述:" + getControllerMethodDescription(joinPoint));
            Logger.info("方法参数:" + JSON.toJSONString(joinPoint.getArgs()));
            Logger.info("来源地址:" + ip);
            if(account != null){
                Logger.info("来源用户:" + account.getUserName());
            }else{
                Logger.info("来源用户:无");
            }
            //*========数据库日志=========*//
            Log log = new Log();
            log.setId(UUIDFactory.getStringId());
            if(account != null){
                log.setAccountId(account.getId());
            }else{
                log.setAccountId("0");
            }
            log.setType(1);
            log.setSetTime(new Date());
            log.setContent(getControllerMethodDescription(joinPoint) );
            log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
            log.setIp(ip);
            log.setParams(JSON.toJSONString(joinPoint.getArgs()));
            log.setStatus(1);
            logService.insert(log);
            Logger.info("===============================请求日志【结束】===================================");
        }  catch (Exception e) {
            Logger.info("=============================== 日志记录失败【异常】 ===================================");
        }
    }


    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     *
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception 获取注解失败
     */
    private  static String getControllerMethodDescription(JoinPoint joinPoint)  throws Exception {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method m = signature.getMethod();
        return m.getAnnotation(AdminControllerLog. class).description();
    }

    private static HttpServletRequest  getRequest(){
       return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }
}