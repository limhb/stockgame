package com.example.game3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.game3.mapper.FoodMapper;
import com.example.game3.vo.FoodVO;

@Service
public class FoodService {
	
	@Autowired
	private FoodMapper foodMapper;
	public List<FoodVO> getFoods(FoodVO food){
		return foodMapper.selectFoods(food);
	}
	
	public FoodVO getFood(int fiNum) {
		return foodMapper.selectFood(fiNum);
	}
	public int insertFood(FoodVO food) {
		return foodMapper.insertFood(food);
	}
	public int updateFood(FoodVO food) {
		return foodMapper.updateFood(food);
	}
	public int deleteFood(int fiNum) {
		return foodMapper.deleteFood(fiNum);
	}
}
