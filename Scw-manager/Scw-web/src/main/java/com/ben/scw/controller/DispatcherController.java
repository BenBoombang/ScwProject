package com.ben.scw.controller;

import com.ben.scw.pojo.TPermission;
import com.ben.scw.service.TPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @AUTHOR Ben
 * @time 2021/1/28 - 20:46
 * @Description
 */
@Controller
public class DispatcherController {

    @Autowired
    private TPermissionService permissionService;

    @RequestMapping("/toLoginPage")
    public String toLoginPage(HttpSession session){
        Object loginuser = session.getAttribute("loginuser");
        if (loginuser == null){
            return "redirect:/login.jsp";
        }

        if (session.getAttribute("menus") == null){
            // 获取左侧菜单数据
            List<TPermission> menus = permissionService.queryAllMenus();

            session.setAttribute("menus",menus);
        }

        return "manager/main";
    }
}
