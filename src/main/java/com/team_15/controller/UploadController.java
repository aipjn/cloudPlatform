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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.sql.Blob;

/**
 * Created by a-pc on 2017/11/7.
 */
@Controller
@RequestMapping("/")
public class UploadController {

    @Autowired
    private AppService appService;

    @RequestMapping("/upload")
    public String upload(){
        return "upload";
    }

    @RequestMapping(value = "/addApp", method = RequestMethod.POST)
    @ResponseBody
    public Object addApp(@RequestParam MultipartFile warFile, HttpServletRequest request){
        // save war file in tomcat webapps
        String savedDir = request.getSession().getServletContext().getRealPath("");
        savedDir = savedDir.replace(savedDir.split("/")[savedDir.split("/").length-1], "");
        File newFile = new File(savedDir + request.getParameter("name") + ".war");
        try{
            warFile.transferTo(newFile);
        }catch (IOException e){
        }
        App app = new App();
        app.setName(request.getParameter("name"));
        app.setDescription(request.getParameter("description"));
        app.setIcon(request.getParameter("icon"));
        app.setPrice(Integer.valueOf(request.getParameter("price")));
        app.setLocation(request.getParameter("location"));
        app.setActive(0);
        appService.addApp(app, ((User)request.getSession().getAttribute("user")).getID());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "success");
        return jsonObject;
    }

    @RequestMapping(value = "/checkAppName", method = RequestMethod.POST)
    @ResponseBody
    public Object checkAppName(@RequestParam String name){
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", "error");
        if(appService.CheckAppName(name)){
            jsonObject.put("state", "success");
        }
        return jsonObject;
    }
}