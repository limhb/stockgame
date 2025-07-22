package com.example.game3.session;

import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
public class GameSession {
    private double balance;              // 잔액
    private Map<String, Integer> stocks;  // 보유 주식 (예: {BTC: 10, ETH: 5})
    private Map<String, Double> buyPrices; // 매수 가격 (예: {BTC: 30000, ETH: 2000})
    private Map<String, Integer> positions; // 포지션 (Long: 1, Short: -1)
    private Map<String, Double> leverage; // 레버리지 (x1 ~ x100)

    public GameSession(double initialBalance) {
        this.balance = initialBalance;
        this.stocks = new HashMap<>();
        this.buyPrices = new HashMap<>();
        this.positions = new HashMap<>();
        this.leverage = new HashMap<>();
    }

    // Long 포지션을 잡는 함수
    public boolean openLongPosition(String symbol, int quantity, double price, double leverageMultiplier) {
        double totalCost = price * quantity / leverageMultiplier;
        if (balance >= totalCost) {
            balance -= totalCost;
            positions.put(symbol, 1); // Long 포지션
            leverage.put(symbol, leverageMultiplier);
            buyPrices.put(symbol, price);
            stocks.put(symbol, quantity);
            return true;
        }
        return false;
    }

    // Short 포지션을 잡는 함수
    public boolean openShortPosition(String symbol, int quantity, double price, double leverageMultiplier) {
        double totalCost = price * quantity / leverageMultiplier;
        if (balance >= totalCost) {
            balance -= totalCost;
            positions.put(symbol, -1); // Short 포지션
            leverage.put(symbol, leverageMultiplier);
            buyPrices.put(symbol, price);
            stocks.put(symbol, quantity);
            return true;
        }
        return false;
    }

    // 포지션을 종료하는 함수 (매도)
    public boolean closePosition(String symbol, int quantity, double currentPrice) {
        if (positions.containsKey(symbol) && stocks.get(symbol) >= quantity) {
            double totalRevenue;
            if (positions.get(symbol) == 1) { // Long 포지션
                totalRevenue = currentPrice * quantity;
            } else { // Short 포지션
                totalRevenue = (buyPrices.get(symbol) - currentPrice) * quantity;
            }

            balance += totalRevenue;
            stocks.put(symbol, stocks.get(symbol) - quantity);
            positions.remove(symbol);  // 포지션 종료
            return true;
        }
        return false;
    }

    // 보유 주식의 총 가치를 계산 (현재 주식 가격을 기반으로)
    public double getStocksValue(Map<String, Double> currentPrices) {
        double totalValue = 0;
        for (String symbol : stocks.keySet()) {
            totalValue += currentPrices.get(symbol) * stocks.get(symbol);
        }
        return totalValue;
    }

    // 전체 자산 (잔액 + 보유 주식 가치)
    public double getTotalAssets(Map<String, Double> currentPrices) {
        return balance + getStocksValue(currentPrices);
    }
}