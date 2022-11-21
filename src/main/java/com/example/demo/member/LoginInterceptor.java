package com.example.demo.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

// 핸들러 인터셉터:
// 다수의 컨트롤러(핸들러)와 실행 전후에 공통적으로 수행할 작업들을 구현
// HandlerInterceptor 인터페이스를 구현하여 작성

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 컨트롤러(핸들러) 실행 전에 실행
		// 반환값(true, false)에 따라서 이후에 실행될 컨트롤러나 다른 인터셉터의 실행 여부를 결정
		System.out.println("preHandle!");
		
		HttpSession session = request.getSession(); // 현재 요청을 보낸 사용자의 세션객체를 가져오기
		MemberVo mvo = (MemberVo)session.getAttribute("loginuser");
		if (mvo==null) { // 로그인한 적이 없는 사용자인 경우
			response.sendRedirect(request.getContextPath() + "/member/login.do"); // 로그인 화면으로 이동
			return false; // 컨트롤러를 실행하지 않음
		}
		
		return true; // 컨트롤러를 실행
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 컨트롤러 실행 후 뷰(JSP) 실행 전에 실행
		System.out.println("preHandle!");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 뷰(JSP) 실행 후, 요청 처리가 완료된 후 실행
		System.out.println("afterCompletion!");
	}
	
}
