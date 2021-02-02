package com.ben.scw.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @AUTHOR Ben
 * @time 2021/1/26 - 19:41
 * @Description
 */
public class MyStringUtil {

    public static boolean isEmpty(String str){
        if (str == null){
            return true;
        }

        if (str.trim().equals("")){
            return true;
        }

        return false;
    }

    public static String formatSimpleDate(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
}
