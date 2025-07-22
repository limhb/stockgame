package com.example.game3.mapper;

import java.util.List;

import com.example.game3.vo.StockVO;

public interface StockMapper {
	

	  // 가격 저장
    int insertStockPrice(StockVO stock);

    // 심볼별 최신 가격 조회
    StockVO selectLatestPrice(String symbol);

    // 전체 가격 정보
    List<StockVO> selectAllPrices();

    // 거래 기록 저장
    int insertTrade(StockVO stock);

    // 유저별 거래 내역 조회
    List<StockVO> selectUserTrades(int uiNum);
}
