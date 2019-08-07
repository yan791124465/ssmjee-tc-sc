package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.modules.ssm.services.AccountService;
import com.jee.ssm.model.json.Tip;
import com.jee.ssm.model.Account;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * 账户 Controller
 * @author GaoXiang
 * @version 1.0
 */
@Controller
@RequestMapping("/account")
public class AccountController extends AdminBaseController<Account> {

    /**
     * 更改信息
     * @param account 用户信息
     * @return 状态
     * @throws Exception 修改失败
     */
    @RequestMapping("/update")
    @ResponseBody
    public Tip update(Account account) throws Exception {
        Account old = accountService.selectById(account.getId());
        old.setPassword(account.getPassword());
        accountService.updateById(old);
        return new Tip();
    }

    @RequestMapping("/edit")
    public String edit(){
        return "manager/account/edit";
    }



    //----------------------- property ----------------------
    @Resource
    private AccountService accountService;
}
