package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.demo.member.LoginInterceptor;

@Configuration // 이 클래스가 스프링 설정파일 역할을 하는 클래스임을 표시
public class WebConfig implements WebMvcConfigurer{
	// 현재 스프링 WMC 설정을 유지한 상태에서 필요한 부분만 추가 및 변경하고 싶은 경우,
	// WebMvcConfigurer 인터페이스를 구현하여 작성하면 편리
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()) // LoginInterceptor를 스프링에 인터셉터
			.addPathPatterns("/member/list.do"); // 모든 경로에 대한 요청에 대해서 LoginInterceptor를 실행
			//.addPathPatterns("/member/list.do"); // 모든 경로에 대한 요청에 대해서 LoginInterceptor를 실행
		    //.excludePathPatterns("/member/login.do") // LoginInterceptor를 실행하지 않을 경로 설정 .excludePathPatterns
		    //.excludePathPatterns("/member/add.do"); // LoginInterceptor를 실행하지 않을 경로 설정 .excludePathPatterns
	}
	
}
