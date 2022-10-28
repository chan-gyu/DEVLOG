package com.ccgservice.ccgProject.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ccgservice.ccgProject.board.dto.Category;
import com.ccgservice.ccgProject.board.service.BoardService;
import com.ccgservice.ccgProject.user.dto.User;
import com.ccgservice.ccgProject.user.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	UserService service;
	
	@Autowired
	BoardService bservice;
	
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
	
	@RequestMapping("/admin/category_page.do")
	public String categoryPage() {
		return "/admin/admin_board/admin_board_category";
	}
	
	@RequestMapping("/admin/categoryList.do")
	@ResponseBody
	public List<Category> categoryPage(ModelAndView mv) {
		//카테고리리스트
		boolean cntBoolean = false;
		List<Category> categoryList = bservice.selectCategory(cntBoolean);
		
		return categoryList;
	}
	
	@RequestMapping("/admin/addCategory.do")
	@ResponseBody
	public int addCategory(@RequestParam String addCate) {
		System.out.println(addCate);
		int result = bservice.addCategory(addCate);
		
		return result;
	}
	
	@RequestMapping("/admin/deleteCategory.do")
	@ResponseBody
	public int deleteCategory(@RequestParam String deleteCate) {
		int result = bservice.deleteCategory(deleteCate);
		return result;
	}
}
