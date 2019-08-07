package com.jee.ssm.common.shiro;

import com.jee.ssm.common.utils.StringUtils;
import com.jee.ssm.modules.ssm.dao.AccountDao;
import com.jee.ssm.modules.ssm.dao.PowerDao;
import com.jee.ssm.modules.ssm.dao.RoleDao;
import com.jee.ssm.common.config.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import javax.annotation.Resource;
import java.util.*;

/**
 * @author GaoXiang
 * @version 1.0
 * @since 2016/10/28.
 */
public class AdminDbRealm extends AuthorizingRealm {

    @Resource
    private RoleDao roleDao;

    @Resource
    private AccountDao accountDao;

    @Resource
    private PowerDao powerDao;


    /**
     * 认证回调函数,登录时调用。
     * @param authenticationToken Token
     * @return 认证
     * @throws AuthenticationException 认证失败
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        Logger.shiro("开始认证权限...");

        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        com.jee.ssm.model.Account account = accountDao.findByUserName(token.getUsername());

        if (account == null)//没有此用户
            throw new UnknownAccountException();

        if (account.getType() < 1)//身份没有被授权登陆
            throw new UnauthorizedException();

        if(account.getStatus() < 0)//账户被锁定
            throw new LockedAccountException();

        ShiroAccount shiroAccount = new ShiroAccount(account.getId(), account.getUserName(),account);
        //返回认证信息由父类AuthenticatingRealm进行认证
        return new SimpleAuthenticationInfo(shiroAccount, account.getPassword(), getName());
    }


    /**
     * 授权查询回调函数。
     * @param principalCollection 会话信息
     * @return 认证结果
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        //获取登陆用户信息
        ShiroAccount shiroAccount = (ShiroAccount) principalCollection.getPrimaryPrincipal();
        Logger.shiro("授权中..." + " 用户名：" + shiroAccount.getUserName());
        Logger.shiro("授权中..." + " ID：" + shiroAccount.getId());

        //创建权限和角色容器
        List<String> powers = new ArrayList<>(),roles = new ArrayList<>();

        //绑定、判断用户所有角色和权限
        roleDao.findByAccountId(shiroAccount.getId()).forEach(role -> {
            if(!StringUtils.isEmpty(role.getShiro())){roles.add(role.getShiro());}
            powerDao.findByRoleId(role.getId()).forEach(power -> {
                if(!StringUtils.isEmpty(power.getShiro())){powers.add(power.getShiro());}
            });
        });

        Logger.shiro("全部角色：" + roles);
        Logger.shiro("全部权限：" + powers);
        //返回权限信息
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(roles);
        info.addStringPermissions(powers);
        return info;
    }

}
