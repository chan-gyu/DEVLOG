package com.ccgservice.ccgProject.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ccgservice.ccgProject.user.dto.User;
import com.ccgservice.ccgProject.user.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	UserService service;
	
	@RequestMapping("/admin/Admin_Page.do")
	public String admin_Page() {
		return "/admin/admin_Main";
	}
	
	@RequestMapping("/admin/userList.do")
	public ModelAndView admin_UserList(ModelAndView mv) {
		List<User> list = service.userList();
		mv.addObject("list",list);
		mv.setViewName("/admin/admin_user/admin_UserList");
		return mv;
	}
	
	@RequestMapping("/admin/admin_board_write.do")
	public String admin_board_write() {
		return "/admin/admin_board/admin_board_write";
	}
}
