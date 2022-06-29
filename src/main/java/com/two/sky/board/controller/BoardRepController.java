package com.two.sky.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.two.sky.board.dto.BoardDTO;
import com.two.sky.board.dto.BoardRepDTO;
import com.two.sky.board.service.BoardService;
import com.two.sky.common.SessionName;

@RestController
@RequestMapping("board")
public class BoardRepController {
	@Autowired BoardService bs;
	
	@PostMapping(value="addReply",
			produces = "application/json; charset=utf-8")
	public void addReply(@RequestBody Map<String, Object> map,
										HttpSession session) {
		BoardRepDTO dto = new BoardRepDTO();
		dto.setId( 
		(String)session.getAttribute( SessionName.LOGIN) );
		dto.setTitle( (String)map.get("title") );
		dto.setWrite_group( 
			Integer.parseInt( (String)map.get("write_no")) );
		dto.setContent( (String)map.get("content") );
		
		System.out.println( dto.getId() );
		System.out.println( dto.getWrite_group() );
		System.out.println( dto.getTitle());
		System.out.println( dto.getContent());
		
		bs.addReply(dto);
	}
	@GetMapping(value="replyData/{w_g}",
			produces = "application/json; charset=utf-8")
	public List<BoardRepDTO> replyData(
					@PathVariable("w_g") int write_group) {
		return bs.getRepList(write_group);
	}
}





























