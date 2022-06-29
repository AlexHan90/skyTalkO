package com.two.sky.mybatis.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.two.sky.board.dto.BoardDTO;
import com.two.sky.board.dto.BoardRepDTO;

public interface BoardMapper {
	public List<BoardDTO> boardAllList(
				@Param("s")int start, @Param("e")int end);
	
	public int writeSave(BoardDTO dto);
	public BoardDTO contentView(int writeNo);
	public void upHit(int writeNo);
	public int modify(BoardDTO dto);
	
	public int delete(int writeNo);
	
	public void addReply(BoardRepDTO dto);
	
	public List<BoardRepDTO> getRepList(int write_group);
	
	public int selectBoardCount();
}










































