package com.jee.ssm.common.exception;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.ssm.common.config.Const;
import com.jee.ssm.common.config.Logger;
import com.jee.ssm.modules.log.services.LogService;
import com.jee.ssm.model.Account;
import com.jee.ssm.model.Log;
import com.jee.ssm.common.utils.UUIDFactory;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * 类名称：MyExceptionResolver.java
 * 类描述：异常捕获
 * @author GaoXiang
 * @version 1.5
 */
public class MyExceptionResolver implements HandlerExceptionResolver{

    /**
     * 日志存储Service
     */
    @Resource
    private LogService logService;


    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) {

        //尝试将异常写入日志
        saveLog(request,e.toString());

        Logger.exception("================== 「拦截到异常信息」「BEGIN」 ==================");
        Logger.exception("资源路径：" + request.getServletPath());
        Logger.exception("请求参数：" + request.getQueryString());
        Logger.exception("请求协议：" + request.getScheme()  + " - " + request.getProtocol());
        Logger.exception("请求方式：" + request.getMethod());
        Logger.exception("请求编码：" + request.getCharacterEncoding());
        Logger.exception("请求格式：" + request.getContentType());
        Logger.exception("发起地址：" + request.getRemoteAddr());
        Logger.exception("目标主机：" + request.getServerName());
        Logger.exception("异常信息：" + e.toString());
        StackTraceElement[] stackArray = e.getStackTrace();
        for (int i = 0; i < stackArray.length; i++) {
            StackTraceElement element = stackArray[i];
            Logger.exception("异常详情["+ i +"]：" + element.toString());
        }
        Logger.exception("================== 「拦截到异常信息」「END」 ==================");

        //打印异常以及跳转
        //e.printStackTrace();

        //记录异常以及其它参数
        Map<String, Object> model = new HashMap<>();
        model.put("e", e);


        //判断是否是权限问题
        if(e instanceof UnauthorizedException){
            Logger.exception("Log:当前会话用户无权访问此资源！");
            response.setStatus(500);
            return new ModelAndView("system/exception/power",model);
        }


        return new ModelAndView("system/exception/error",model);
    }

    /**
     * 异常写入日志
     * @param httpServletRequest 请求信息
     * @param content 异常内容
     */
    private void saveLog(HttpServletRequest httpServletRequest,String content){

        try {
            //读取session中的用户
            Account account = (Account) httpServletRequest.getSession().getAttribute(Const.ACCOUNT);
            //请求的IP
            String ip = httpServletRequest.getRemoteAddr();

            Log log = new Log();
            log.setId(UUIDFactory.getStringId());
            if(account != null){
                log.setAccountId(account.getId());
            }else{
                log.setAccountId("0");
            }
            log.setType(0);
            log.setSetTime(new Date());
            log.setContent(content);
            log.setMethod(httpServletRequest.getServletPath());
            log.setIp(ip);
            log.setParams(httpServletRequest.getQueryString());
            log.setStatus(0);
            //保存数据库
            logService.insert(log);
        } catch (Exception e) {
            Logger.exception("=====「异常写入日志失败」=====");
        }
    }

}
