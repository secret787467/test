package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

// @SpringBootApplication = @Configuration + @EnableAutoConfiguration + @ComponentScan
// @Configuration : 현재 클래스가 스프링 설정 파일 역할을 수행하는 클래스
// @EnableAutoConfiguration : 스프링 자동 설정 기능을 활성화
// @ComponentScan : @Componet,@Controller,@Service,@Repository등이 적용된 클래스 자동 등록

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
