package com.chainsys.springdemo.mapping;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.chainsys.springdemo.model.User;
@Component
public class UserRowMapper implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		 User user = new User();
         user.setId(rs.getInt("id"));
         user.setUsername(rs.getString("username"));
         user.setPassword(rs.getString("password"));
         user.setEmail(rs.getString("email"));
         return user;
	}

}
