package com.chainsys.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.springdemo.dao.UserDaoImpl;
import com.chainsys.springdemo.model.User;

@Controller
public class SampleController {
	
	User user=new User();
	
	@Autowired
	private UserDaoImpl userDaoImpl;
	
	@RequestMapping("/")
	public String save() {		
		System.out.println("landing page");
		return "index.jsp";
	}
	
	@RequestMapping("/register")
	public String toLogin(@RequestParam("username") String name,@RequestParam("password") String password,@RequestParam("email") String email,Model model) {
		System.out.println("to register");
		user.setUsername(name);
		user.setPassword(password);
		user.setEmail(email);
		userDaoImpl.save(user);
		List<User> users = userDaoImpl.getUsers();
		model.addAttribute("users",users);
		return " crud.jsp";
	}
	
	@RequestMapping("/delete")
	public String toDelete(@RequestParam("id") int id,Model model) {
		System.out.println("to delete");
		userDaoImpl.deleteUser(id);
		List<User> users = userDaoImpl.getUsers();
		model.addAttribute("users",users);
		return " crud.jsp";		
	}
	
	@RequestMapping("/update")
	public String updateUser(@RequestParam("username") String name,@RequestParam("password") String password,@RequestParam("email") String email,@RequestParam("id") int id,Model model) {
		user.setUsername(name);
		user.setPassword(password);
		user.setEmail(email);
		user.setId(id);
		userDaoImpl.updateuser(user);
		List<User> users = userDaoImpl.getUsers();
		model.addAttribute("users",users);
		return " crud.jsp";	
		
	}

}
