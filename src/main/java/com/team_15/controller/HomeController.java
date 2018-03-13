package com.team_15.controller;

import com.team_15.pojo.User;
import com.team_15.service.UserService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping("/home1")
    public String home1(){
        return "home";
    }

    @RequestMapping("/signup")
    public String signup(){
        return "signup";
    }

    //映射一个action
    @RequestMapping("/home")
    public String home(@RequestParam("name")String name){
        //输出日志文件
        System.out.println(name);
        logger.info("the first jsp pages");
        User user = userService.findUser("peng");
        System.out.println(user.getName());
        //返回一个home.jsp这个视图
        return "home";
    }

    @RequestMapping(value = "/updateAttr", method = RequestMethod.POST)
    @ResponseBody
    public Object updateAttr(@RequestBody  User user) {
        user.getName();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("message", "11");
        jsonObject.put("status", "success");
        return jsonObject;
    }
}