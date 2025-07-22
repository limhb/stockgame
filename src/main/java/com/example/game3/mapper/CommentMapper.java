package com.example.game3.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.game3.vo.CommentVO;

@Mapper
public interface CommentMapper {
	List<CommentVO> selectComments(int biNum);

	int insertComment(CommentVO comment);

	int updateComment(CommentVO comment);

	int deleteComment(int ciNum);
	
	CommentVO selectComment(int cmtNum);

}
