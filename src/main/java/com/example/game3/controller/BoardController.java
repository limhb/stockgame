package com.example.game3.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.game3.service.BoardService;
import com.example.game3.vo.BoardVO;
import com.example.game3.vo.UserVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/board/list")
    public String boardList() {
        return "/views/board/board-list";
    }

    @GetMapping("/board/list/data")
    @ResponseBody
    public Map<String,Object> selectBoards(@ModelAttribute BoardVO board) {
        board.setRowCount(10);
        Map<String,Object> res = new HashMap<>();
        res.put("boardList", boardService.getBoards(board));
        res.put("totalPage", boardService.getBoardCount(board));
        return res;
    }

    @GetMapping("/board/view/{biNum}")
    public String getBoard(Model m, @PathVariable("biNum") int biNum) {
        BoardVO board = boardService.getBoard(biNum);
        m.addAttribute("board", board);
        return "/views/board/board-view";
    }

    @GetMapping("/board/insert")
    public String insertBoardForm() {
        return "/views/board/board-insert";
    }

    @PostMapping("/board/insert")
    public String insertBoard(@ModelAttribute BoardVO board, Model m, HttpSession session) {
        if(session.getAttribute("user") == null) {
            m.addAttribute("msg", "로그인 후 작성 가능합니다.");
            m.addAttribute("url", "/views/user/login");
            return "views/common/msg";
        }
        board.setUiNum(((UserVO)session.getAttribute("user")).getUiNum());
        board.setUiName(((UserVO)session.getAttribute("user")).getUiName());
        int result = boardService.insertBoard(board);
        m.addAttribute("msg", result == 1 ? "등록 성공" : "등록 실패");
        m.addAttribute("url", "/board/list");
        return "views/common/msg";
    }

    @GetMapping("/board/update/{biNum}")
    public String updateBoardForm(@PathVariable("biNum") int biNum, Model m, HttpSession session) {
        BoardVO board = boardService.getBoard(biNum);
        UserVO loginUser = (UserVO) session.getAttribute("user");

        if (loginUser == null || board.getUiNum() != loginUser.getUiNum()) {
            m.addAttribute("msg", "수정 권한이 없습니다.");
            m.addAttribute("url", "/board/list");
            return "views/common/msg";
        }

        m.addAttribute("board", board);
        return "views/board/board-update";
    }

    @PostMapping("/board/update")
    public String updateBoard(@ModelAttribute BoardVO board, HttpSession session, Model m) {
        UserVO loginUser = (UserVO) session.getAttribute("user");

        if (loginUser == null || loginUser.getUiNum() != board.getUiNum()) {
            m.addAttribute("msg", "수정 권한이 없습니다.");
            m.addAttribute("url", "/board/list");
            return "views/common/msg";
        }

        int result = boardService.updateBoard(board);
        m.addAttribute("msg", result == 1 ? "수정 성공" : "수정 실패");
        m.addAttribute("url", "/board/view/" + board.getBiNum());
        return "views/common/msg";
    }

    @PostMapping("/board/delete/{biNum}")
    public String deleteBoard(@PathVariable("biNum") int biNum, HttpSession session, Model m) {
        BoardVO board = boardService.getBoard(biNum);
        UserVO loginUser = (UserVO) session.getAttribute("user");

        if (loginUser == null || loginUser.getUiNum() != board.getUiNum()) {
            m.addAttribute("msg", "삭제 권한이 없습니다.");
            m.addAttribute("url", "/board/list");
            return "views/common/msg";
        }

        int result = boardService.deleteBoard(biNum);
        m.addAttribute("msg", result == 1 ? "삭제 성공" : "삭제 실패");
        m.addAttribute("url", "/board/list");
        return "views/common/msg";
    }
    
   
}