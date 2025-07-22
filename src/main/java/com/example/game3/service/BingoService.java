package com.example.game3.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class BingoService {
	
private static Map<String,String> bingoSession = Collections.synchronizedMap(new HashMap<>());
	
	public static Map<String,String> getBingoSession(){
		return bingoSession;
	}
	
	public static void removeSessionId(String sessionId) {
		bingoSession.remove(sessionId);
	}
	public static boolean isExisteName(String name) {
		Iterator<String> it = bingoSession.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			if(name.equals(bingoSession.get(key))) {
				return true;
			}
		}
		return false;
	}
	
	public static void addSession(String sessionId, String name) {
		if(!bingoSession.containsKey(sessionId)) {
			bingoSession.put(sessionId,  name);
		}
	}
	
	public static String getName(String sessionId) {
		return bingoSession.get(sessionId);
	}
	
	public static String getSessionId(String name) {
		Iterator<String> it = bingoSession.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			if(name.equals(bingoSession.get(key))) {
				return key;
			}
		}
		return null;
	}
}
