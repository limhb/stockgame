package com.example.game3.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int biNum;
	private String biTitle;
	private String biContent;
	private int uiNum;
	private String uiName;
	private String credat;
	private String cretim;
	private String lmodat;
	private String lmotim;
	private String searchType;
	private String searchKeyword;
	private int biViews;
	private int page;
	private int rowCount;
	private int offset;
}