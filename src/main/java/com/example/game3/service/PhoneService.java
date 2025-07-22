package com.example.game3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.game3.mapper.PhoneMapper;
import com.example.game3.vo.PhoneVO;

@Service
public class PhoneService {
	@Autowired
	private PhoneMapper phoneMapper;

	public List<PhoneVO> getPhones(PhoneVO phone){
		return phoneMapper.selectPhones(phone);
	}
	public PhoneVO getPhone(int piNum){
		return phoneMapper.selectPhone(piNum);
	}
	public int insertPhone(PhoneVO phone){
		return phoneMapper.insertPhone(phone);
	}
	public int updatePhone(PhoneVO phone){
		return phoneMapper.updatePhone(phone);
	}
	public int deletePhone(int piNum){
		return phoneMapper.deletePhone(piNum);
	}
}