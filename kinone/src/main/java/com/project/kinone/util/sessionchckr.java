package com.project.kinone.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class sessionchckr extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String email=(String)session.getAttribute("email");
		if(email==null ||email.equals("")) {
			response.sendRedirect("login.do");
			return false;
		}
		
		return true;
	}

		
}
