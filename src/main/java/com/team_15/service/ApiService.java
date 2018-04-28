package com.team_15.service;

import com.team_15.dao.AppDao;
import com.team_15.pojo.App;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by a-pc on 2018/3/4.
 */

@Service("apiService")
public class ApiService {

    @Autowired
    private SessionRegistry sessionRegistry;//这个类会自动注入 不用我们自己去手动注入

    public void test(){

        System.out.println("u begin");

        List<Object> allPrincipals = sessionRegistry.getAllPrincipals();
        int totalCount=allPrincipals.size();
        for (int i = 0,len=allPrincipals.size(); i < len; i++) {
            System.out.println(allPrincipals.get(i));//可以转换成spring的User

        }
        System.out.println("u end" + totalCount);
    }

}
