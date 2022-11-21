package com.example.demo;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//컨트롤러 : 웹 요청을 받아서 실행되는 명령문들을 담고 있는 클래스
//컨트롤러 클래스는
//	(1)DemoApplication 클래스의 패키지 아래(하위,내부)에 클래스 생성
//	(2)@Controller 를 클래스에 적용
//  (3)웹 요청을 받아서 실행될 메서드에 @RequestMapping()를 적용하고,
//		어떤 요청을 받았을 때 실행할지를 ()안에 옵션 값으로 지정

@Controller
public class HomeController {
	
	@RequestMapping(path = "/hello.do")
	public String abc() {
		System.out.println("Hello!!!!");
		return "hello";
//		컨트롤러에서 실행결과 문자열(뷰이름)을 반환하면,
//		스프링은 뷰이름 앞에 spring.mvc.view.prefix 설정값을 붙이고,
//		뒤에 spring.mvc.view.suffix 설정값을 붙여서,
//		해당 JSP 파일로 이동(실행)
//		"/WEB-INF/views/" + "hello" + ".jsp" = "/WEB-INF/views/hello.jsp"
	}

	//"/param.do" 주소(경로)로 GET 방식 요청이 오면, 이 메서드를 실행
	@RequestMapping(path = "/param.do",method = RequestMethod.POST)
	public String aaa(
			@RequestParam("x") int a //요청파라미터 x의 값을 이 변수에 저장
			, int y //요청파라미터이름과 변수명이 같으면, @RequestParam 생략 가능
			//객체 내부의 속성(=필드=멤버변수)이름이 요청파라미터 이름과 같으면,
			//해당 변수에 요청파라미터 값을 자동 저장(주입)
			, ParamVo vo
			//스프링 컨트롤러에서 '모델' : 컨트롤러와 뷰(JSP)가 공유하는 데이터
			//컨트롤러 메서드의 인자로 받은 Model, Map, ModelMap 객체에
			//공유할 데이터를 이름 붙여 저장하면, JSP에서 ${이름} 표현으로 사용 가능
			, Model model, Map map, ModelMap modelMap
			) {
		System.out.println(a);
		System.out.println(y);
		System.out.println(vo.getX());
		System.out.println(vo.getY());
		int z = vo.getX() + vo.getY();
		//변수 z의 값을 모델에 "a"라는 이름으로 저장, JSP에서 ${a} 표현으로 사용 가능
		model.addAttribute("a", z); 
		//변수 z의 값을 모델에 "b"라는 이름으로 저장, JSP에서 ${b} 표현으로 사용 가능
		map.put("b", z); 
		//변수 z의 값을 모델에 "c"라는 이름으로 저장, JSP에서 ${c} 표현으로 사용 가능
		modelMap.addAttribute("c", z);
		
		System.out.println( vo.getFood() );
		System.out.println( vo.getBirth() );
		
		System.out.println( vo.getUpfile().getOriginalFilename() ); //원래 파일명
		System.out.println( vo.getUpfile().getSize() ); //파일 크기
		try {
			//업로드한 파일의 내용을  E:/임의의파일명  으로 저장
			FileCopyUtils.copy( vo.getUpfile().getBytes() , new File("E:/"+ UUID.randomUUID() ) );
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "param";
	}
	
	@RequestMapping(path = "/form.do", method = RequestMethod.GET)
//	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
//	@GetMapping("/form.do") //스프링4.3버전부터 요청방식별 단축애노테이션 제공
	public String bbb() {
		return "form";
	}
	
	
}






