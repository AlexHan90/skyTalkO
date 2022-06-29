package com.two.sky.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.two.sky.board.dto.BoardDTO;
import com.two.sky.board.dto.BoardRepDTO;

public interface BoardService {
	public void boardAllList(Model model, int num);
	public String writeSave(MultipartHttpServletRequest mul,
							HttpServletRequest request);
	public void contentView(int writeNo,Model model);
	public String modify(MultipartHttpServletRequest mul,
								HttpServletRequest request);
	public String delete(int writeNo,
						String imageFileName,
						HttpServletRequest request);
	public void addReply(BoardRepDTO dto);
	public List<BoardRepDTO> getRepList(int write_group);
	
}














