package com.example.game3.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.game3.mapper.UserMapper;
import com.example.game3.vo.UserVO;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    // 전체 사용자 조회
    public List<UserVO> getUsers(UserVO user){
		return userMapper.selectUsers(user);
	}

    public UserVO getUser(int uiNum){
		return userMapper.selectUser(uiNum);
	}

    // 특정 사용자 조회 (UI_ID 기준)
    public UserVO getUserById(UserVO user) {
        return userMapper.selectUserById(user);
    }
    public UserVO getUserById(String uiId) {
        return userMapper.selectUserById(uiId);
    }
    
    public UserVO getUserByIdAndPwd(UserVO user) {
        return userMapper.selectUserByIdAndPwd(user);
    }

    public UserVO login(UserVO user){
		return userMapper.selectUserByIdAndPwd(user);
	}
    
	

    // 사용자 추가 (회원가입)
    public int insertUser(UserVO user){
		return userMapper.insertUser(user);
	}

    // 사용자 정보 업데이트
    @Transactional
    public int updateUser(UserVO user) {
        return userMapper.updateUser(user);
    }

    // 사용자 삭제 (비활성화)
    @Transactional
    public int deleteUser(int uiNum) {
        return userMapper.deleteUser(uiNum);
    }




 
    
    // 랭킹 조회
    public List<UserVO> getRanking() {
        return userMapper.getRanking();
    }




   
}
