package com.team_15.dao;

import com.team_15.pojo.App;
import com.team_15.pojo.Usage;
import com.team_15.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by a-pc on 2018/3/4.
 */

@Lazy(true)
@Component
public class AppDao {
    @Autowired
    private JdbcTemplate cloudJdbcTemplate;

    public List<App> findAllActiveApps() {
        String sql = "select * from apps where active = 1";
        List<App> apps = null;
        try {
            RowMapper<App> rm = ParameterizedBeanPropertyRowMapper.newInstance(App.class);
            apps =  cloudJdbcTemplate.query(sql, rm);
        }catch (Exception e){
            e.printStackTrace();
        }
        return apps;
    }

    public List<App> findAllApps() {
        String sql = "select * from apps";
        List<App> apps = null;
        try {
            RowMapper<App> rm = ParameterizedBeanPropertyRowMapper.newInstance(App.class);
            apps =  cloudJdbcTemplate.query(sql, rm);
        }catch (Exception e){
            e.printStackTrace();
        }
        return apps;
    }

    public App findAppByName(String name) {
        String sql = "select * from apps where name = ?";
        App app = null;
        try {
            RowMapper<App> rm = ParameterizedBeanPropertyRowMapper.newInstance(App.class);
            app =  cloudJdbcTemplate.queryForObject(sql, new Object[]{name}, rm);
        }catch (Exception e){
            e.printStackTrace();
        }
        return app;
    }

    public void addApp(App app, String userId) {
        String uuid = UUID.randomUUID().toString();
        String sql = "insert into apps values('" + uuid + "', ? , ?, ?, ?, ?, ?, ?)";
        cloudJdbcTemplate.update(sql, userId, app.getName(), app.getPrice(), app.getDescription(),
                app.getIcon(), app.getActive(), new Timestamp(new Date().getTime()));
    }

    public void changeState(String ID, int state) {
        String sql = "update apps set active = ? where ID = ?";
        cloudJdbcTemplate.update(sql, state, ID);
    }


    // type 0 for expense type 1 for income
    public void useAppLog(String userName, String appName, int price, int type) {
        String uuid = UUID.randomUUID().toString();
        String sql = "insert into usage_log values(?, ?, ?, ?, ?, ?)";
        cloudJdbcTemplate.update(sql, uuid, userName, appName,
                new Timestamp(new Date().getTime()),price, type);
    }


    public List<Usage> findAllUsage(int type, String userName) {
        String sql = "select * from usage_log where type = ? and userName = ? ORDER BY time DESC";
        List<Usage> usages = null;
        try {
            RowMapper<Usage> rm = ParameterizedBeanPropertyRowMapper.newInstance(Usage.class);
            usages =  cloudJdbcTemplate.query(sql, new Object[]{type, userName}, rm);
        }catch (Exception e){
            e.printStackTrace();
        }
        return usages;
    }

}
