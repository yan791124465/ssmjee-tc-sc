package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.common.config.Const;
import com.jee.ssm.common.utils.ImageHelper;
import com.jee.ssm.common.utils.UUIDFactory;
import com.jee.ssm.model.Account;
import com.jee.ssm.model.Admin;
import com.jee.ssm.model.param.ParamMap;
import com.jee.ssm.modules.ssm.services.AccountService;
import com.jee.ssm.modules.ssm.services.AdminService;
import com.jee.ssm.common.log.AdminControllerLog;
import com.jee.ssm.model.json.Tip;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 管理员 Controller
 * @author GaoXiang
 * @version 1.0
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends AdminBaseController<Admin> {

    /**
     * 携带信息跳转到修改头像页面
     * @param id 管理员id
     * @return 头衔修改页面
     * @throws Exception 跳转头像修改页面错误
     */
    @RequestMapping(value="/headimg")
    public ModelAndView headImg(@RequestParam String id) {
        return new ModelAndView("manager/admin/headimg","data",adminService.selectById(id));
    }

    /**
     * 裁剪并应用新头像
     * @param request 请求信息
     * @param session 获取session
     * @param x1 裁剪开始坐标
     * @param y1 裁剪开始坐标
     * @param w 裁剪宽度
     * @param h 裁剪高度
     * @param id 管理员id
     * @param src 完整图片地址
     * @return
     */
    @RequestMapping(value="/changeHead")
    @ResponseBody
    public Tip changeHead(HttpServletRequest request,HttpSession session,
            @RequestParam(required = false) Integer x1,
            @RequestParam(required = false) Integer y1,
            @RequestParam(required = false) Integer w,
            @RequestParam(required = false) Integer h,
            @RequestParam(required = false) String id,
            @RequestParam(required = false) String src
    ) {

        if ("".equals(src)) {
            return new Tip(1); //请选择图片
        } else if (x1 == null || w == null || y1 == null || h == null) {
            return new Tip(2); //请选择剪裁区域
        } else {
            File file = new File(src);
            //保存地址
            String url = "/images/headImage/"
                    + System.currentTimeMillis()
                    + "_head"
                    + file.getName().substring(file.getName().lastIndexOf("."));

            String realPath = request.getServletContext().getRealPath(url);
            //剪裁
            try {
                ImageHelper.cutImage(file, realPath, x1, y1, w, h);
            } catch (IOException e) {
                e.printStackTrace();
                return new Tip(3); //剪裁失败
            }

            try {
                //获取账号信息 更改头像
                Admin admin = adminService.selectById(id);
                admin.setHead(url);
                adminService.updateById(admin);
                //更新session内对象
                session.setAttribute(Const.ADMIN,admin);
                return new Tip(url);
            } catch (Exception e) {
                e.printStackTrace();
                return new Tip(4); // 保存失败
            }
        }
    }



    /**
     * 保存
     * @param admin 管理员信息
     * @return 状态
     * 1，管理员信息错误
     * 2，账号信息错误
     * 3，账号已存在
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @RequiresPermissions("admin:add")
    public Tip save(Admin admin) throws Exception {

        Account isNull = accountService.findByUserName(admin.getUserName());
        if(isNull != null){
            return new Tip(3,isNull.getId());
        }else{
            Account account = new Account();
            account.setId(UUIDFactory.getStringId());
            account.setUserName(admin.getUserName());
            account.setPassword(admin.getPassword());
            account.setInfoId(admin.getId());
            account.setStatus(1);
            account.setType(1);

            admin.setSetTime(new Date());
            admin.setName(admin.getUserName());
            accountService.insert(account);
            adminService.insert(admin);
            return new Tip();
        }
    }


    /**
     * 进入管理员添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    @RequiresPermissions("admin:add")
    public ModelAndView add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return new ModelAndView("manager/admin/add",model);
    }


    /**
     * 进入管理员编辑页面
     * @param model 返回管理员的容器
     * @param id 管理员id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/edit")
    @RequiresPermissions("admin:edit")
    public ModelAndView edit(ModelMap model, @RequestParam String id) {

        model.put("data",adminService.selectById(id));
        return new ModelAndView("manager/admin/edit",model);
    }

    /**
     * 进入管理员编辑页面
     * @param model 返回管理员的容器
     * @param id 管理员id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/info")
    public ModelAndView info(ModelMap model, @RequestParam String id) {

        model.put("data",adminService.selectById(id));
        return new ModelAndView("manager/admin/info",model);
    }


    /**
     * 根据 id 修改管理员
     * @param admin 带id的管理员对象
     * @return 成功状态
     * @throws Exception 数据修改异常
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @AdminControllerLog(description = "修改管理员" )
    @RequiresPermissions("admin:edit")
    public Tip update(Admin admin) throws Exception {

        adminService.updateById(admin);
        return new Tip();
    }


    /**
     * 根据 id 删除管理员
     * @param id 管理员id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @AdminControllerLog(description = "删除管理员" )
    @RequiresPermissions("admin:delete")
    public Tip delete(@RequestParam String id) {

        try {
            adminService.deleteById(id);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1);
        }
    }

    /**
     * 禁用管理员登录
     * @param id 管理员id
     * @return 处理状态
     */
    @RequestMapping(value="/disableAdmin")
    @ResponseBody
    @AdminControllerLog(description = "禁用管理员登陆" )
    @RequiresPermissions("admin:delete")
    public Tip disableAdmin(@RequestParam String id){
        try {
            accountService.disableAccount(id);
            return new Tip();
        } catch (Exception e) {
            return new Tip(1,e.getMessage());
        }
    }

    /**
     * 允许管理员登录
     * @param id 管理员id
     * @return 处理状态
     */
    @RequestMapping(value="/allowAdmin")
    @ResponseBody
    @AdminControllerLog(description = "允许管理员登陆" )
    @RequiresPermissions("admin:delete")
    public Tip allowAdmin(@RequestParam String id){
        try {
            accountService.allowAccount(id);
            return new Tip();
        } catch (Exception e) {
            return new Tip(1,e.getMessage());
        }
    }


    /**
     * 根据 id 列表批量删除
     * @param ids 管理员id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @AdminControllerLog(description = "批量删除管理员" )
    @RequiresPermissions("admin:delete")
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) {

        try {
            adminService.deleteByIds(ids);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1);
        }
    }


    /**
     * 根据 id 查找管理员
     * @param id 管理员id
     * @return 管理员对象 json
     * @throws Exception 查找管理员失败
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    public Admin find(@RequestParam String id) {

        return adminService.selectById(id);
    }


    /**
     * 获取管理员列表 获取全部 不分页
     * @param request 请求参数
     * @return 管理员列表页面
     * @throws Exception 获取管理员列表失败
     */
    @RequestMapping(value="/all")
    @RequiresPermissions("admin:list")
    public ModelAndView all(HttpServletRequest request) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Admin> pageInfo =  adminService.list(paramMap);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("manager/admin/list",paramMap);
    }


    /**
     * 获取管理员列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return 管理员列表页面
     * @throws Exception 获取管理员列表失败
     */
    @RequestMapping(value="/list")
    @RequiresPermissions("admin:list")
    public ModelAndView list(HttpServletRequest request,@RequestParam Integer page, @RequestParam Integer size) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Admin> pageInfo =  adminService.list(paramMap,page,size);
        for(Admin admin : pageInfo.getList()){
                admin.setAccount(accountService.findByInfoId(admin.getId()));
        }
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("manager/admin/list",paramMap);
    }


    //--------------------------- property --------------------------
    @Resource
    AccountService accountService;

    @Resource
    AdminService adminService;
}
