package com.example.game3;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan
@SpringBootApplication
public class Game3Application {

	public static void main(String[] args) {
		SpringApplication.run(Game3Application.class, args);
	}

}
