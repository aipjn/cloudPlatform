package com.team_15.dao;

import com.team_15.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

/**
 * Created by a-pc on 2018/3/4.
 */

@Lazy(true)
@Component
public class UserDao {
    @Autowired
    private JdbcTemplate cloudJdbcTemplate;

    public User findUserByName(String name) {
        String sql = "select * from user where name = ?";
        User user = null;
        try {
            RowMapper<User> rm = ParameterizedBeanPropertyRowMapper.newInstance(User.class);
            user = cloudJdbcTemplate.queryForObject(sql, new Object[]{name}, rm);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public User findUserByEamil(String eamil) {
        String sql = "select * from user where eamil = ?";
        User user = null;
        try {
            RowMapper<User> rm = ParameterizedBeanPropertyRowMapper.newInstance(User.class);
            user = cloudJdbcTemplate.queryForObject(sql, new Object[]{eamil}, rm);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public void addUser(final User user) {
        String uuid = UUID.randomUUID().toString();
        String sql = "insert into user values('" + uuid + "', ?, ?, ?, ?, ?)";
        cloudJdbcTemplate.update(sql, user.getName(), user.getPassword(),1000,
                user.getEmail(), new Timestamp(new Date().getTime()));
    }

}
