package com.jee.ssm.modules.ssm.services;

import com.jee.ssm.model.AccountRole;
import com.jee.ssm.model.Role;
import com.jee.ssm.modules.ssm.dao.AccountRoleDao;
import com.jee.ssm.modules.ssm.dao.RoleDao;
import com.github.pagehelper.PageInfo;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 角色 Service
 * @author GaoXiang
 * @version 1.0
 */
@Service
public class RoleService extends BaseService<Role>{

    @Resource
    private RoleDao roleDao;

    @Resource
    private AccountRoleDao accountRoleDao;

    /**
     * 保存数据
     * @param role 实体对象
     * @return 实体id
     * @throws Exception 数据保存异常
     */
    public Integer insert(Role role) throws Exception {
        return roleDao.insert(role);
    }

    /**
     * 根据 id 修改
     * @param role 带id的实体对象
     * @return 受影响的行数
     * @throws Exception 数据修改异常
     */
    public Integer updateById(Role role) throws Exception {
        return roleDao.updateById(role);
    }

    /**
     * 根据 id 删除
     * @param id 数据id
     * @return 受影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteById(String id) throws Exception {
        accountRoleDao.deleteByRoleId(id);
        return roleDao.deleteById(id);
    }

    /**
     * 根据 id 查找
     * @param id 实体id
     * @return 实体
     * @throws Exception 查询异常
     */
    public Role selectById(String id)  {

        return roleDao.selectById(id);
    }

    /**
     * 根据 id 批量删除
     * @param ids 要删除的id
     * @return 影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteByIds(List<String> ids) throws Exception {
        for (String id : ids) {
            accountRoleDao.deleteByRoleId(id);
        }
        return roleDao.deleteByIds(ids);
    }

    /**
     * 查询列表
     * @param map 参数
     * @return 列表
     * @throws Exception 数据返回异常
     */
    public PageInfo<Role> list(Map map)   {
        return roleDao.list(map);
    }

    /**
     * 查询列表 带分页
     * @param map 参数
     * @param page 页码
     * @param size 每页大小
     * @return 列表
     * @throws Exception 数据返回异常
     */
    @Cacheable(cacheNames="redisCache",key = "'RoleServiceList'")
    public PageInfo<Role> list(Map map,int page,int size) {
        return roleDao.list(map,page,size);
    }

    public List<Role> findByAccountEdit(String accountId) {
        try {
            return roleDao.findByAccountEdit(accountId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
