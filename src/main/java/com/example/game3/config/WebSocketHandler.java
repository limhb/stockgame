package com.example.game3.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.web.socket.messaging.AbstractSubProtocolEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import com.example.game3.service.BingoService;

import lombok.extern.slf4j.Slf4j;

@Configuration
@Slf4j
public class WebSocketHandler {
    
    @Autowired
    private SimpMessagingTemplate smt;

    // WebSocket 세션이 종료될 때 처리
    @EventListener
    public void handleSessionDisconnect(SessionDisconnectEvent event) {
        String sessionId = getSessionId(event);
        log.info("sessionId{}"+ sessionId);
        BingoService.removeSessionId(sessionId);
        
        // 여기에 세션이 끊길 때 실행할 로직 추가 가능
    }

    // STOMP 헤더에서 세션 ID 가져오는 메서드
    public String getSessionId(AbstractSubProtocolEvent event) {
        StompHeaderAccessor header = StompHeaderAccessor.wrap(event.getMessage());
        return header.getSessionId();
    }
}
