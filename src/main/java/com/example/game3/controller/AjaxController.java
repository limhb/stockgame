package com.example.game3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {
	
	@GetMapping("/ajax/test")
	@ResponseBody
	public String ajax1() {
		return "views/ajax/test";
	}
	
	@GetMapping("/ajax/list")
	@ResponseBody
	public List<String> getList(){
		List<String> list = new ArrayList<>();
		list.add("1");
		list.add("2");
		return list;
	}
	
	@GetMapping("/ajax/map")
	@ResponseBody
	public Map<String, String> getMap(){ 
		Map<String,String> map  = new HashMap<>();
		map.put("이름","김철수");
		map.put("나이", "33");
		return map;
	}
}
