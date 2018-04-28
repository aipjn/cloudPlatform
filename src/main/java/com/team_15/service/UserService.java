package com.team_15.service;

import com.team_15.dao.UserDao;
import com.team_15.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by a-pc on 2018/3/4.
 */

@Service("userService")
public class UserService {

    @Autowired
    UserDao userDao;

    public User findUser(String username){
        return userDao.findUserByName(username);
    }

    public void addUser(User user){
        userDao.addUser(user);
    }

    public boolean checkUser(User user){
        if(userDao.findUserByName(user.getName()) == null &&
                userDao.findUserByEamil(user.getEmail()) == null){
            return true;
        }
        return false;
    }

    public void changeBalance(String userId, int balance){
        userDao.reducePeanut(userId, balance);
    }

}
