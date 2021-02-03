package com.ben.scw.service;

import com.ben.scw.pojo.TRole;

import java.util.List;

/**
 * @AUTHOR Ben
 * @time 2021/1/31 - 10:30
 * @Description
 */
public interface RoleService {
    List<TRole> queryAllRole();

    List<TRole> queryUserRole(Integer userid);

    List<TRole> queryAllRoleByCondition(String queryText);
}
