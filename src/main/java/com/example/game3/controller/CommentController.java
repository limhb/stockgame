package com.example.game3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.game3.service.CommentService;
import com.example.game3.vo.CommentVO;
import com.example.game3.vo.UserVO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @GetMapping("/{biNum}")
    public List<CommentVO> getComments(@PathVariable("biNum") int biNum) {
        return commentService.getComments(biNum);
    }

    @PostMapping("/insert")
    @ResponseBody
    public int insert(@RequestParam int biNum,
                      @RequestParam String content,
                      HttpSession session) {
        UserVO loginUser = (UserVO) session.getAttribute("user");
        CommentVO comment = new CommentVO();
        comment.setBiNum(biNum);
        comment.setCiContent(content);
        comment.setUiNum(loginUser.getUiNum());

        return commentService.insertComment(comment);
    }

    @PostMapping("/update")
    public int updateComment(@RequestBody CommentVO comment, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user == null || comment.getUiNum() != user.getUiNum()) return 0;

        return commentService.updateComment(comment);
    }

    @PostMapping("/delete")
    public int deleteComment(@RequestBody CommentVO comment, HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user == null || comment.getUiNum() != user.getUiNum()) return 0;

        return commentService.deleteComment(comment);
    }
}
