package com.ccgservice.ccgProject.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ccgservice.ccgProject.user.dto.User;
import com.ccgservice.ccgProject.user.service.UserService;

@Controller
@SessionAttributes({"loginUser"})
public class UserController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private PasswordEncoder pwEncoder;
	
	//Home_Page
	@RequestMapping("/user/home")
	public String home() {
		return "redirect:/";
	}
	
	//Login_Page
	@RequestMapping("/user/login_Page.do")
	public String loginPage() {
		return "user/login_Page";
	}
	
	//sign_up_Page
	@RequestMapping("/user/sign_up_Page.do")
	public String sign_up_Page() {
		return "user/sign_up_Page";
	}
	
	//ajax ID Check
	@RequestMapping("/user/IdCheckService.do")
	@ResponseBody
	public int checkId(@RequestParam String userid) {
		User user = new User();
		user = service.checkId(userid);
		int result=0;
		if(user==null) result++;
		return result;
	}
	
	//회원가입
	@RequestMapping("/user/insertUser.do")
	public String insertUser(@RequestParam Map<String, String> map, ModelAndView mv) {
		String encodePw =""; 
		String address = "";
		encodePw += pwEncoder.encode(map.get("password"));
		address += map.get("address") + map.get("address2");
		User user = new User(map.get("userid"),
							 encodePw,
							 map.get("username"),
							 map.get("email"),
							 address,
							 map.get("phone"),
							 map.get("nickname"));
		
		int result = service.insertUser(user);
		if (result>0) System.out.println("회원가입 성공!");
		
		return "user/sign_msg";
	}
	
	//회원가입 message
	@RequestMapping("/user/msg.do")
	public String msg() {
		
		return "user/sign_msg";
	}
	
	//로그인
	@RequestMapping("/user/login.do")
	public ModelAndView login(@RequestParam String userid, @RequestParam String password, ModelAndView mv, Model model) {
		User user = service.login(userid);
		if(user==null) {
			mv.addObject("msg","아이디와 비밀번호를 확인해 주세요.");
			mv.setViewName("user/login_Page");
			return mv;
		}
		
		if(user!=null &&pwEncoder.matches(password, user.getPassword())) {
			model.addAttribute("loginUser", user);
			//mv.addObject("msg","로그인 성공");
			//mv.setViewName("redirect:/");
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg","아이디와 비밀번호를 확인해 주세요.");
			mv.setViewName("user/login_Page");
		}
		
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/user/logout.do")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/";
	}
	
}
