package com.team_15.pojo;

import java.io.Serializable;

/**
 * Created by a-pc on 2018/3/4.
 */
public class User implements Serializable {

    private String ID;
    private String name;
    private String password;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
