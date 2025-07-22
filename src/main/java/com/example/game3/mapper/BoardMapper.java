package com.example.game3.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.game3.vo.BoardVO;

@Mapper
public interface BoardMapper {

    List<BoardVO> selectBoards(BoardVO board);

    BoardVO selectBoard(int biNum);

    int insertBoard(BoardVO board);

    int updateBoard(BoardVO board);

    int deleteBoard(int biNum);

    int selectBoardCount(BoardVO board);
}