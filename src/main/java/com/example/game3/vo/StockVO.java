package com.example.game3.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StockVO {
    private int stNum;         // 거래번호 또는 가격기록번호
    private String symbol;     // 코인 심볼 (ex: BTC)
    private double price;      // 가격
    private String type;       // 거래 타입: LONG or SHORT
    private double leverage;   // 레버리지 배율
    private int uiNum;         // 유저 번호
    private double amount;     // 거래량
    private String credat;     // 생성일자
    private String cretim;     // 생성시간
}
