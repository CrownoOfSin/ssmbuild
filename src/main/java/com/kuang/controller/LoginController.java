package com.kuang.controller;

import com.kuang.pojo.User;
import com.kuang.service.LoginService;
import com.kuang.uitls.AjaxUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping
public class LoginController {

    @Autowired
    @Qualifier("loginServiceImpl")
    private LoginService loginService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login/login_page";
    }

    @RequestMapping("/toAddUser")
    public String toAddUser(){
        return "login/adduser_page";
    }

    @PostMapping("/checkIn")
    @ResponseBody
    public AjaxUtils checkLogin(@RequestBody User user)throws Exception{

        return loginService.queryUserByUser(user);
    }
    @RequestMapping("/addUser")
    @ResponseBody
    public AjaxUtils addUser(@RequestBody User user){

        return loginService.registerUser(user);
    }

    @RequestMapping("/test")
    public String testLogin(Model model){
        List<User> users = loginService.queryAllUser();
        System.out.println("user ======================="+users);
        model.addAttribute("user",users);
        return "foreground/test";
    }

}
