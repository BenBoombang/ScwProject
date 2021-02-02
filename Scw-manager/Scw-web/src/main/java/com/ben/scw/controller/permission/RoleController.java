package com.ben.scw.controller.permission;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @AUTHOR Ben
 * @time 2021/1/31 - 22:20
 * @Description
 */
@Controller
@RequestMapping("/permission/role")
public class RoleController {

    @RequestMapping("/toRoleMain")
    public String toRoleMain(){
        return "manager/permission/role";
    }
}
