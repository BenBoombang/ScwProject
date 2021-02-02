package com.ben.scw.dao;

import com.ben.scw.pojo.Example.TRoleExample;
import com.ben.scw.pojo.TRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TRoleMapper {
    long countByExample(TRoleExample example);

    int deleteByExample(TRoleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TRole record);

    int insertSelective(TRole record);

    List<TRole> selectByExample(TRoleExample example);

    TRole selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TRole record, @Param("example") TRoleExample example);

    int updateByExample(@Param("record") TRole record, @Param("example") TRoleExample example);

    int updateByPrimaryKeySelective(TRole record);

    int updateByPrimaryKey(TRole record);

    //===================以下为自定义==========================

    List<TRole> queryUserRole(Integer userid);
}