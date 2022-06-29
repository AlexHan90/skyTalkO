package com.two.sky.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.two.sky.common.SessionName;
import com.two.sky.member.dto.MemberDTO;
import com.two.sky.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController implements SessionName{
	@Autowired MemberService ms;
	@GetMapping("/login")
	public String loginForm() {
		return "member/login";
	}
	@PostMapping("/logChk")
	public String logChk(//HttpServletRequest req
						@RequestParam String id,
						@RequestParam String pwd,
						@RequestParam(required = false) String autoLogin,
						RedirectAttributes ra,
						Model model,
						HttpSession session
						) {
		int result = ms.logChk(id, pwd);
		if(result == 0 ) {
			//ra.addFlashAttribute("id", id);
			//ra.addAttribute("id", id);
			//model.addAttribute("id",id);
			session.setAttribute("id", id);
			session.setAttribute("autoLogin", autoLogin);
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	@GetMapping( "/successLogin" )
	public String successLogin(
						HttpServletRequest req,
						HttpSession session,
						HttpServletResponse rep) {
		session.setAttribute(LOGIN, session.getAttribute("id"));
		//session.setAttribute("m",
		//		"<a href='memberInfo'>MEMBER</a>");
		System.out.println(
			"auto : "+session.getAttribute("autoLogin"));
		if(session.getAttribute("autoLogin") != null) {
			int time = 60*60*24*90; //90일
			Cookie cook = 
				new Cookie("loginCookie", session.getId());
			cook.setPath("/");
			cook.setMaxAge(time);
			rep.addCookie(cook);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime( new java.util.Date());
			cal.add(Calendar.MONTH, 3);
			
			java.sql.Date limitDate = 
					new java.sql.Date(cal.getTimeInMillis());
			ms.keepLogin(session.getId(), limitDate,
						(String)session.getAttribute("id"));
		}
		return "member/successLogin";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session,
			HttpServletResponse response,
	@CookieValue( required=false) Cookie loginCookie) {
		
		if( loginCookie != null ) {
			loginCookie.setMaxAge( 0 );
			response.addCookie(loginCookie);
			
			ms.keepLogin("nan", 
			new java.sql.Date(System.currentTimeMillis()), 
				(String)session.getAttribute(LOGIN) );
		}
		session.invalidate();
		return "redirect:/index";
	}
	@GetMapping("memberInfo")
	public String memberInfo(Model model) {
		ms.memberInfo(model);
		return "member/memberInfo";
	}
	@GetMapping("info")
	public String info(Model model, @RequestParam String id) {
		ms.info(model, id);
		return "member/info";
	}
	@GetMapping("register_form")
	public String register_form() {
		return "member/register";
	}
	@PostMapping("register")
	public String register(MemberDTO dto) {
		int result = ms.register(dto);
		if(result == 1)
			return "redirect:login";
		return "redirect:register_form";
	}
}





















