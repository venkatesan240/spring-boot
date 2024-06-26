package com.chainsys.springdemo.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import com.chainsys.springdemo.mapping.UserRowMapper;
import com.chainsys.springdemo.model.User;

@Configuration
public class UserDaoImpl implements UserDAO{

	    @Autowired
	    JdbcTemplate  jdbcTemplate;
	    @Autowired
	    UserRowMapper ur;
	  
	@Override
	public void save(User user) {
		String query="insert into register(username,password,email)values(?,?,?)";
		Object[] parems= {user.getUsername(),user.getPassword(),user.getEmail()};
		int  rows = jdbcTemplate.update(query, parems);
		System.out.println("inserted rows"+rows);
	}
	
	public List<User> getUsers() {
		String query="select id,username,password,email from register";
		 return jdbcTemplate.query(query, ur);
	}
	
	public void deleteUser(int id) {
		String query="delete from register where id=?";
		Object[] parems= {id};
		jdbcTemplate.update(query, parems);
		System.out.println("deleted sucessfully");
	}

	@Override
	public void updateuser(User user) {
		String query="update register set username=?,password=?,email=? where id=?";
		Object[] parems= {user.getUsername(),user.getPassword(),user.getEmail(),user.getId()};
		jdbcTemplate.update(query, parems);
	}

}
