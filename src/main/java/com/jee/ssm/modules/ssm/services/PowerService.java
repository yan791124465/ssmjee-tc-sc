package com.jee.ssm.modules.ssm.services;

import com.jee.ssm.common.utils.UUIDFactory;
import com.jee.ssm.model.Power;
import com.jee.ssm.model.RolePower;
import com.jee.ssm.modules.ssm.dao.PowerDao;
import com.github.pagehelper.PageInfo;
import com.jee.ssm.modules.ssm.dao.RolePowerDao;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 权限 Service
 * @author GaoXiang
 * @version 1.0
 */
@Service
public class PowerService extends BaseService<Power> {

    @Resource
    private PowerDao powerDao;

    @Resource
    private RolePowerDao rolePowerDao;

    /**
     * 获取全部权限 标识所属角色
     * @param roleId 角色id
     * @return 全部权限
     */
    public List<Power> findByRoleEdit(String roleId) {
        try {
            List<Power> p = powerDao.findAllByRoleId(roleId);
            return getPowers(p);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取用户权限
     * @param accountId 根据用户获取用户所有角色的权限
     * @return 用户权限列表
     */
    public List<Power> findByAccountId(String accountId){

        List<Power> p = powerDao.findByAccountId(accountId);
        return getPowers(p);
    }

    private List<Power> getPowers(List<Power> p) {
        List<Power> menu = searchListByParentId(p,"0");
        for(Power pp : menu){
            pp.setPowers(searchListByParentId(p,pp.getId()));
            for(Power ppp : pp.getPowers()){
                ppp.setPowers(searchListByParentId(p,ppp.getId()));
            }
        }
        return menu;
    }

    /**
     * 获取全部权限，主要用于权限父类选择
     * @return 全部权限列表，第一层list的parentId 为 0
     */
    public List<Power> listAll() throws Exception {

        List<Power> p = list(null).getList();
        return getPowers(p);
    }

    /**
     * 在list中寻找指定parentid的数据 并返回
     * @param list 全部权限
     * @param parentId 父级id
     * @return 所属父级的全部权限
     */
    private List<Power> searchListByParentId(List<Power> list,String parentId){
        List<Power> temp = new ArrayList<>();
        for(Power p : list){
            if(p.getParentId().equals(parentId)){
                temp.add(p);
            }
        }
        return temp;
    }

    public List<Power> findByParentId(String parentId) {
        return powerDao.findByParentId(parentId);
    }

    /**
     * 保存数据
     * @param power 实体对象
     * @return 实体id
     * @throws Exception 数据保存异常
     */
    public Integer insert(Power power) throws Exception {

        //默认所属超级管理员角色
        RolePower rolePower = new RolePower();
        rolePower.setId(UUIDFactory.getStringId());
        rolePower.setPowerId(power.getId());
        rolePower.setRoleId("888888");
        rolePowerDao.insert(rolePower);

        return powerDao.insert(power);
    }

    /**
     * 根据 id 修改
     * @param power 带id的实体对象
     * @return 受影响的行数
     * @throws Exception 数据修改异常
     */
    public Integer updateById(Power power) throws Exception {
        return powerDao.updateById(power);
    }

    /**
     * 根据 id 删除 以及删除所有下属
     * @param id 数据id
     * @return 受影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteById(String id) throws Exception {
        deleteByParentId(id);
        rolePowerDao.deleteByPowerId(id);
        return powerDao.deleteById(id);
    }

    /**
     * 根据 id 查找
     * @param id 实体id
     * @return 实体
     * @throws Exception 查询异常
     */
    public Power selectById(String id) {
        return powerDao.selectById(id);
    }

    /**
     * 根据 id 批量删除
     * @param ids 要删除的id
     * @return 影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteByIds(List<String> ids) throws Exception {
        for (String id : ids) {
            deleteByParentId(id);
            rolePowerDao.deleteByPowerId(id);
        }
        return powerDao.deleteByIds(ids);
    }

    /**
     * 删除所有下级 以及下级的下级
     * @param id 权限id
     * @throws Exception 删除失败
     */
    private void deleteByParentId(String id) throws Exception {
        List<Power> list = findByParentId(id);
        for (Power p : list) {
            List<Power> list2 = findByParentId(p.getId());
            for (Power p2 : list2) {
                powerDao.deleteById(p2.getId());
                rolePowerDao.deleteByPowerId(id);
            }
            powerDao.deleteById(p.getId());
            rolePowerDao.deleteByPowerId(id);
        }
    }

    /**
     * 查询列表
     * @param map 参数
     * @return 列表
     * @throws Exception 数据返回异常
     */
    public PageInfo<Power> list(Map map) {
        return powerDao.list(map);
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
        return powerDao.list(map,page,size);
    }


}
