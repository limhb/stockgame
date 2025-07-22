package com.example.game3.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.game3.mapper.CommentMapper;
import com.example.game3.vo.CommentVO;

@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    public List<CommentVO> getComments(int biNum) {
        return commentMapper.selectComments(biNum);
    }
//    
//    public CommentVO getComment(CommentVO comment) {
//    	return commentMapper.selectComment();
//    }

    public int insertComment(CommentVO comment) {
        return commentMapper.insertComment(comment);
    }

    public int updateComment(CommentVO comment) {
        return commentMapper.updateComment(comment);
    }

    public int deleteComment(CommentVO comment) {
        return commentMapper.deleteComment(comment.getCiNum());
    }
}
