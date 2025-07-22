package com.example.game3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.game3.service.ScoreService;
import com.example.game3.vo.ScoreVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScoreController {
	@Autowired
  private ScoreService scoreService;
	//점수 저장
	@PostMapping("/score/insert")
	@ResponseBody
	public int insertScore(@RequestBody ScoreVO score) {
	    return scoreService.insertScore(score); // 성공하면 1, 실패하면 0
	}

	//랭킹에서 get-list
  @GetMapping("/Ranking")
  public List<ScoreVO> getScoreList(@ModelAttribute ScoreVO score) {
      return scoreService.getScores(score); // 전체 유저 점수 목록
  }	
	
	
//	//마이페이지에서 get-number로 하고
//  @GetMapping("/my/{uiNum}")
//  public List<ScoreVO> getMyScores(@PathVariable int uiNum) {
//      return scoreService.getScores(null)
//  }	
	
	//delete 는 가능하게 마이페이지에서 
  @DeleteMapping("/{siNum}")
  public int deleteScore(@PathVariable("siNum") int siNum) {
      return scoreService.deleteScore(siNum);
  }
}