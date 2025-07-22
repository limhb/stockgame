package com.example.game3.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageVO {

	private String name;
	private String message;
	private int type; 
	// 0: 입장 , 1: 번호 선택, 2: 정상입장
	// -2 : 입장불가, -1 : 동일한 이름
	private String errorMessage;
}
