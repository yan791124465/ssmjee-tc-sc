package com.jee.ssm.modules.${lower}.controller;

import ${modelPackage};
import ${servicePackage};
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
* ${modelName}管理 Controller
* @author GaoXiang
* @version 1.0
*/
@Controller
@RequestMapping("/${lower}")
public class ${upper}Controller extends AdminBaseController<${upper}> {


    /**
     * 进入${modelName}添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    @RequiresPermissions("${lower}:add")
    public String add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return "manager/${lower}/add";
    }


    /**
     * 进入${modelName}编辑页面
     * @param model 返回${modelName}的容器
     * @param id ${modelName}id
     * @return 编辑页面
     */
    @RequestMapping(value="/edit")
    @RequiresPermissions("${lower}:edit")
    public String edit(ModelMap model, @RequestParam String id) {

        model.put("data",${lower}Service.selectById(id));
        return "manager/${lower}/edit";
    }


    /**
     * ${modelName}添加
     * @param ${lower} 带id的${modelName}对象
     * @return 成功状态
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @RequiresPermissions("${lower}:add")
    @AdminControllerLog(description = "添加${modelName}" )
    public Tip save(${upper} ${lower})  {

        try {
            ${lower}Service.insert(${lower});
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"添加失败！");
        }

    }


    /**
     * 根据 id 修改${modelName}
     * @param ${lower} 带id的${modelName}对象
     * @return 成功状态
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @RequiresPermissions("${lower}:edit")
    @AdminControllerLog(description = "修改${modelName}" )
    public Tip update(${upper} ${lower}) {

        try {
            ${lower}Service.updateById(${lower});
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"修改失败！");
        }

    }


    /**
     * 根据 id 删除${modelName}
     * @param id ${modelName}id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @RequiresPermissions("${lower}:delete")
    @AdminControllerLog(description = "删除${modelName}" )
    public Tip delete(@RequestParam String id) {

        try {
            ${lower}Service.deleteById(id);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"删除失败！");
        }

    }


    /**
     * 根据 id 列表批量删除
     * @param ids ${modelName}id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @RequiresPermissions("${lower}:delete")
    @AdminControllerLog(description = "批量删除${modelName}" )
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) {

        try {
            ${lower}Service.deleteByIds(ids);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"批量删除失败！");
        }

    }


    /**
     * 根据 id 查找${modelName}
     * @param id ${modelName}id
     * @return ${modelName}对象 json
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    @RequiresPermissions("${lower}:list")
    public ${upper} find(@RequestParam String id) {

        return ${lower}Service.selectById(id);
    }


    /**
     * 获取${modelName}列表 获取全部 不分页
     * @param request 请求参数
     * @return ${modelName}列表页面
     */
    @RequestMapping(value="/all")
    @RequiresPermissions("${lower}:list")
    public String all(HttpServletRequest request,ModelMap modelMap) {

        return list(request,modelMap,1,0);
    }


    /**
     * 获取${modelName}列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return ${modelName}列表页面
     */
    @RequestMapping(value="/list")
    @RequiresPermissions("${lower}:list")
    public String list(HttpServletRequest request,ModelMap modelMap,Integer page,Integer size) {

        modelMap.put("pageInfo",${lower}Service.list(new ParamMap(request),page,size));
        modelMap.putAll(new ParamMap(request));
        return "manager/${lower}/list";
    }


    //---------------------------- property -------------------------------

    @Resource
    private ${upper}Service ${lower}Service;

}
