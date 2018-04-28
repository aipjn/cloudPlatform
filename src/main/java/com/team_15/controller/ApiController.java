package com.team_15.controller;

import com.team_15.pojo.User;
import com.team_15.service.ApiService;
import com.team_15.service.UserService;
import net.sf.json.JSONObject;
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
public class ApiController {
    //添加一个日志器
    private static final Logger logger = LoggerFactory.getLogger(ApiController.class);

    @Autowired
    private ApiService apiService;

    @RequestMapping(value = "/start", method = RequestMethod.GET)
    @ResponseBody
    public Object start(HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "error");
        ServletContext context =  request.getSession().getServletContext();
        Set<String> onlineUsers = (Set)context.getAttribute("onlineUsers");

//        User userLocal = userService.findUser(user.getName());
//        if (userLocal != null && user.getPassword().equals(userLocal.getPassword())){
//            jsonObject.put("state", "success");
//        } else {
//            return jsonObject;
//        }
        return jsonObject;
    }


}