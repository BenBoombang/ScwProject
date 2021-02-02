package com.ben.scw.dao;

import com.ben.scw.pojo.TMemeber;
import com.ben.scw.pojo.Example.TMemeberExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TMemeberMapper {
    long countByExample(TMemeberExample example);

    int deleteByExample(TMemeberExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TMemeber record);

    int insertSelective(TMemeber record);

    List<TMemeber> selectByExample(TMemeberExample example);

    TMemeber selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TMemeber record, @Param("example") TMemeberExample example);

    int updateByExample(@Param("record") TMemeber record, @Param("example") TMemeberExample example);

    int updateByPrimaryKeySelective(TMemeber record);

    int updateByPrimaryKey(TMemeber record);
}