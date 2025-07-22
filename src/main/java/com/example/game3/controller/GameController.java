package com.example.game3.controller;

import java.util.List;
import java.util.Map;
import java.util.Arrays;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.game3.service.ScoreService;
import com.example.game3.service.StockService;
import com.example.game3.vo.ScoreVO;
import com.example.game3.vo.StockVO;
import com.example.game3.vo.UserVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/game")
@Slf4j
public class GameController {

    @Autowired
    private StockService stockService;

    @Autowired
    private ScoreService scoreService;

    // 게임 플레이 페이지
    @GetMapping("/play")
    public String playPage() {
        return "/views/game/play";
    }

    // 게임 결과 페이지
    @GetMapping("/result")
    public String gameResult(HttpSession session, Model model) {
        UserVO user = (UserVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        // 전체 랭킹 (상위 5명)
        List<ScoreVO> rankList = scoreService.getTopScores(5);
        model.addAttribute("rankList", rankList);
        return "/views/game/result";
    }

    // 단일 코인 현재 가격 조회
    @GetMapping("/price")
    @ResponseBody
    public StockVO getCurrentPrice(
            @RequestParam("coin") String coin, 
            @RequestParam(value = "dopamineMode", defaultValue = "false") boolean dopamineMode) {
        log.debug("단일 코인 가격 조회 - coin: {}, dopamineMode: {}", coin, dopamineMode);
        String market = "KRW-" + coin;
        return stockService.getUpbitPrice(market, dopamineMode);
    }
    
    // 여러 코인 가격 동시 조회
    @GetMapping("/prices")
    @ResponseBody
    public List<StockVO> getPrices(
            @RequestParam("coins") String coins,
            @RequestParam(value = "dopamineMode", defaultValue = "false") boolean dopamineMode) {
        log.debug("여러 코인 가격 조회 - coins: {}, dopamineMode: {}", coins, dopamineMode);
        List<String> markets = Arrays.stream(coins.split(","))
                                   .map(coin -> "KRW-" + coin)
                                   .toList();
        return stockService.getMultiplePrices(markets, dopamineMode);
    }
    
    // 청산 가격 계산
    @GetMapping("/liquidation")
    @ResponseBody
    public Map<String, Object> calculateLiquidation(
            @RequestParam double entryPrice,
            @RequestParam int leverage,
            @RequestParam boolean isLong) {
        log.debug("청산 가격 계산 - entryPrice: {}, leverage: {}, isLong: {}", 
                  entryPrice, leverage, isLong);
        return stockService.calculateLiquidation(entryPrice, leverage, isLong);
    }

    // 점수 저장 처리
    @PostMapping("/save-score")
    @ResponseBody
    public Map<String, Object> saveScore(@RequestParam("score") int score, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        UserVO user = (UserVO) session.getAttribute("user");
        if (user == null) {
            log.warn("비인증 사용자가 점수 저장을 시도했습니다.");
            response.put("status", "error");
            response.put("message", "로그인이 필요합니다.");
            return response;
        }
        
        try {
            scoreService.saveScore(user.getUiNum(), score);
            log.info("점수 저장 성공 - uiNum: {}, score: {}", user.getUiNum(), score);
            return Map.of("status", "success", "message", "점수가 저장되었습니다.");
        } catch (Exception e) {
            log.error("점수 저장 실패 - uiNum: {}, score: {}", user.getUiNum(), score, e);
            return Map.of("status", "error", "message", "점수 저장에 실패했습니다.");
        }
    }

    @GetMapping("/guide")
    public String gameGuide() {
        return "/views/game/guide";
    }

   
}
