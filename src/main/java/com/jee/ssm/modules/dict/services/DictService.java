package com.jee.ssm.modules.dict.services;

import com.jee.ssm.modules.dict.dao.DictDao;
import com.jee.ssm.model.Dict;
import com.jee.ssm.modules.ssm.services.BaseService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
* 字典管理 Service
* @author GaoXiang
* @version 1.0
*/
@Service
public class DictService extends BaseService<Dict> {

    @Resource
    private DictDao dictDao;


    /**
    * 保存数据
    * @param dict 实体对象
    * @return 实体id
    * @throws Exception 数据保存异常
    */
    public Integer insert(Dict dict) throws Exception {
        return dictDao.insert(dict);
    }

    /**
    * 根据 id 修改
    * @param dict 带id的实体对象
    * @return 受影响的行数
    * @throws Exception 数据修改异常
    */
    public Integer updateById(Dict dict) throws Exception {
        return dictDao.updateById(dict);
    }

    /**
    * 根据 id 删除
    * @param id 数据id
    * @return 受影响的行数
    * @throws Exception 数据删除异常
    */
    public Integer deleteById(String id) throws Exception {
        return dictDao.deleteById(id);
    }

    /**
    * 根据 id 查找
    * @param id 实体id
    * @return 实体
    */
    public Dict selectById(String id) {
        return dictDao.selectById(id);
    }

    /**
    * 根据 id 批量删除
    * @param ids 要删除的id
    * @return 影响的行数
    * @throws Exception 数据删除异常
    */
    public Integer deleteByIds(List<String> ids) throws Exception {
        return dictDao.deleteByIds(ids);
    }

    /**
    * 查询列表
    * @param map 参数
    * @return 列表
    */
    public PageInfo<Dict> list(Map map) {
        return dictDao.list(map);
    }

    /**
    * 查询列表 带分页
    * @param map 参数
    * @param page 页码
    * @param size 每页大小
    * @return 列表
    */
    public PageInfo<Dict> list(Map map,int page,int size) {
        return dictDao.list(map,page,size);
    }


}
