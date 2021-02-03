package com.ben.scw.controller.permission;

import com.ben.scw.pojo.AjaxResult;
import com.ben.scw.pojo.TRole;
import com.ben.scw.pojo.vo.RoleVo;
import com.ben.scw.service.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @AUTHOR Ben
 * @time 2021/1/31 - 22:20
 * @Description
 */
@Controller
@RequestMapping("/permission/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/toRoleMain")
    public String toRoleMain(){
        return "manager/permission/role";
    }

    @ResponseBody
    @PostMapping("/queryAll")
    public Object queryAll(RoleVo roleVo){
        AjaxResult ajaxResult = new AjaxResult();

        List<TRole> tRoles = null;
        try {
            PageHelper.startPage(roleVo.getPageno(),roleVo.getPagesize());
            if (StringUtils.isEmpty(roleVo.getQueryText())){
                tRoles = roleService.queryAllRole();
            }else {
                tRoles = roleService.queryAllRoleByCondition(roleVo.getQueryText());
            }

            PageInfo<TRole> info = new PageInfo<>(tRoles);

            ajaxResult.setData(info);

            ajaxResult.setSucc(true);
        }catch (Exception e){
            ajaxResult.setSucc(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
}
