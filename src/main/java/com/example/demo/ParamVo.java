package com.example.demo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ParamVo {
	private int x;
	private int y;
	private List<String> food; //다중선택값은 리스트 또는 배열 타입으로 
	//날짜시간문자열을 날짜시간객체로 받기 위해서는 @DateTimeFormat로 문자열 형식 지정 
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birth;
	//파일은 스프링의 MultipartFile 타입으로 받을 수 있다 
	private MultipartFile upfile;
}
