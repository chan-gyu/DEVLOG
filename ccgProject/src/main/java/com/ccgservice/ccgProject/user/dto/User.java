package com.ccgservice.ccgProject.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
	
	private String userid;
	private String password;
	private String username;
	private String email;
	private String address;
	private String phone;
	private String nickname;
	
}
