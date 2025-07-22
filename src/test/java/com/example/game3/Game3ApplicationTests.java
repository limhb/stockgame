package com.example.game3;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.example.game3.mapper.UserMapper;
import com.example.game3.vo.UserVO;

@SpringBootTest
class Game3ApplicationTests {

	
	@Autowired
	private UserMapper userMapper;
	private UserVO mockUser;
	
	@BeforeEach
	void setUser() {
		mockUser = new UserVO();
		mockUser.setUiId("mock-id");
		mockUser.setUiPwd("mock-pwd");
		mockUser.setUiName("mock-name");
		mockUser.setUiNickName("mock-nickname");
		mockUser.setUiAddr1("mock-address");
		mockUser.setUiZip("mockz");
		
	}

	@Test
    @DisplayName("유저 잔액 업데이트 테스트")
    @Transactional
    void updateUserBalanceTest() {
        // 유저가 존재하는지 확인
        UserVO preUser = userMapper.selectUserById(mockUser);
        if (preUser == null) {
            // 만약 유저가 없다면 먼저 유저 등록
            userMapper.insertUser(mockUser);
            preUser = userMapper.selectUserById(mockUser); // 등록된 유저 가져오기
        }

      
    }

	
	@Test
    @DisplayName("유저 수정 테스트")
    void updateUser() {
        UserVO preUser = userMapper.selectUserById(mockUser);
        if (preUser != null) {
            preUser.setUiName("updated-name");
            int result = userMapper.updateUser(preUser);
            Assert.isTrue(result == 1, "업데이트 실패");
        }
    }
  

	@Test
	@DisplayName("유저 등록 테스트")
	void insertUsers() {
		UserVO preUser = userMapper.selectUserById(mockUser);
		if(preUser ==null) {
			Assert.isNull(preUser,"입력가능상태입니다.");
			int result = userMapper.insertUser(mockUser);
			Assert.isTrue(result==1, "정상입력");			
		}
	}

	@Test
	@DisplayName("유저 업데이트 테스트")
	void updateUsers() {
		UserVO preUser = userMapper.selectUserById(mockUser);
		if(preUser ==null) {
			Assert.isNull(preUser,"입력가능상태입니다.");
			int result = userMapper.updateUser(mockUser);
			Assert.isTrue(result==1, "정상입력");			
		}
	}
	
	@Test
	@DisplayName("유저 휴먼 테스트")
	void deleteUsers() {
			int result = userMapper.deleteUser(mockUser.getUiNum());
			Assert.isTrue(result==1, "삭제");			

	}
	
}
