package com.kuang.service.Impl;

import com.kuang.dao.LoginMapper;
import com.kuang.pojo.ServerResponse;
import com.kuang.pojo.User;
import com.kuang.service.LoginService;
import com.kuang.uitls.AjaxUtils;
import com.kuang.uitls.SnowflakeIdWorker;
import com.kuang.uitls.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;
    public void setLoginMapper(LoginMapper loginMapper){
        this.loginMapper=loginMapper;
    }

    public AjaxUtils queryUserByUser(User user) {
        if (!StringUtil.checkLength(user.getUserName(),4,32) ){
            return new AjaxUtils(410,false,"用户名长度不符合规范");
        }
        if (!StringUtil.checkLength(user.getUserPass(), 4,32)){
            return new AjaxUtils(411,false,"密码长度不符合规范");
        }
        if(StringUtil.checkUserAndPasswrod(user.getUserName(), user.getUserPass())){
            return new AjaxUtils(500,false,"用户名或密码不能为空");
        }
        if(loginMapper.queryUserByName(user.getUserName(),user.getUserPass()) !=null ){
            return new AjaxUtils(200,true,"登陆成功！");
        }
        return new AjaxUtils(500,false,"用户名或密码错误TAT");
    }

    public AjaxUtils registerUser(User user) {
        if (!StringUtil.checkLength(user.getUserName(),4,32) ){
            return new AjaxUtils(410,false,"用户名长度为4~32");
        }
        if (!StringUtil.checkLength(user.getUserPass(), 4,32)){
            return new AjaxUtils(411,false,"密码长度长度为4~32");
        }
        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        long id = idWorker.nextId();
        user.setUserId(id);
        if (loginMapper.queryUserByName(user.getUserName(),user.getUserPass()) != null){
            return new AjaxUtils(500,false,"该用户名已被占用！");
        }
        if (!loginMapper.registerUser(user)){
            return new AjaxUtils(500,false,"注册失败~服务器出错");
        }
        return new AjaxUtils(200,true,"注册成功！");
    }

    public List<User> queryAllUser() {
        return loginMapper.queryAllUser();
    }
}
