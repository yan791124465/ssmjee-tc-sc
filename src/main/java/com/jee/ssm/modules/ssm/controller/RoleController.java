package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.model.AccountRole;
import com.jee.ssm.model.Role;
import com.jee.ssm.model.RolePower;
import com.jee.ssm.model.param.ParamMap;
import com.jee.ssm.modules.ssm.services.AccountRoleService;
import com.jee.ssm.common.log.AdminControllerLog;
import com.jee.ssm.model.json.Tip;
import com.jee.ssm.modules.ssm.services.RolePowerService;
import com.jee.ssm.modules.ssm.services.RoleService;
import com.jee.ssm.common.utils.UUIDFactory;
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
import java.util.Date;
import java.util.List;

/**
 * 角色 Controller
 * @author GaoXiang
 * @version 1.0
 */
@Controller
@RequestMapping("/role")
public class RoleController extends AdminBaseController<Role>{
    /**
     * 根据roleID获取所有权限，并且显示那些属于这个角色
     * 用于角色授权
     * @param accountId  账号ID
     * @return 页面
     */
    @RequestMapping("/findByAccountInfo")
    public String findByAccountInfo(String accountId,ModelMap model){
        List<Role> roleList = roleService.findByAccountEdit(accountId);
        model.put("roleList",roleList);
        return "manager/account/chooseRole";
    }
    /**
     * 根据重新授权角色
     * @param accountId 角色id
     * @return 成功状态
     */
    @RequestMapping(value="/changeRole")
    @ResponseBody
    public Tip changeRole(String accountId,@RequestParam("roles") List<String> roles)  {
        try {
            accountRoleService.deleteByAccountId(accountId);

            AccountRole accountRole;
            for(String r : roles){
                accountRole = new AccountRole();
                accountRole.setId(UUIDFactory.getStringId());
                accountRole.setAccountId(accountId);
                accountRole.setRoleId(r);
                accountRoleService.insert(accountRole);
            }
            return new Tip();
        } catch (Exception e) {
            e.printStackTrace();
            return new Tip(1);
        }
    }
    @RequestMapping(value="/changePower")
    @ResponseBody
    public Tip changePower(String roleId,@RequestParam("powers") List<String> powers){
        try {
            rolePowerService.deleteByRoleId(roleId);

            RolePower rolePower ;
            for(String powerId : powers){
                rolePower = new RolePower();
                rolePower.setId(UUIDFactory.getStringId());
                rolePower.setRoleId(roleId);
                rolePower.setPowerId(powerId);
                rolePowerService.insert(rolePower);
            }
            return new Tip();
        } catch (Exception e) {
            return new Tip(1);
        }
    }
    /**
     * 进入角色添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    @RequiresPermissions("role:add")
    public ModelAndView add(ModelMap model){
        model.put("longId", UUIDFactory.getStringId());
        return new ModelAndView("manager/role/add",model);
    }
    /**
     * 进入角色编辑页面
     * @param model 返回角色的容器
     * @param id 角色id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/edit")
    @RequiresPermissions("role:edit")
    public ModelAndView edit(ModelMap model, @RequestParam String id) {
        model.put("data",roleService.selectById(id));
        return new ModelAndView("manager/role/edit",model);
    }
    /**
     * 角色添加
     * @param role 带id的角色对象
     * @return 成功状态
     * @throws Exception 数据添加异常
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @AdminControllerLog(description = "添加角色" )
    @RequiresPermissions("role:add")
    public Tip save(Role role) throws Exception {
        role.setSetTime(new Date());
        roleService.insert(role);
        return new Tip();
    }
    /**
     * 根据 id 修改角色
     * @param role 带id的角色对象
     * @return 成功状态
     * @throws Exception 数据修改异常
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @AdminControllerLog(description = "修改角色" )
    @RequiresPermissions("role:edit")
    public Tip update(Role role) throws Exception {

        roleService.updateById(role);
        return new Tip();
    }
    /**
     * 根据 id 删除角色
     * @param id 角色id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @AdminControllerLog(description = "删除角色" )
    @RequiresPermissions("role:delete")
    public Tip delete(@RequestParam String id) {

        try {
            roleService.deleteById(id);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1);
        }
    }
    /**
     * 根据 id 列表批量删除
     * @param ids 角色id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @AdminControllerLog(description = "批量删除角色" )
    @RequiresPermissions("role:delete")
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) {

        try {
            roleService.deleteByIds(ids);
            return new Tip();
        } catch (Exception e) {
            //e.printStackTrace();
            return new Tip(1);
        }
    }
    /**
     * 根据 id 查找角色
     * @param id 角色id
     * @return 角色对象 jsonj
     * @throws Exception 查找角色失败
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    public Role find(@RequestParam String id) {

        return roleService.selectById(id);
    }
    /**
     * 获取角色列表 获取全部 不分页
     * @param request 请求参数
     * @return 角色列表页面
     * @throws Exception 获取角色列表失败
     */
    @RequestMapping(value="/all")
    @RequiresPermissions("role:list")
    public String all(HttpServletRequest request,ModelMap modelMap) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Role> pageInfo =  roleService.list(paramMap);
        paramMap.put("pageInfo",pageInfo);
        modelMap.putAll(paramMap);
        return "manager/role/list";
    }
    /**
     * 获取角色列表 分页
     * @return 角色列表页面
     * @throws Exception 获取角色列表失败
     */
    @RequestMapping(value="/list")
    @RequiresPermissions("role:list")
    public String list(HttpServletRequest request,ModelMap modelMap,Integer page,Integer size) throws Exception {
        ParamMap paramMap = new ParamMap(request);
        PageInfo<Role> pageInfo =  roleService.list(paramMap,page,size);
        modelMap.put("pageInfo",pageInfo);
        modelMap.putAll(paramMap);
        return "manager/role/list";
    }


    //----------------------------- property ----------------------------------
    @Resource
    private RoleService roleService;

    @Resource
    private RolePowerService rolePowerService;

    @Resource
    private AccountRoleService accountRoleService;
}
