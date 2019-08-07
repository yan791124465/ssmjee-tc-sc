package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.model.param.ParamMap;
import com.jee.ssm.modules.ssm.services.CityService;
import com.jee.ssm.model.City;
import com.jee.ssm.common.log.AdminControllerLog;
import com.jee.ssm.model.json.Tip;
import com.jee.ssm.common.utils.UUIDFactory;
import com.github.pagehelper.PageInfo;
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
 * 城市管理 Controller
 * @author GaoXiang
 * @version 1.0
 */
@Controller
@RequestMapping("/city")
public class CityController extends AdminBaseController<City> {


    /**
     * 进入城市添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    public ModelAndView add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return new ModelAndView("manager/city/add",model);
    }


    /**
     * 进入城市编辑页面
     * @param model 返回城市的容器
     * @param id 城市id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/edit")
    public ModelAndView edit(ModelMap model, @RequestParam String id) throws Exception {

        model.put("data",cityService.selectById(id));
        return new ModelAndView("manager/city/edit",model);
    }


    /**
     * 城市添加
     * @param city 带id的城市对象
     * @return 成功状态
     * @throws Exception 数据添加异常
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @AdminControllerLog(description = "添加城市" )
    public Tip save(City city) throws Exception {

        cityService.insert(city);
        return new Tip();
    }


    /**
     * 根据 id 修改城市
     * @param city 带id的城市对象
     * @return 成功状态
     * @throws Exception 数据修改异常
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @AdminControllerLog(description = "修改城市" )
    public Tip update(City city) throws Exception {

        cityService.updateById(city);
        return new Tip();
    }


    /**
     * 根据 id 删除城市
     * @param id 城市id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @AdminControllerLog(description = "删除城市" )
    public Tip delete(@RequestParam String id) throws Exception {

        cityService.deleteById(id);
        return new Tip();
    }


    /**
     * 根据 id 列表批量删除
     * @param ids 城市id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @AdminControllerLog(description = "批量删除城市" )
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) throws Exception {

        cityService.deleteByIds(ids);
        return new Tip();
    }


    /**
     * 根据 id 查找城市
     * @param id 城市id
     * @return 城市对象 json
     * @throws Exception 查找城市失败
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    public City find(@RequestParam String id) throws Exception {

        return cityService.selectById(id);
    }


    /**
     * 获取城市列表 获取全部 不分页
     * @param request 请求参数
     * @return 城市列表页面
     * @throws Exception 获取城市列表失败
     */
    @RequestMapping(value="/all")
    public ModelAndView all(HttpServletRequest request) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<City> pageInfo =  cityService.list(paramMap);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("manager/city/list",paramMap);
    }


    /**
     * 获取城市列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return 城市列表页面
     * @throws Exception 获取城市列表失败
     */
    @RequestMapping(value="/list")
    public ModelAndView list(HttpServletRequest request,@RequestParam Integer page, @RequestParam Integer size) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<City> pageInfo =  cityService.list(paramMap,page,size);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("manager/city/list",paramMap);
    }







    //---------------------------- property -------------------------------

    @Resource
    private CityService cityService;

}
