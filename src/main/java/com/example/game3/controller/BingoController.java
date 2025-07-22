package com.example.game3.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.example.game3.service.BingoService;
import com.example.game3.vo.ErrorVO;
import com.example.game3.vo.MessageVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class BingoController {
	
	@Autowired
	private SimpMessagingTemplate smt;

	@MessageMapping("/bingo")
	@SendTo("/topic/bingo")
	public MessageVO bingo(MessageVO message) {
		return message;
	}
	
	@MessageMapping("/check/{name}")
	public void checkName(@DestinationVariable("name") String name, @Header("simpSessionId") String sessionId) {
		log.info("name=>{}", name);
		if(BingoService.isExisteName(name)) {
			ErrorVO error = new ErrorVO();
			error.setErrorCode(1);
			error.setErrorMsg(name + "은 이미 존재하는 이름입니다.");
			smt.convertAndSend("/topic/check/" + name, error);
			return;
		}
		BingoService.addSession(sessionId, name);
		Map<String,String> map = new HashMap<>();
		map.put(sessionId, name);
		map.put("mySessionId", sessionId);
		smt.convertAndSend("/topic/visite", map);
		map.putAll(BingoService.getBingoSession());
		map.put("playerCnt", BingoService.getBingoSession().size() + ""); //1,2
		smt.convertAndSend("/topic/check/" + name, map);
	}
	
}
