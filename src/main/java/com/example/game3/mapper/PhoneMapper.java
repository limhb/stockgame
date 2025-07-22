package com.example.game3.mapper;

import java.util.List;

import com.example.game3.vo.PhoneVO;

public interface PhoneMapper {
	List<PhoneVO> selectPhones(PhoneVO phone);
	PhoneVO selectPhone(int piNum);
	int insertPhone(PhoneVO phone);
	int updatePhone(PhoneVO phone);
	int deletePhone(int piNum);
}
