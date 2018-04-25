package com.team_15.service;

import com.team_15.dao.AppDao;
import com.team_15.dao.UserDao;
import com.team_15.pojo.App;
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

    public void addApp(final App app){
        appDao.addApp(app);
    }

    public List<App> findAllActiveApps() {
        return appDao.findAllActiveApps();
    }

}
