package com.jee.ssm.modules.log.controller;

import com.jee.ssm.model.Log;
import com.jee.ssm.modules.log.services.LogService;
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
* 日志管理 Controller
* @author GaoXiang
* @version 1.0
*/
@Controller
@RequestMapping("/log")
public class LogController extends AdminBaseController<Log> {


    /**
     * 进入日志添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    @RequiresPermissions("log:add")
    public String add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return "manager/log/add";
    }


    /**
     * 进入日志编辑页面
     * @param model 返回日志的容器
     * @param id 日志id
     * @return 编辑页面
     */
    @RequestMapping(value="/edit")
    @RequiresPermissions("log:edit")
    public String edit(ModelMap model, @RequestParam String id) {

        model.put("data",logService.selectById(id));
        return "manager/log/edit";
    }


    /**
     * 日志添加
     * @param log 带id的日志对象
     * @return 成功状态
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @RequiresPermissions("log:add")
    @AdminControllerLog(description = "添加日志" )
    public Tip save(Log log)  {

        try {
            logService.insert(log);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"添加失败！");
        }

    }


    /**
     * 根据 id 修改日志
     * @param log 带id的日志对象
     * @return 成功状态
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @RequiresPermissions("log:edit")
    @AdminControllerLog(description = "修改日志" )
    public Tip update(Log log) {

        try {
            logService.updateById(log);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"修改失败！");
        }

    }


    /**
     * 根据 id 删除日志
     * @param id 日志id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @RequiresPermissions("log:delete")
    @AdminControllerLog(description = "删除日志" )
    public Tip delete(@RequestParam String id) {

        try {
            logService.deleteById(id);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"删除失败！");
        }

    }


    /**
     * 根据 id 列表批量删除
     * @param ids 日志id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @RequiresPermissions("log:delete")
    @AdminControllerLog(description = "批量删除日志" )
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) {

        try {
            logService.deleteByIds(ids);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1,"批量删除失败！");
        }

    }


    /**
     * 根据 id 查找日志
     * @param id 日志id
     * @return 日志对象 json
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    @RequiresPermissions("log:list")
    public Log find(@RequestParam String id) {

        return logService.selectById(id);
    }


    /**
     * 获取日志列表 获取全部 不分页
     * @param request 请求参数
     * @return 日志列表页面
     */
    @RequestMapping(value="/all")
    @RequiresPermissions("log:list")
    public String all(HttpServletRequest request,ModelMap modelMap) {

        return list(request,modelMap,1,0);
    }


    /**
     * 获取日志列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return 日志列表页面
     */
    @RequestMapping(value="/list")
    @RequiresPermissions("log:list")
    public String list(HttpServletRequest request,ModelMap modelMap,Integer page,Integer size) {

        modelMap.put("pageInfo",logService.list(new ParamMap(request),page,size));
        modelMap.putAll(new ParamMap(request));
        return "manager/log/list";
    }


    //---------------------------- property -------------------------------

    @Resource
    private LogService logService;

}
