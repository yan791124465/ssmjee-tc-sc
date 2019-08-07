package com.jee.ssm.modules.ssm.dao;

import com.jee.ssm.model.Role;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

/**
 * 角色 Dao
 * @author GaoXiang
 * @version 1.0
 */
@Repository
public class RoleDao extends LzDao<Role> {


    /**
     * 保存数据
     * @param role 实体对象
     * @return 实体id
     * @throws Exception 数据保存异常
     */
    public Integer insert(Role role) throws Exception {
        return insert("RoleMapper.insert",role);
    }

    /**
     * 根据 id 修改
     * @param role 带id的实体对象
     * @return 受影响的行数
     * @throws Exception 数据修改异常
     */
    public Integer updateById(Role role) throws Exception {
        return update("RoleMapper.updateById",role);
    }

    /**
     * 根据 id 删除
     * @param id 数据id
     * @return 受影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteById(String id) throws Exception {
        return delete("RoleMapper.deleteById",id);
    }

    /**
     * 根据 id 查找
     * @param id 实体id
     * @return 实体
     */
    public Role selectById(String id){
        return selectOne("RoleMapper.selectById",id);
    }

    /**
     * 根据 id 批量删除
     * @param ids 要删除的id
     * @return 影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteByIds(List<String> ids) throws Exception {
        return delete("RoleMapper.deleteByIds",ids);
    }

    /**
     * 查询列表
     * @param map 参数
     * @return 列表
     */
    public PageInfo<Role> list(Map map){
        return list("RoleMapper.list",map);
    }

    /**
     * 查询列表 带分页
     * @param map 参数
     * @param page 页码
     * @param size 每页大小
     * @return 列表
     */
    public PageInfo<Role> list(Map map,int page,int size) {
        return list("RoleMapper.list",map,new RowBounds(page,size));
    }

    /**
     * 获取用户所有角色
     * @param accountId 用户id
     * @return 角色列表
     */
    public List<Role> findByAccountId(String accountId) {

        return arrayList("RoleMapper.findByAccountId",accountId);
    }


    /**
     * 获取用户所有角色
     * @param accountId 账号ID
     * @return 所有角色
     */
    public List<Role> findByAccountEdit(String accountId)  {

        return arrayList("RoleMapper.findByAccountEdit",accountId);
    }
}
