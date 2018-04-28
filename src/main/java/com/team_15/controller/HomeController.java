package com.team_15.controller;

import com.team_15.pojo.User;
import com.team_15.service.AppService;
import com.team_15.service.UserService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by a-pc on 2017/11/7.
 */
// 注解标注此类为springmvc的controller，url映射为"/"
@Controller
@RequestMapping("/")
public class HomeController {
    //添加一个日志器
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private AppService appService;

    //映射一个action
    @RequestMapping("/home")
    public String home(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user != null){
            request.setAttribute("username", user.getName());
            request.setAttribute("balance", user.getBalance());
        }
        //返回一个home.jsp这个视图
        request.setAttribute("apps", appService.findAllActiveApps());
        return "home";
    }

}