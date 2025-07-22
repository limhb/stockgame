package com.example.game3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.game3.mapper.ScoreMapper;
import com.example.game3.vo.ScoreVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ScoreService {
	@Autowired
	private ScoreMapper scoreMapper;

	public List<ScoreVO> getScores(ScoreVO score) {
		return scoreMapper.selectScores(score);
	}

	public ScoreVO getScore(int siNum) {
		return scoreMapper.selectScore(siNum);
	}

	public int insertScore(ScoreVO score) {
		log.info("점수 저장 시도 - ScoreVO: {}", score);
		try {
			int result = scoreMapper.insertScore(score);
			log.info("점수 저장 결과 - result: {}", result);
			return result;
		} catch (Exception e) {
			log.error("점수 저장 중 오류 발생", e);
			throw e;
		}
	}

	public int updateScore(ScoreVO score) {
		return scoreMapper.updateScore(score);
	}

	public int deleteScore(int siNum) {
		return scoreMapper.deleteScore(siNum);
	}

	public Integer getUserHighScore(int uiNum) {
	    return scoreMapper.selectUserHighScore(uiNum);
	}

	public void saveScore(int uiNum, int score) {
		log.info("점수 저장 시도 - uiNum: {}, score: {}", uiNum, score);
		try {
			scoreMapper.insertScoreWithParams(uiNum, score);
			log.info("점수 저장 성공");
		} catch (Exception e) {
			log.error("점수 저장 실패", e);
			throw e;
		}
	}

	public List<ScoreVO> getTopScores(int limit) {
		return scoreMapper.selectTopNScores(limit);
	}

	public List<ScoreVO> getUserScores(int uiNum) {
		ScoreVO score = new ScoreVO();
		score.setUiNum(uiNum);
		return scoreMapper.selectScores(score);
	}

}
