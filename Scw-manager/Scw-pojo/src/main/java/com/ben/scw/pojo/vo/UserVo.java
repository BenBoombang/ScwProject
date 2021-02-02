package com.ben.scw.pojo.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @AUTHOR Ben
 * @time 2021/1/30 - 13:55
 * @Description
 */
@Data
public class UserVo implements Serializable {
    private Integer pageno;
    private Integer pagesize;
    private String queryText;

    private String loginacct;
    private String email;
}
