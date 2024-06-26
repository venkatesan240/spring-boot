package com.chainsys.springdemo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.springdemo.model.User;

@Repository
public interface UserDAO {
	
	public void save(User user);
	public List<User> getUsers();
	public void deleteUser(int id);
	public void updateuser(User user);
}
