package com.jee.ssm.modules.ssm.services;

import com.jee.ssm.common.utils.UUIDFactory;
import com.jee.ssm.modules.ssm.dao.AccountRoleDao;
import com.jee.ssm.model.AccountRole;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
* 管理员角色 Service
* @author GaoXiang
* @version 1.0
*/
@Service
public class AccountRoleService extends BaseService<AccountRole> {

    @Resource
    private AccountRoleDao accountRoleDao;

    /**
     * 根据账号ID删除信息
     * @param AccountId 账号ID
     * @return 删除行数
     * @throws Exception 删除失败
     */
    public Integer deleteByAccountId(String AccountId) throws Exception{
        return accountRoleDao.deleteByAccountId(AccountId);
    }

    /**
    * 保存数据
    * @param accountRole 实体对象
    * @return 实体id
    * @throws Exception 数据保存异常
    */
    public Integer insert(AccountRole accountRole) throws Exception {
        return accountRoleDao.insert(accountRole);
    }

    /**
    * 根据 id 修改
    * @param accountRole 带id的实体对象
    * @return 受影响的行数
    * @throws Exception 数据修改异常
    */
    public Integer updateById(AccountRole accountRole) throws Exception {
        return accountRoleDao.updateById(accountRole);
    }

    /**
    * 根据 id 删除
    * @param id 数据id
    * @return 受影响的行数
    * @throws Exception 数据删除异常
    */
    public Integer deleteById(String id) throws Exception {
        return accountRoleDao.deleteById(id);
    }

    /**
    * 根据 id 查找
    * @param id 实体id
    * @return 实体
    * @throws Exception 查询异常
    */
    public AccountRole selectById(String id) {
        return accountRoleDao.selectById(id);
    }

    /**
    * 根据 id 批量删除
    * @param ids 要删除的id
    * @return 影响的行数
    * @throws Exception 数据删除异常
    */
    public Integer deleteByIds(List<String> ids) throws Exception {
        return accountRoleDao.deleteByIds(ids);
    }

    /**
    * 查询列表
    * @param map 参数
    * @return 列表
    * @throws Exception 数据返回异常
    */
    public PageInfo<AccountRole> list(Map map) {
        return accountRoleDao.list(map);
    }

    /**
    * 查询列表 带分页
    * @param map 参数
    * @param page 页码
    * @param size 每页大小
    * @return 列表
    * @throws Exception 数据返回异常
    */
    public PageInfo<AccountRole> list(Map map,int page,int size) {
        return accountRoleDao.list(map,page,size);
    }


    public void chageRole(String accountId, List<String> roles) throws Exception {
        accountRoleDao.deleteByAccountId(accountId);
        AccountRole accountRole;
        for(String r : roles){
            accountRole = new AccountRole();
            accountRole.setId(UUIDFactory.getStringId());
            accountRole.setAccountId(accountId);
            accountRole.setRoleId(r);
            accountRoleDao.insert(accountRole);
        }
    }
}
