package com.two.sky.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.two.sky.common.XSSClass;
import com.two.sky.member.dto.MemberDTO;
import com.two.sky.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberMapper mapper;
	BCryptPasswordEncoder en = 
						new BCryptPasswordEncoder();
	
	public int logChk(String id, String pwd) {
		int result = 1;
		// select * from table where id=id
		MemberDTO dto = mapper.logChk(id);
		if(dto != null) {
			if( en.matches( pwd, dto.getPw()) || dto.getPw().equals(pwd)) {
				return 0;
			}
		}
		return result;
	}
	public void memberInfo(Model model) {
		model.addAttribute("memberList", 
								mapper.memberInfo() );
	}
	public void info(Model model, String id) {
		MemberDTO dto = mapper.logChk(id);
		
		String addr = dto.getAddr();
		String[] ad = addr.split("/");
		
		model.addAttribute("info", dto );
		model.addAttribute("ad", ad );
	}
	public int register(MemberDTO dto) {
		//insert into membership values('aaa','aaa','aaa');
		/*
		String[] strRep = new String[3];
		strRep[0] = dto.getId();
		strRep[1] = dto.getPw();
		strRep[2] = dto.getAddr();
		
		strRep = XSSClass.replaceParmeter(strRep);
		
		dto.setId(strRep[0]);
		dto.setPw(strRep[1]);
		dto.setAddr(strRep[2]);
		*/
		
		System.out.println("변경 전 : "+dto.getPw());
		String se = en.encode(dto.getPw());
		System.out.println("변경 후 : "+se);
		
		dto.setPw( se );
		
		int result = 0;
		try {
			result = mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void keepLogin(String sessionId, 
							java.sql.Date limitDate,
							String id) {
		Map<String, Object> map = 
					new HashMap<String, Object>();
		map.put("s", sessionId );
		map.put("d", limitDate );
		map.put("id", id);
		
		mapper.keepLogin(map);
	}
	public MemberDTO getSessionId( String s_id ) {
		return mapper.getSessionId( s_id );
	}
}














