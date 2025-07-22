package com.example.game3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	
	@GetMapping("/")
	public String home() {
		return "views/index";
	}
	
	@GetMapping("/views/**")
	public void goPage() {
	}
	
}
