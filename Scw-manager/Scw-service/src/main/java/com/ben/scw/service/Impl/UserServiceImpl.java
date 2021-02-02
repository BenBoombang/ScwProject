package com.ben.scw.service.Impl;

import com.ben.scw.dao.TUserMapper;
import com.ben.scw.dao.TUserRoleMapper;
import com.ben.scw.pojo.Example.TUserExample;
import com.ben.scw.pojo.Example.TUserRoleExample;
import com.ben.scw.pojo.TUser;
import com.ben.scw.pojo.TUserRole;
import com.ben.scw.service.UserService;
import com.ben.scw.util.MyStringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @AUTHOR Ben
 * @time 2021/1/26 - 21:11
 * @Description
 */
@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private TUserMapper userMapper;

    @Autowired
    private TUserRoleMapper tUserRoleMapper;

    @Override
    public TUser queryById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean register(TUser user) {

        // 按照实际的业务逻辑，用户的密码应该要被加密，但这里先不做，之后引入安全框架后在加上

        // 由于在注册的时候没有指定昵称，所以这里默认设置用户的昵称与账号名相同
        user.setUsername(user.getLoginacct());

        // 给创建时间设置默认值
        user.setCreatetime(MyStringUtil.formatSimpleDate(new Date()));

        // 插入到数据库，Selective 表示传过来什么字段，就插入什么字段

        // 由于在数据库中设置了 账户 这个字段的唯一性约束，所以要捕获异常
        int i = 0;
        try {
            i = userMapper.insertSelective(user);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return i == 1;

    }

    @Override
    public TUser login(TUser user) {

        TUserExample example = new TUserExample();
        TUserExample.Criteria criteria = example.createCriteria();

        criteria.andLoginacctEqualTo(user.getLoginacct());
        criteria.andUserpswdEqualTo(user.getUserpswd());

        List<TUser> users = null;
        try {
            users = userMapper.selectByExample(example);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return users.size() == 1 ? users.get(0) : null;
    }

    @Override
    public List<TUser> queryAllUser(String queryText) {
        if (StringUtils.isEmpty(queryText)){
            return userMapper.selectByExample(null);
        }else {
            TUserExample example = new TUserExample();
            TUserExample.Criteria criteria = example.createCriteria();

            criteria.andLoginacctLike(queryText);

            return userMapper.selectByExample(example);
        }

    }

    @Override
    public List<TUser> queryUsersByCondition(String loginacct, String email) {

        if (StringUtils.isEmpty(loginacct) && StringUtils.isEmpty(email)){
            return userMapper.selectByExample(null);
        }

        TUserExample example = new TUserExample();
        TUserExample.Criteria criteria = example.createCriteria();

        if (!StringUtils.isEmpty(loginacct)){
            criteria.andLoginacctLike("%" + loginacct + "%");
        }

        if (!StringUtils.isEmpty(email)){
            criteria.andEmailLike("%" + email + "%");
        }

        return userMapper.selectByExample(example);
    }

    @Override
    public void deleteUserById(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteUsers(Integer[] userIds) {

        TUserExample example = new TUserExample();
        TUserExample.Criteria criteria = example.createCriteria();

        criteria.andIdIn(Arrays.asList(userIds));

        userMapper.deleteByExample(example);
    }

    @Override
    public void allotRoles(Integer hidUserId, Integer[] unAllotRoleIds) {
        TUserRole tUserRole = new TUserRole();

        tUserRole.setUserid(hidUserId);

        for (Integer unAllotRoleId : unAllotRoleIds) {
            tUserRole.setRoleid(unAllotRoleId);

            tUserRoleMapper.insertSelective(tUserRole);

        }
    }

    @Override
    public void unAllotRoles(Integer hidUserId, Integer[] allotedRoleIds) {

        TUserRoleExample example = new TUserRoleExample();
        TUserRoleExample.Criteria criteria = example.createCriteria();

        criteria.andUseridEqualTo(hidUserId);

        criteria.andRoleidIn(Arrays.asList(allotedRoleIds));

        tUserRoleMapper.deleteByExample(example);

    }


}
