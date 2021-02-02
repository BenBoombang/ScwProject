package com.ben.scw.controller;

import com.ben.scw.pojo.TUser;
import com.ben.scw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @AUTHOR Ben
 * @time 2021/1/26 - 19:53
 * @Description
 */
@Controller
public class PersonController {

    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping("/hello")
    public TUser hello(@RequestParam(name = "id") Integer id){
        TUser tUser = userService.queryById(id);
        return tUser;
    }
}
