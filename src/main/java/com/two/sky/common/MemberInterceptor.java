package com.two.sky.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor 
					extends HandlerInterceptorAdapter
					implements SessionName{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("index 실행 전 실행");
		HttpSession session = request.getSession();
		if( session.getAttribute(LOGIN ) == null ) {
			//response.sendRedirect("login");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String path = request.getContextPath();
			out.print("<script> alert('로그인 하세요');"
				+"location.href='"+path+"/member/login'</script>");
			return false;
		}
		return true;
	}
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("index 실행 후 실행");
	}
}






