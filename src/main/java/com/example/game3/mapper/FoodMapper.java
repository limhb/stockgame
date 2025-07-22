package com.example.game3.mapper;

import java.util.List;

import com.example.game3.vo.FoodVO;

public interface FoodMapper {
	
	public List<FoodVO> selectFoods(FoodVO food);
	public FoodVO selectFood(int fiNum);
	public int insertFood(FoodVO food);
	public int updateFood(FoodVO food);
	public int deleteFood(int fiNum);
}
