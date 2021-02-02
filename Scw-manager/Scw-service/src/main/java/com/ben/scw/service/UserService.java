package com.ben.scw.service;

import com.ben.scw.pojo.TUser;

import java.util.List;

/**
 * @AUTHOR Ben
 * @time 2021/1/26 - 21:10
 * @Description
 */
public interface UserService {

    public TUser queryById(Integer id);

    boolean register(TUser user);

    TUser login(TUser user);

    List<TUser> queryAllUser(String queryText);

    List<TUser> queryUsersByCondition(String loginacct, String email);

    void deleteUserById(Integer id);

    void deleteUsers(Integer[] userIds);

    void allotRoles(Integer hidUserId, Integer[] unAllotRoleIds);

    void unAllotRoles(Integer hidUserId, Integer[] allotedRoleIds);
}
