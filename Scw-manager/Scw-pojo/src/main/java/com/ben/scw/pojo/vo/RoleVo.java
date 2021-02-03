package com.ben.scw.pojo.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @DATE:2021/2/3 - 11:07
 * @AUTHOR: Ben
 * @Description:
 * @Version: 1.0
 */
@Data
public class RoleVo implements Serializable {
    private Integer pageno;
    private Integer pagesize;
    private String queryText;
}
