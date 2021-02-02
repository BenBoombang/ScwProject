package com.ben.scw.service.Impl;

import com.ben.scw.dao.TRoleMapper;
import com.ben.scw.pojo.TRole;
import com.ben.scw.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @AUTHOR Ben
 * @time 2021/1/31 - 10:30
 * @Description
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private TRoleMapper tRoleMapper;

    @Override
    public List<TRole> queryAllRole() {
        return tRoleMapper.selectByExample(null);
    }

    @Override
    public List<TRole> queryUserRole(Integer userid) {
        return tRoleMapper.queryUserRole(userid);
    }
}
