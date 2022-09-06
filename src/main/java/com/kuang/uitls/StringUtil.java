package com.kuang.uitls;

import java.util.HashMap;
import java.util.Map;

public class StringUtil {
    /**
     * 检测用户名 和 密码是否有空格
     * @param userName
     * @param pwd
     * @return
     */
    public static Boolean checkUserAndPasswrod(String userName,String pwd){
        if ("".equals(userName)|| " ".equals(userName)|| " ".equals(pwd)||userName==null||pwd==null){
            return true;
        }
        char[] userNameChar = userName.toCharArray();
        for (int i=0;i<userNameChar.length;i++){
            if (userNameChar[i]==' '){
                return true;
            }
        }
        return false;
    }
    public static Boolean checkLength(String str,int minLength,int maxLength){
        int length = str.length();
        System.out.println("length ================="+length);
        if (length>=minLength && length<=maxLength){
            return true;
        }
        return false;
    }
}


