package com.example.game3.controller;

import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.game3.service.CoinService;

@RestController
@RequestMapping("/api/coin")
public class CoinController {

    @Autowired
    private CoinService coinService;

    @GetMapping("/price")
    public String getPrice() {
        double price = coinService.getCurrentPrice("KRW-BTC");
        
       
        DecimalFormat df = new DecimalFormat("#,###");
        String formattedPrice = df.format(price);

        return "현재 BTC 가격: " + formattedPrice + "원";
    }
}