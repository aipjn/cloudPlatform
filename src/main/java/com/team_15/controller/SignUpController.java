package com.team_15.controller;

import com.team_15.pojo.User;
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

/**
 * Created by a-pc on 2017/11/7.
 */
@Controller
@RequestMapping("/")
public class SignUpController {

    @Autowired
    private UserService userService;

    @RequestMapping("/signUp")
    public String signUp(){
        return "signup";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    @ResponseBody
    public Object addUser(@RequestBody  User user) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "error");
        if(userService.checkUser(user)){
            userService.addUser(user);
            jsonObject.put("state", "success");
        }
        return jsonObject;
    }

}