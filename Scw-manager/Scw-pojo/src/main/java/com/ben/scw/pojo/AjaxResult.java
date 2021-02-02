package com.ben.scw.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @AUTHOR Ben
 * @time 2021/1/30 - 13:52
 * @Description
 */
@Data
public class AjaxResult implements Serializable {
    private boolean succ;
    private Object data;
}
