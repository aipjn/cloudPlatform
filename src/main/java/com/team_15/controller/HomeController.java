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
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by a-pc on 2017/11/7.
 */
@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private AppService appService;

    @Autowired
    private UserService userService;
    //映射一个action
    @RequestMapping("/home")
    public String home(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user != null){
            request.setAttribute("username", user.getName());
            request.setAttribute("balance", user.getBalance());
            // amdin user have access to all apps, other users have access
            // just to active apps
            if(user.getName().equals("admin")){
                request.setAttribute("apps", appService.findAllApps());
                return "home";
            }
        }
        //return home.jsp page
        request.setAttribute("apps", appService.findAllActiveApps());
        return "home";
    }

    @RequestMapping(value = "/appState", method = RequestMethod.POST)
    @ResponseBody
    public Object appState(@RequestParam  String AppId, @RequestParam int state) {
        appService.changeState(AppId, state);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "success");
        return jsonObject;
    }


    @RequestMapping(value = "/openApp", method = RequestMethod.POST)
    @ResponseBody
    public Object openApp(@RequestParam  String appName, @RequestParam int price, HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "error");
        User user = (User)request.getSession().getAttribute("user");
        if(user == null){
            jsonObject.put("msg", "please sign in first.");
            return jsonObject;
        }
        if(user.getBalance() < price){
            jsonObject.put("msg", "you do not have enough peanuts");
            return jsonObject;
        }
        App app = appService.findAppByName(appName);
        User appOwner = userService.findUserByID(app.getUserID());
        // user will be charged per use of an app, the user's charged peanuts will be
        // allocated to app owner and admin
        // change user's balance, app owner's balance and admin's balance
        userService.changeBalance(user.getID(), user.getBalance() - app.getPrice());
        userService.changeBalance(app.getUserID(),
                appOwner.getBalance() + (int)app.getPrice()/2);
        User admin = userService.findUserByID("123456");
        userService.changeBalance(admin.getID(),
                admin.getBalance() + app.getPrice() - (int)app.getPrice()/2);
        // save records of peanuts change
        appService.useAppLog(admin.getName(), appName, app.getPrice() - (int)app.getPrice()/2, 1);
        appService.useAppLog(user.getName(), appName, app.getPrice(), 0);
        appService.useAppLog(appOwner.getName(), appName,(int)app.getPrice()/2, 1);
        user = userService.findUserByID(app.getUserID());
        // update user session after it's balance changed
        request.getSession().setAttribute("user", user);
        jsonObject.put("state", "success");
        return jsonObject;
    }

    @RequestMapping("/detail")
    public String detail(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        request.setAttribute("expense", appService.findAllUsage(0, user.getName()));
        request.setAttribute("income", appService.findAllUsage(1, user.getName()));
        return "user_detail";
    }

}