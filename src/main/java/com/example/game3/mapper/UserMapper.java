package com.example.game3.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.game3.vo.UserVO;

@Mapper
public interface UserMapper {

    // 전체 사용자 조회
    List<UserVO> selectUsers(UserVO user);

    // 특정 사용자 조회 (UI_NUM 기준)
    UserVO selectUser(int uiNum);
    
    public UserVO selectUserById(String uiId);


    // 특정 사용자 조회 (UI_ID 기준)
    UserVO selectUserById(UserVO user);

    // 사용자 상태별 개수 조회
    List<UserVO> selectCntByActive();

    // 사용자 추가 (회원가입)
    int insertUser(UserVO user);

    // 사용자 정보 업데이트
    int updateUser(UserVO user);

    // 사용자 삭제 (비활성화)
    int deleteUser(int uiNum);
    
    public UserVO selectUserByIdAndPwd(UserVO user);

    UserVO updateStockInfo(UserVO userVO);
    
    List<UserVO> getRanking();
    
}
