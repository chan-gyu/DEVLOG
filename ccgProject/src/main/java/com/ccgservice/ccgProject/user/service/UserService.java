package com.ccgservice.ccgProject.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccgservice.ccgProject.mapper.UserMapper;
import com.ccgservice.ccgProject.user.dto.User;

@Service
public class UserService {
	
	@Autowired
	UserMapper mapper;
	
	public User checkId(String userid) {
		return mapper.checkId(userid);
	}
	
	public int insertUser(User user) {
		return mapper.insertUser(user);
	}
	
	public User login(String userid) {
		return mapper.login(userid);
	}
	
	public List<User> userList(){
		return mapper.userList();
	}
	
}
