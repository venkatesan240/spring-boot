package com.chainsys.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.springdemo.dao.UserDAO;
import com.chainsys.springdemo.dao.UserDaoImpl;
import com.chainsys.springdemo.model.User;

@Controller
public class SampleController {
	
	User user=new User();
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping("/")
	public String save() {		
		return "index.jsp";
	}
	
	@RequestMapping("/register")
	public String toLogin(@RequestParam("username") String name,@RequestParam("password") String password,@RequestParam("email") String email,Model model) {
		user.setUsername(name);
		user.setPassword(password);
		user.setEmail(email);
		userDao.save(user);
		List<User> users = userDao.getUsers();
		model.addAttribute("users",users);
		return " crud.jsp";
	}
	
	@RequestMapping("/delete")
	public String toDelete(@RequestParam("id") int id,Model model) {
		userDao.deleteUser(id);
		List<User> users = userDao.getUsers();
		model.addAttribute("users",users);
		return " crud.jsp";		
	}
	
	@RequestMapping("/update")
	public String updateUser(@RequestParam("username") String name,@RequestParam("password") String password,@RequestParam("email") String email,@RequestParam("id") int id,Model model) {
		user.setUsername(name);
		user.setPassword(password);
		user.setEmail(email);
		user.setId(id);
		userDao.updateuser(user);
		List<User> users = userDao.getUsers();
		model.addAttribute("users",users);
		return " crud.jsp";		
	}
	
	@RequestMapping("/search")
	public String search(@RequestParam("name") String name,Model model) {
		List<User>  users = userDao.searchUser(name);
		model.addAttribute("users",users);
		return " crud.jsp";	
	}
	
	@RequestMapping("/getupdate")
	public String getUpdate(@RequestParam("id") int id,Model model) {
		System.out.println("in get update");
		System.out.println(id);
		List<User>  users = userDao.getUser(id);
		model.addAttribute("users",users);
		System.out.println("after getting users"+users);
		return "update.jsp";		
	}

}
