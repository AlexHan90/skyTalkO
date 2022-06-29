package com.two.sky.member.service;

import java.sql.Date;

import org.springframework.ui.Model;

import com.two.sky.member.dto.MemberDTO;

public interface MemberService {
	public int logChk(String id, String pwd);
	public void memberInfo(Model model);
	public void info(Model model,String id);
	public int register(MemberDTO dto);
	public void keepLogin(String sessionId, 
						java.sql.Date limitDate,
						String id);
	public MemberDTO getSessionId( String s_id );
}










