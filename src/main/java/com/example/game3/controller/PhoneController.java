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

import com.example.game3.service.PhoneService;
import com.example.game3.vo.PhoneVO;

@Controller
public class PhoneController {
	@Autowired
	private PhoneService phoneService;
	
	@GetMapping("/phones")
	@ResponseBody
	public List<PhoneVO> getPhones(@ModelAttribute PhoneVO phone){
		return phoneService.getPhones(phone);
	}

	@GetMapping("/phones/{piNum}")
	@ResponseBody
	public PhoneVO getPhones(@PathVariable("piNum") int piNum){
		return phoneService.getPhone(piNum);
	}
	
	@PostMapping("/phones")
	@ResponseBody
	public int insertPhone(@RequestBody PhoneVO phone){
		return phoneService.insertPhone(phone);
	}
	
	@PutMapping("/phones")
	@ResponseBody
	public int updatePhone(@RequestBody PhoneVO phone){
		return phoneService.updatePhone(phone);
	}
	
	@DeleteMapping("/phones/{piNum}")
	@ResponseBody
	public int deletePhone(@PathVariable("piNum") int piNum){
		return phoneService.deletePhone(piNum);
	}
	
}