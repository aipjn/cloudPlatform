package com.team_15.dao;

import com.team_15.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Component;

/**
 * Created by a-pc on 2018/3/4.
 */

@Lazy(true)
@Component
public class UserDao {
    @Autowired
    private JdbcTemplate cloudJdbcTemplate;

    public User findUser(final String username) {
        String sql = "select id, name, password from user where name = ?";
        User user = null;
        try {
            RowMapper<User> rm = ParameterizedBeanPropertyRowMapper.newInstance(User.class);
            user = (User) cloudJdbcTemplate.queryForObject(sql, new Object[]{username}, rm);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public void addUser(final User user) {
        String sql = "insert into user values('1111',?,?)";
        cloudJdbcTemplate.update(sql, user.getName(), user.getPassword());
    }

}
