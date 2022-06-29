package com.two.sky.mybatis.member;

import java.util.List;
import java.util.Map;

import com.two.sky.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO logChk(String id);
	public List<MemberDTO> memberInfo();
	public int register(MemberDTO dto);
	public void keepLogin(Map<String, Object> map);
	public MemberDTO getSessionId( String s_id );
	public int idChk(String id);
} 











