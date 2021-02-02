package com.ben.scw.controller.permission;

import com.ben.scw.pojo.AjaxResult;
import com.ben.scw.pojo.TRole;
import com.ben.scw.pojo.TUser;
import com.ben.scw.pojo.vo.UserVo;
import com.ben.scw.service.RoleService;
import com.ben.scw.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @AUTHOR Ben
 * @time 2021/1/27 - 20:18
 * @Description
 */
@Controller
@RequestMapping("/permission/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;




    /**
     * 用户注册功能
     * @param user
     * @return
     */
    @RequestMapping("/reg")
    public String reg(TUser user, Model model){
        boolean flag = userService.register(user);

        if (flag){
            // 注册成功，跳转到登录页
            return "redirect:/login.jsp";
        }else {
            // 注册失败，则携带用来注册的信息，返回到注册页面，将信息回显到页面上
            // 实际上 user 会自动被放到域中，但手动添加一下更明确
            model.addAttribute("errorUser",user);
            // 再附带一个错误信息
            model.addAttribute("errorMsg","注册失败");

            // 因为要携带数据，所以不能是 redirect
            return "forward:/reg.jsp";
        }

    }

    @RequestMapping("/login")
    public String login(TUser user, HttpSession session){

        TUser loginUser = userService.login(user);

        if (loginUser == null){
            session.setAttribute("errorLoginUser",user);
            session.setAttribute("errorLoginMsg","errorLogin");
            return "redirect:/login.jsp";
        }

        // 登录成功
        session.setAttribute("loginuser",loginUser);
        return "redirect:/toLoginPage";
    }


    @RequestMapping("/toUserMain")
    public String toUserMain(){
        return "manager/permission/user";
    }


    @ResponseBody
    @RequestMapping(value = "/queryAllUser",method = RequestMethod.POST)
    public Object queryAllUser(UserVo userVo){

        AjaxResult ajaxResult = new AjaxResult();

        try {

            PageHelper.startPage(userVo.getPageno(),userVo.getPagesize());
            List<TUser> users = userService.queryAllUser(userVo.getQueryText());
            // 创建一个 pageinfo 对象
            PageInfo<TUser> info = new PageInfo<>(users);

            ajaxResult.setData(info);

            ajaxResult.setSucc(true);

        }catch (Exception e){
            ajaxResult.setSucc(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }


    @ResponseBody
    @RequestMapping("/queryUsersByCondition")
    public Object queryUsersByCondition(UserVo userVo){

        AjaxResult ajaxResult = new AjaxResult();

        try {
            PageHelper.startPage(userVo.getPageno(),userVo.getPagesize());
            List<TUser> users = userService.queryUsersByCondition(userVo.getLoginacct(),userVo.getEmail());

            PageInfo<TUser> info = new PageInfo<>(users);

            ajaxResult.setData(info);

            ajaxResult.setSucc(true);
        } catch (Exception e){
            ajaxResult.setSucc(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }


    /**
     * 根据 id 删除单个用户
     * @param id
     * @return
     */
    @ResponseBody
    @PostMapping("/deleteUser/{userId}")
    public Object deleteUser(@PathVariable(name = "userId") Integer id){

        AjaxResult ajaxResult = new AjaxResult();

        try {

            userService.deleteUserById(id);

            ajaxResult.setSucc(true);
        }catch (Exception e){
            ajaxResult.setSucc(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }


    /**
     * 删除多个用户
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteUsers")
    public Object deleteUsers(Integer[] userid,String[] loginacct){

        AjaxResult ajaxResult = new AjaxResult();

        try {

            userService.deleteUsers(userid);

            ajaxResult.setSucc(true);
        }catch (Exception e){
            ajaxResult.setSucc(false);
            e.printStackTrace();
        }

        return ajaxResult;

    }


    /**
     * 跳转到指定用户的角色显示页面
     * @param userid
     * @return
     */
    @GetMapping("/toRolePage/{userid}")
    public ModelAndView toRolePage(@PathVariable(name = "userid") Integer userid){
        ModelAndView mv = new ModelAndView();

        // 先查出所有角色
        List<TRole> roles = roleService.queryAllRole();

        // 再查出当前用户有的角色
        List<TRole> userRoles = roleService.queryUserRole(userid);
        Map<Integer,TRole> map = new HashMap<>();
        for (TRole userRole : userRoles) {
            map.put(userRole.getId(),userRole);
        }

        // 创建一个 list 用来存放用户未分配的角色
        List<TRole> unAllotRole = new ArrayList<>();
        for (TRole role : roles) {
            if (!map.containsKey(role.getId())){
                unAllotRole.add(role);
            }
        }

        mv.addObject("userRoles",userRoles);
        mv.addObject("unAllotRole",unAllotRole);
        mv.addObject("userid",userid);

        mv.setViewName("manager/permission/assignRole");
        return mv;
    }


    /**
     * 给特定的用户分配角色
     * @param unAllotRoleIds
     * @param hidUserId
     * @return
     */
    @ResponseBody
    @RequestMapping("/allotRoles")
    public Object allotRoles(Integer[] unAllotRoleIds,Integer hidUserId){

        AjaxResult ajaxResult = new AjaxResult();

        try {

            userService.allotRoles(hidUserId,unAllotRoleIds);

            ajaxResult.setSucc(true);
        }catch (Exception e){
            ajaxResult.setSucc(false);
            e.printStackTrace();
        }

        return ajaxResult;

    }


    @ResponseBody
    @RequestMapping("/unAllotRoles")
    public Object unAllotRoles(Integer[] allotedRoleIds,Integer hidUserId){

        AjaxResult ajaxResult = new AjaxResult();

        try {

            userService.unAllotRoles(hidUserId,allotedRoleIds);

            ajaxResult.setSucc(true);
        }catch (Exception e){
            ajaxResult.setSucc(false);
            e.printStackTrace();
        }

        return ajaxResult;

    }
}
