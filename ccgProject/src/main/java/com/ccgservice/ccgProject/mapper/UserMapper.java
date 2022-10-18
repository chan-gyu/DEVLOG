package com.ccgservice.ccgProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ccgservice.ccgProject.user.dto.User;

@Mapper
@Repository
public interface UserMapper {
	
	User checkId(String userid);
	int insertUser(User user);
	User login(String userid);
	List<User> userList();
	
}
