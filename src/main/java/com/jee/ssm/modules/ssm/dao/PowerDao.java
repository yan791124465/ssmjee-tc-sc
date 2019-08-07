package com.jee.ssm.modules.ssm.dao;

import com.jee.ssm.model.Power;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

/**
 * 权限 Dao
 * @author GaoXiang
 * @version 1.0
 */
@Repository
public class PowerDao extends LzDao<Power> {


    /**
     * 获取用户权限
     * @param accountId 根据用户获取用户所有角色的权限
     * @return 用户权限列表
     */
    public List<Power> findByAccountId(String accountId) {
        try {
            return arrayList("PowerMapper.findByAccountId",accountId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 获取角色全部权限
     * @param roleId 角色id
     * @return 角色全部权限
     */
    public List<Power> findByRoleId(String roleId) {
        try {
            return arrayList("PowerMapper.findByRoleId",roleId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取全部权限 带 所属角色的 belong 字段 授权用
     * @param roleId 角色id
     * @return 全部权限，属于本角色的 belong列为角色id
     */
    public List<Power> findAllByRoleId(String roleId) {
        try {
            return arrayList("PowerMapper.findAllByRoleId",roleId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }



    /**
     * 保存数据
     * @param power 实体对象
     * @return 实体id
     * @throws Exception 数据保存异常
     */
    public Integer insert(Power power) throws Exception {
        return insert("PowerMapper.insert",power);
    }

    /**
     * 根据 id 修改
     * @param power 带id的实体对象
     * @return 受影响的行数
     * @throws Exception 数据修改异常
     */
    public Integer updateById(Power power) throws Exception {
        return update("PowerMapper.updateById",power);
    }

    /**
     * 根据 id 删除
     * @param id 数据id
     * @return 受影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteById(String id) throws Exception {
        return delete("PowerMapper.deleteById",id);
    }

    /**
     * 根据 id 查找
     * @param id 实体id
     * @return 实体
     * @throws Exception 查询异常
     */
    public Power selectById(String id) {
        return selectOne("PowerMapper.selectById",id);
    }

    /**
     * 根据 id 批量删除
     * @param ids 要删除的id
     * @return 影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteByIds(List<String> ids) throws Exception {
        return delete("PowerMapper.deleteByIds",ids);
    }

    /**
     * 查询列表
     * @param map 参数
     * @return 列表
     * @throws Exception 数据返回异常
     */
    public PageInfo<Power> list(Map map) {
        return list("PowerMapper.list",map);
    }

    /**
     * 查询列表 带分页
     * @param map 参数
     * @param page 页码
     * @param size 每页大小
     * @return 列表
     * @throws Exception 数据返回异常
     */
    public PageInfo<Power> list(Map map,int page,int size) {
        return list("PowerMapper.list",map,new RowBounds(page,size));
    }

    public List<Power> findByParentId(String parentId)  {
        return arrayList("PowerMapper.findByParentId",parentId);
    }
}
