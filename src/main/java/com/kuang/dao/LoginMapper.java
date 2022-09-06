package com.kuang.dao;

import com.kuang.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LoginMapper {
    /**
     * 使用用户账号查询用户
     * @param userName
     * @return
     */
     User queryUserByName(@Param("userName") String userName,@Param("userPass") String userPass);

     List<User> queryAllUser();

     boolean registerUser(User user);

}
