package com.example.game3.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.example.game3.mapper.StockMapper;
import com.example.game3.vo.StockVO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class StockService {

    private static final Logger log = LoggerFactory.getLogger(StockService.class);

    @Autowired
    private RestTemplate restTemplate;

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final Random random = new Random();

    // 업비트 API에서 현재가 조회
    public StockVO getUpbitPrice(String market, boolean dopamineMode) {
        StockVO stock = new StockVO();
        try {
            // API URL 설정
            String apiUrl = "https://api.upbit.com/v1/ticker?markets=" + market;
            URL url = new URL(apiUrl);
            
            // HTTP 연결 설정
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");
            
            // 응답 읽기
            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(
                    new InputStreamReader(conn.getInputStream())
                );
                StringBuilder response = new StringBuilder();
                String line;
                
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();
                
                // JSON 파싱
                List<Map<String, Object>> priceList = objectMapper.readValue(
                    response.toString(), 
                    objectMapper.getTypeFactory().constructCollectionType(
                        List.class, Map.class)
                );
                
                if (!priceList.isEmpty()) {
                    Map<String, Object> priceData = priceList.get(0);
                    double realPrice = Double.parseDouble(priceData.get("trade_price").toString());
                    
                    // 도파민 모드 처리
                    if (dopamineMode) {
                        double randomVolatility = 0.01 + (random.nextDouble() * 0.19);
                        double volatilityMultiplier = 1.0 + (random.nextDouble() > 0.5 ? randomVolatility : -randomVolatility);
                        realPrice *= volatilityMultiplier;
                    }
                    
                    stock.setSymbol(market);
                    stock.setPrice(realPrice);
                }
            }
            conn.disconnect();
            
        } catch (Exception e) {
            log.error("업비트 API 호출 중 오류: {}", e.getMessage());
        }
        return stock;
    }
    
    // 여러 코인 가격 조회
    public List<StockVO> getMultiplePrices(List<String> markets, boolean dopamineMode) {
        List<StockVO> stockList = new ArrayList<>();
        try {
            // API URL 설정
            String marketString = String.join(",", markets);
            String apiUrl = "https://api.upbit.com/v1/ticker?markets=" + marketString;
            URL url = new URL(apiUrl);
            
            // HTTP 연결 설정
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");
            
            // 응답 읽기
            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(
                    new InputStreamReader(conn.getInputStream())
                );
                StringBuilder response = new StringBuilder();
                String line;
                
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();
                
                // JSON 파싱
                List<Map<String, Object>> priceList = objectMapper.readValue(
                    response.toString(), 
                    objectMapper.getTypeFactory().constructCollectionType(
                        List.class, Map.class)
                );
                
                for (Map<String, Object> priceData : priceList) {
                    StockVO stock = new StockVO();
                    String market = priceData.get("market").toString();
                    double realPrice = Double.parseDouble(priceData.get("trade_price").toString());
                    
                    // 도파민 모드 처리
                    if (dopamineMode) {
                        double randomVolatility = 0.01 + (random.nextDouble() * 0.19);
                        double volatilityMultiplier = 1.0 + (random.nextDouble() > 0.5 ? randomVolatility : -randomVolatility);
                        realPrice *= volatilityMultiplier;
                    }
                    
                    stock.setSymbol(market);
                    stock.setPrice(realPrice);
                    stockList.add(stock);
                }
            }
            conn.disconnect();
            
        } catch (Exception e) {
            log.error("업비트 API 호출 중 오류: {}", e.getMessage());
        }
        return stockList;
    }
    
    // 청산 가격 계산
    public Map<String, Object> calculateLiquidation(double entryPrice, int leverage, boolean isLong) {
        Map<String, Object> result = new HashMap<>();
        
        try {
            if (leverage <= 0) {
                throw new IllegalArgumentException("레버리지는 0보다 커야 합니다");
            }
            
            // 청산 임계값 계산 (예: 10배 레버리지면 약 10% 변동시 청산)
            double threshold = 1.0 / leverage;
            double liquidationPrice;
            
            if (isLong) {
                // 롱 포지션은 가격이 내려갈 때 청산
                liquidationPrice = entryPrice * (1 - threshold);
            } else {
                // 숏 포지션은 가격이 올라갈 때 청산
                liquidationPrice = entryPrice * (1 + threshold);
            }
            
            result.put("success", true);
            result.put("liquidationPrice", liquidationPrice);
            result.put("threshold", threshold * 100); // 퍼센트로 변환
            
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", e.getMessage());
            log.error("청산가 계산 중 오류: {}", e.getMessage());
        }
        
        return result;
    }
}
