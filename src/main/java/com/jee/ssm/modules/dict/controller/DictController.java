package com.jee.ssm.modules.dict.controller;

import com.jee.ssm.model.Dict;
import com.jee.ssm.modules.dict.services.DictService;
import com.jee.ssm.common.log.AdminControllerLog;
import com.jee.ssm.modules.ssm.controller.AdminBaseController;
import com.jee.ssm.model.json.Tip;
import com.jee.ssm.model.param.ParamMap;
import com.jee.ssm.common.utils.UUIDFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
* 字典管理 Controller
* @author GaoXiang
* @version 1.0
*/
@Controller
@RequestMapping("/dict")
public class DictController extends AdminBaseController<Dict> {


    /**
     * 进入字典添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    @RequiresPermissions("dict:add")
    public String add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return "manager/dict/add";
    }


    /**
     * 进入字典编辑页面
     * @param model 返回字典的容器
     * @param id 字典id
     * @return 编辑页面
     */
    @RequestMapping(value="/edit")
    @RequiresPermissions("dict:edit")
    public String edit(ModelMap model, @RequestParam String id) {

        model.put("data",dictService.selectById(id));
        return "manager/dict/edit";
    }


    /**
     * 字典添加
     * @param dict 带id的字典对象
     * @return 成功状态
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @RequiresPermissions("dict:add")
    @AdminControllerLog(description = "添加字典" )
    public Tip save(Dict dict)  {

        try {
            dictService.insert(dict);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"添加失败！");
        }

    }


    /**
     * 根据 id 修改字典
     * @param dict 带id的字典对象
     * @return 成功状态
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @RequiresPermissions("dict:edit")
    @AdminControllerLog(description = "修改字典" )
    public Tip update(Dict dict) {

        try {
            dictService.updateById(dict);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"修改失败！");
        }

    }


    /**
     * 根据 id 删除字典
     * @param id 字典id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @RequiresPermissions("dict:delete")
    @AdminControllerLog(description = "删除字典" )
    public Tip delete(@RequestParam String id) {

        try {
            dictService.deleteById(id);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"删除失败！");
        }

    }


    /**
     * 根据 id 列表批量删除
     * @param ids 字典id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @RequiresPermissions("dict:delete")
    @AdminControllerLog(description = "批量删除字典" )
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) {

        try {
            dictService.deleteByIds(ids);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"批量删除失败！");
        }

    }


    /**
     * 根据 id 查找字典
     * @param id 字典id
     * @return 字典对象 json
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    @RequiresPermissions("dict:list")
    public Dict find(@RequestParam String id) {

        return dictService.selectById(id);
    }


    /**
     * 获取字典列表 获取全部 不分页
     * @param request 请求参数
     * @return 字典列表页面
     */
    @RequestMapping(value="/all")
    @RequiresPermissions("dict:list")
    public String all(HttpServletRequest request,ModelMap modelMap) {

        return list(request,modelMap,1,0);
    }


    /**
     * 获取字典列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return 字典列表页面
     */
    @RequestMapping(value="/list")
    @RequiresPermissions("dict:list")
    public String list(HttpServletRequest request,ModelMap modelMap,Integer page,Integer size) {

        modelMap.put("pageInfo",dictService.list(new ParamMap(request),page,size));
        modelMap.putAll(new ParamMap(request));
        return "manager/dict/list";
    }


    //---------------------------- property -------------------------------

    @Resource
    private DictService dictService;

}
