package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.common.config.Const;
import com.jee.ssm.common.socket.WSSUtil;
import com.jee.ssm.common.config.Logger;
import com.jee.ssm.common.socket.Message;
import com.jee.ssm.model.json.Tip;
import com.jee.ssm.model.Account;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 首页访问控制 Controller
 *
 * @author GaoXiang
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/socket")
public class SocketController {


    /**
     * 跳转到webSocket测试页面
     * @return testSocket 页面
     */
    @RequestMapping(value="/test")
    public String testSocket(){
        return "manager/socket/test";
    }


    /**
     * 给某用户发消息
     *
     * @param message content toAccountId
     * @param message 发送的文本
     * @return 返回状态
     */
    @RequestMapping(value = "/sta")
    @ResponseBody
    public Tip sendToAccount(HttpSession session, Message message) {
        Account account = (Account) session.getAttribute(Const.ACCOUNT);
        message.setUserName(account.getUserName());
        message.setType(1);
        message.setSetTime(new Date());
        try {
            WSSUtil.sendToAccount(message);
            Logger.socket("socket:[" + account.getUserName() + "] ==> [" + message.getUserName() + "] " + message.getMessage());
        } catch (Exception e) {
            return new Tip(1, e.getMessage());
        }
        return new Tip("发送成功");
    }

    /**
     * 给某用户发消息
     *
     * @param message 发送的文本 content
     * @return 返回状态
     */
    @RequestMapping(value = "/stall")
    @ResponseBody
    public Tip sendToAll(HttpSession session, Message message) {
        Account account = (Account) session.getAttribute(Const.ACCOUNT);
        message.setUserName(account.getUserName());
        message.setType(2);
        message.setSetTime(new Date());
        message.setToUser("allUser");
        WSSUtil.sendToAll(message);
        return new Tip("发送成功");
    }

    @RequestMapping(value = "/getAll")
    @ResponseBody
    public List<String> getAllUser() {
        return WSSUtil.getAllUser();
    }

}
