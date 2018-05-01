package com.team_15.service;

import com.team_15.dao.AppDao;
import com.team_15.dao.UserDao;
import com.team_15.pojo.App;
import com.team_15.pojo.Usage;
import com.team_15.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by a-pc on 2018/3/4.
 */

@Service("appService")
public class AppService {

    @Autowired
    AppDao appDao;

    public void addApp(App app, String userId){
        appDao.addApp(app, userId);
    }

    public List<App> findAllActiveApps() {
        return appDao.findAllActiveApps();
    }

    public List<App> findAllApps(){
        return appDao.findAllApps();
    }

    public boolean CheckAppName(String name) {
        if(appDao.findAppByName(name) != null)
            return false;
        return true;
    }

    public App findAppByName(String name) {
        return appDao.findAppByName(name);
    }

    public void useAppLog(String userName, String appName, int price, int type){
        appDao.useAppLog(userName, appName, price, type);
    }

    public List<Usage> findAllUsage(int type, String userName) {
        return appDao.findAllUsage(type, userName);
    }

    public void changeState (String ID, int state){
        appDao.changeState(ID, state);
    }

}
