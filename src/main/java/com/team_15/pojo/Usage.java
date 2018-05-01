package com.team_15.pojo;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by a-pc on 2018/3/4.
 */
public class Usage implements Serializable {

    private String ID;
    private String userName;
    private String appName;
    private Timestamp time;
    private int price;
    private int type;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
