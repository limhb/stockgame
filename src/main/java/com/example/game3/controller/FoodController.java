package com.example.game3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.game3.service.FoodService;
import com.example.game3.vo.FoodVO;

@Controller
public class FoodController {


	@Autowired
	private FoodService foodService;
	
	@GetMapping("/foods")
	@ResponseBody
	public List<FoodVO> getFoods(@ModelAttribute FoodVO food){
		return foodService.getFoods(food);
	}
	
	@GetMapping("/foods/{fiNum}")
	@ResponseBody
	public FoodVO getFood(@PathVariable("fiNum")int fiNum) {
		return foodService.getFood(fiNum); 
	}
	
	@DeleteMapping("foods/{fiNum}")
	@ResponseBody
	public int deleteFood(@PathVariable("fiNum")int fiNum) {
		return foodService.deleteFood(fiNum); 
	}
	
	@PostMapping("/foods")
	@ResponseBody
	public int insertFood(@RequestBody FoodVO food) {
		return foodService.insertFood(food);
	}
	
	@PutMapping("/foods/{fiNum}")
	@ResponseBody
	public int updateFood(@RequestBody FoodVO food, @PathVariable("fiNum")int fiNum) {
		food.setFiNum(fiNum);
		return foodService.updateFood(food);
	}
}
