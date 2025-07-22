package com.example.game3.vo;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class PositionVO {
    private String type; // "long" or "short"
    private BigDecimal entryPrice;
    private int leverage; // 1 ~ 100
    private BigDecimal amount; // 진입 금액
}