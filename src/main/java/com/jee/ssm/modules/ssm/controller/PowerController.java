package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.common.utils.UUIDFactory;
import com.jee.ssm.model.RolePower;
import com.jee.ssm.model.param.ParamMap;
import com.jee.ssm.modules.ssm.services.RolePowerService;
import com.jee.ssm.common.log.AdminControllerLog;
import com.jee.ssm.model.json.Tip;
import com.jee.ssm.model.Power;
import com.jee.ssm.modules.ssm.services.PowerService;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 权限 Controller
 * @author GaoXiang
 * @version 1.0
 */
@Controller
@RequestMapping("/power")
public class PowerController extends AdminBaseController<Power> {


    /**
     * 根据roleID获取所有权限，并且显示那些属于这个角色
     * 用于角色授权
     * @param roleId 角色ID
     * @return 页面
     */
    @RequestMapping("/findByRoleInfo")
    public String findByRoleInfo(String roleId,ModelMap model){
        List<Power> powerList = powerService.findByRoleEdit(roleId);
        model.put("powerList",powerList);
        return "manager/role/choosePower";
    }


    @RequestMapping("/save")
    @ResponseBody
    @RequiresRoles("admin")
    public Tip save(Power power) throws Exception {

        powerService.insert(power);
        return new Tip();
    }


    /**
     * 获取全部权限，主要用于权限父类选择
     * @return 全部权限列表，第一层list的parentId 为 0
     * @throws Exception 返回全部权限列表错误
     */
    @RequestMapping("/listAll")
    public ModelAndView listAll() throws Exception {
        return new ModelAndView("manager/power/chooseParent","powerList",powerService.listAll());
    }

    /**
     * 统计这一个父类下的权限有多少个，用于判断该权限排序
     * @param request 请求参数
     * @return 统计结果
     * @throws Exception 权限个数统计错误
     */
    @RequestMapping("/countByParentId")
    @ResponseBody
    public Integer countByParentId(HttpServletRequest request) throws Exception {
        ParamMap paramMap = new ParamMap(request);
        PageInfo<Power> pageInfo = powerService.list(paramMap);
        return pageInfo.getList().size();
    }


    /**
     * 进入权限添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    @RequiresRoles("admin")
    public ModelAndView add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return new ModelAndView("manager/power/add",model);
    }


    /**
     * 进入权限编辑页面
     * @param model 返回权限的容器
     * @param id 权限id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/edit")
    @RequiresRoles("admin")
    public ModelAndView edit(ModelMap model, @RequestParam String id) {

        model.put("data",powerService.selectById(id));
        return new ModelAndView("manager/power/edit",model);
    }



    /**
     * 根据 id 修改权限
     * @param power 带id的权限对象
     * @return 成功状态
     * @throws Exception 数据修改异常
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @AdminControllerLog(description = "修改权限" )
    @RequiresRoles("admin")
    public Tip update(Power power) throws Exception {

        powerService.updateById(power);
        return new Tip();
    }


    /**
     * 根据 id 删除权限
     * @param id 权限id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @AdminControllerLog(description = "删除权限" )
    @RequiresRoles("admin")
    public Tip delete(@RequestParam String id) {

        try {
            powerService.deleteById(id);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1);
        }
    }


    /**
     * 根据 id 列表批量删除
     * @param ids 权限id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @AdminControllerLog(description = "批量删除权限" )
    @RequiresRoles("admin")
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) {

        try {
            powerService.deleteByIds(ids);
            return new Tip();
        } catch (Exception e) {
            e.printStackTrace();
            return new Tip(1);
        }

    }


    /**
     * 根据 id 查找权限
     * @param id 权限id
     * @return 权限对象 json
     * @throws Exception 查找权限失败
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    public Power find(@RequestParam String id) {

        return powerService.selectById(id);
    }


    /**
     * 获取权限列表 获取全部 不分页
     * @param request 请求参数
     * @return 权限列表页面
     * @throws Exception 获取权限列表失败
     */
    @RequestMapping(value="/all")
    @RequiresRoles("admin")
    public ModelAndView all(HttpServletRequest request) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Power> pageInfo =  powerService.list(paramMap);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("manager/power/list",paramMap);
    }


    /**
     * 获取权限列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return 权限列表页面
     * @throws Exception 获取权限列表失败
     */
    @RequestMapping(value="/list")
    @RequiresRoles("admin")
    public ModelAndView list(HttpServletRequest request, @RequestParam Integer page, @RequestParam Integer size) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Power> pageInfo =  powerService.list(paramMap,page,size);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("manager/power/list",paramMap);
    }


    //---------------------------------- property ------------------------------------------
    @Resource
    PowerService powerService;

}
