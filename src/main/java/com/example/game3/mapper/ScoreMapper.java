package com.example.game3.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.game3.vo.ScoreVO;

@Mapper
public interface ScoreMapper {
	// 점수 목록 조회
	List<ScoreVO> selectScores(ScoreVO score);
	
	// 특정 점수 조회
	ScoreVO selectScore(int siNum);
	
	// 점수 저장 (VO 사용)
	int insertScore(ScoreVO score);
	
	// 점수 수정
	int updateScore(ScoreVO score);
	
	// 점수 삭제
	int deleteScore(int siNum);
	
	// 유저의 최고 점수 조회
	Integer selectUserHighScore(int uiNum);
	
	// 상위 N명 랭킹 조회
	List<ScoreVO> selectTopNScores(int limit);
	
	// 점수 저장 (파라미터 사용)
	void insertScoreWithParams(int uiNum, int score);
}