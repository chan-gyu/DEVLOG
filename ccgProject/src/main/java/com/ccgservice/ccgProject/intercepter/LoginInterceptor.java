package com.ccgservice.ccgProject.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

//1. 로그인인터셉터
@Slf4j
public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		log.info("LoginInterceptor preHandler");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) { /* 로그인 되어 있는 경우 */
			
			return true;
			
		}else { /* 로그인 되지 않은 경우 */
			
			response.sendRedirect("/user/login_Page.do");
			
			return false; 
		}
		
		
	}
}
