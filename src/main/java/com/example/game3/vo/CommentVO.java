package com.example.game3.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {
	  private int ciNum;
	    private int biNum;
	    private int uiNum;
	    private String uiName; // 사용자 이름도 함께 사용
	    private String ciContent;
	    private String ciRegdate;
		private String credat;
		private String cretim;
		private String lmodat;
		private String lmotim;

}
