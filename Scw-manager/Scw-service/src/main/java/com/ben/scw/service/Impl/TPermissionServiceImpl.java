package com.ben.scw.service.Impl;

import com.ben.scw.dao.TPermissionMapper;
import com.ben.scw.pojo.TPermission;
import com.ben.scw.service.TPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @AUTHOR Ben
 * @time 2021/1/30 - 10:44
 * @Description
 */
@Service
public class TPermissionServiceImpl implements TPermissionService {

    @Autowired
    private TPermissionMapper permissionMapper;

    /**
     * 查询所有左侧菜单数据
     * @return
     */
    @Override
    public List<TPermission> queryAllMenus() {

        // 先定义一个最终的返回结果
        List<TPermission> resultMenu = new ArrayList<>();

        // 定义一个 map 用来存最开始查到的所有数据
        Map<Integer,Object> map = new HashMap<>();

        List<TPermission> permissions = permissionMapper.selectByExample(null);

        for (TPermission permission : permissions) {
            map.put(permission.getId(),permission);
        }


        for (TPermission permission : permissions) {
            if (permission.getPid() == 0){
                resultMenu.add(permission);
            }else {
                // 如果不是父级菜单，就获取当前这个菜单的父级是什么
                Integer pid = permission.getPid();

                // 从最开始的那个 map 中获取对应的父级
                TPermission p_permission =(TPermission) map.get(pid);

                // 将当前这个 permission 设置到对应的父级中去
                p_permission.getChilds().add(permission);
            }
        }

        return resultMenu;
    }
}
