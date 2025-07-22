package com.example.game3.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.game3.mapper.BoardMapper;
import com.example.game3.vo.BoardVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {
	private final BoardMapper boardMapper;
	
	public List<BoardVO> getBoards(BoardVO board){
		if(board.getPage() == 0) {
			board.setPage(1);
		}
		if(board.getRowCount() == 0) {
			board.setRowCount(10);
		}
		int offset = (board.getPage() - 1) * board.getRowCount();
		board.setOffset(offset);
		return boardMapper.selectBoards(board);
	}
	
	public int getBoardCount(BoardVO board) {
		int totalCount = boardMapper.selectBoardCount(board);
		int rowCount = board.getRowCount() == 0 ? 10 : board.getRowCount();
		return (int) Math.ceil((double)totalCount / rowCount);
	}

	public BoardVO getBoard(int biNum) {
		return boardMapper.selectBoard(biNum);
	}
	
	public int insertBoard(BoardVO board) {
		return boardMapper.insertBoard(board);
	}
	
	public int updateBoard(BoardVO board) {
		return boardMapper.updateBoard(board);
	}
	
	public int deleteBoard(int biNum) {
		return boardMapper.deleteBoard(biNum);
	}
}