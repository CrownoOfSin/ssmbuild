package com.kuang.service;

import com.kuang.pojo.ServerResponse;
import com.kuang.pojo.User;
import com.kuang.uitls.AjaxUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LoginService {
    /**
     * 使用用户账号查询用户
     * @param user
     * @return
     */
    AjaxUtils queryUserByUser(User user);

    AjaxUtils registerUser(User user);

    List<User> queryAllUser();
}
