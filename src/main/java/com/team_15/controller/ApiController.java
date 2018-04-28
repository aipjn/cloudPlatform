package com.team_15.controller;

import com.team_15.pojo.User;
import com.team_15.service.AppService;
import com.team_15.service.UserService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    @Autowired
    private UserService userService;
    @Autowired
    private AppService appService;

    @RequestMapping(value = "/start", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public Object start(HttpServletRequest request, @RequestParam String userName,
                        @RequestParam String password, @RequestParam String targetUserName) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "error");
        User user = userService.findUser(userName);
        if (user != null && password.equals(user.getPassword())){
            ServletContext context =  request.getSession().getServletContext();
            Set<String> onlineUsers = (Set)context.getAttribute("onlineUsers");
            if(onlineUsers.contains(targetUserName)){
                jsonObject.put("state", "success");
            } else {
                jsonObject.put("msg", "This user is not login");
            }
        } else {
            jsonObject.put("msg", "wrong user name or wrong password");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/reducePeanut", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public Object reducePeanut(@RequestParam String userName, @RequestParam String password,
                               @RequestParam String appName, @RequestParam String targetUserName,
                               @RequestParam int reduceAmount) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "error");
        User user = userService.findUser(userName);
        if (user != null && password.equals(user.getPassword())){

            User targetUser = userService.findUser(targetUserName);
            if(targetUser.getBalance() < reduceAmount){
                jsonObject.put("msg", "target user do not have enough peanuts");
            } else {
                userService.changeBalance(targetUser.getID(), targetUser.getBalance() - reduceAmount%2);
                userService.changeBalance(user.getID(), targetUser.getBalance() + reduceAmount);
                appService.useAppLog(targetUser.getID(), appName, reduceAmount);
                jsonObject.put("state", "success");
            }
        } else {
            jsonObject.put("msg", "wrong user name or wrong password");
        }
        return jsonObject;

    }


}