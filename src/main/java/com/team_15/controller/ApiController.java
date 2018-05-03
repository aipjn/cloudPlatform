package com.team_15.controller;

import com.team_15.pojo.App;
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
@Controller
@RequestMapping("/")
public class ApiController {

    @Autowired
    private UserService userService;
    @Autowired
    private AppService appService;

    // check login state
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
                               @RequestParam String appName, @RequestParam String targetUserName) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "error");
        User appOwner = userService.findUser(userName);
        if (appOwner != null && password.equals(appOwner.getPassword())){

            User targetUser = userService.findUser(targetUserName);
            App app = appService.findAppByName(appName);
            if(app == null){
                jsonObject.put("msg", "do not have that app");
                return jsonObject;
            }
            if(targetUser.getBalance() < app.getPrice()){
                jsonObject.put("msg", "target user do not have enough peanuts");
            } else {
                // user will be charged per use of an app, the user's charged peanuts will be
                // allocated to app owner and admin
                // change user's balance, app owner's balance and admin's balance
                userService.changeBalance(targetUser.getID(), targetUser.getBalance() - app.getPrice());
                userService.changeBalance(app.getUserID(),
                        appOwner.getBalance() + (int)app.getPrice()/2);
                User admin = userService.findUserByID("123456");
                userService.changeBalance(admin.getID(),
                        admin.getBalance() + app.getPrice() - (int)app.getPrice()/2);
                // save records of peanuts change
                appService.useAppLog(admin.getName(), appName, app.getPrice() - (int)app.getPrice()/2, 1);
                appService.useAppLog(targetUser.getName(), appName, app.getPrice(), 0);
                appService.useAppLog(appOwner.getName(), appName,(int)app.getPrice()/2, 1);

                jsonObject.put("state", "success");
            }
        } else {
            jsonObject.put("msg", "wrong user name or wrong password");
        }
        return jsonObject;

    }

    @RequestMapping("/api")
    public String detail(HttpServletRequest request){
        return "api_show";
    }


}