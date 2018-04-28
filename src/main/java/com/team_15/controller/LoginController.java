package com.team_15.controller;

import com.team_15.pojo.User;
import com.team_15.service.UserService;
import net.sf.json.JSONObject;
import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.Set;

/**
 * Created by a-pc on 2017/11/7.
 */
// 注解标注此类为springmvc的controller，url映射为"/"
@Controller
@RequestMapping("/")
public class LoginController {
    //添加一个日志器
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
    @ResponseBody
    public Object userLogin(@RequestBody  User user, HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "error");
        User userLocal = userService.findUser(user.getName());
        if (userLocal != null && user.getPassword().equals(userLocal.getPassword())){
            ServletContext context =  request.getSession().getServletContext();
            jsonObject.put("state", "success");
            request.getSession().setAttribute("user", userService.findUser(user.getName()));
            Set<String> onlineUsers = (Set)context.getAttribute("onlineUsers");
            onlineUsers.add(user.getName());
            context.setAttribute("onlineUsers", onlineUsers);
        } else {
            return jsonObject;
        }
        return jsonObject;
    }

    @RequestMapping("/signOut")
    public String signOut(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "index";
    }


}