package com.example.game3.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.game3.session.GameSession;

//@Service
//public class GameService {
//    private static final double INITIAL_BALANCE = 1000000; // 초기 자본 100만원
//    private Map<Integer, GameSession> sessions;
//
//    @Autowired
//    private StockService stockService;  // 실시간 주식 가격을 가져오는 서비스
//
//    public void startGame(int uiNum) {
//        GameSession session = new GameSession(INITIAL_BALANCE);
//        sessions.put(uiNum, session);
//    }
//
//    // Long 포지션 오픈
//    public String openLongPosition(int uiNum, String symbol, int quantity, double leverageMultiplier) {
//        GameSession session = sessions.get(uiNum);
//        double currentPrice = stockService.getCurrentPrice(symbol);
//        if (session.openLongPosition(symbol, quantity, currentPrice, leverageMultiplier)) {
//            return "Long 포지션 오픈 성공: " + symbol + " " + quantity + "주, 레버리지 x" + leverageMultiplier;
//        }
//        return "Long 포지션 오픈 실패: 자금 부족";
//    }
//
//    // Short 포지션 오픈
//    public String openShortPosition(int uiNum, String symbol, int quantity, double leverageMultiplier) {
//        GameSession session = sessions.get(uiNum);
//        double currentPrice = stockService.getCurrentPrice(symbol);
//        if (session.openShortPosition(symbol, quantity, currentPrice, leverageMultiplier)) {
//            return "Short 포지션 오픈 성공: " + symbol + " " + quantity + "주, 레버리지 x" + leverageMultiplier;
//        }
//        return "Short 포지션 오픈 실패: 자금 부족";
//    }
//
//    // 포지션 종료 (매도)
//    public String closePosition(int uiNum, String symbol, int quantity) {
//        GameSession session = sessions.get(uiNum);
//        double currentPrice = stockService.getCurrentPrice(symbol);
//        if (session.closePosition(symbol, quantity, currentPrice)) {
//            return "포지션 종료 성공: " + symbol + " " + quantity + "주";
//        }
//        return "포지션 종료 실패: 보유 주식 부족";
//    }
//
//    public double endGame(int uiNum) {
//        GameSession session = sessions.get(uiNum);
//        Map<String, Double> currentPrices = stockService.getAllCurrentPrices();
//        double totalAssets = session.getTotalAssets(currentPrices);
//        return totalAssets - INITIAL_BALANCE; // 수익
//    }
//}
