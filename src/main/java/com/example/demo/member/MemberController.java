package com.example.demo.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(path = "/member/edit.do", method = RequestMethod.GET)
	public String editform( MemberVo vo, Model model) {
		MemberVo mvo = memberService.selectMember(vo);
		model.addAttribute("memVo", mvo);
		return "member/edit";
	}
	
	@RequestMapping(path = "/member/edit.do", method = RequestMethod.POST)
	public String edit( MemberVo vo ) {
		int num = memberService.updateMember(vo);
		System.out.println( num + "개의 레코드 변경" );
		return "redirect:/member/list.do";
		// /member/list.do 로 이동하라는 명령을 담은 응답을 전송 
	}
	
	@RequestMapping(path = "/member/del.do", method = RequestMethod.GET)
	public String del( MemberVo vo ) {
		int num = memberService.deleteMember(vo);
		System.out.println( num + "개의 레코드 삭제" );
		return "redirect:/member/list.do";
		// /member/list.do 로 이동하라는 명령을 담은 응답을 전송 
	}
	
	
	@RequestMapping(path = "/member/add.do", method = RequestMethod.GET)
	public String addform() {
		return "member/add";
	}
	
	@RequestMapping(path = "/member/add.do", method = RequestMethod.POST)
	public String add( MemberVo vo ) {
		int num = memberService.insertMember(vo);
		System.out.println( num + "개의 레코드 추가" );
		return "redirect:/member/list.do";
		// /member/list.do 로 이동하라는 명령을 담은 응답을 전송 
	}
	
	@RequestMapping("/member/list.do")
	public String list( Model model ) {
		//데이터베이스에 있는 회원정보를 조회하여 list 변수에 저장
		List<MemberVo> list = memberService.selectMemberList();
		//list 변수의 데이터를 모델에 "memList"라는 이름으로 저장
		//JSP 파일에서 ${memList} 표현으로 list 변수의 데이터를 사용 가능
		model.addAttribute("memList", list);  //${memList}
		///WEB-INF/views/member/list.jsp 파일로 이동(실행)
		return "member/list";
	}
	
	@RequestMapping(path = "/member/login.do", method = RequestMethod.GET)
	public String loginform() {
		return "member/login";
	}
	
	@RequestMapping(path = "/member/mint.do", method = RequestMethod.GET)
	public String mint() {
		return "member/mint";
	}
	
	@RequestMapping(path = "/member/roadmap.do", method = RequestMethod.GET)
	public String roadmap() {
		return "member/roadmap";
	}
	
	@RequestMapping(path = "/member/benefit.do", method = RequestMethod.GET)
	public String benefit() {
		return "member/benefit";
	}
	
	@RequestMapping(path = "/member/faq.do", method = RequestMethod.GET)
	public String faq() {
		return "member/faq";
	}
	
	@RequestMapping(path = "/member/login.do", method = RequestMethod.POST)
	public String login( MemberVo vo, HttpSession session) {
		// 사용자가 입력한 아이디, 비밀번호와 일치하는 회원의 정보를 조회
		MemberVo mvo = memberService.selectloginMember(vo);
		if (mvo == null) { // 일치하는 회원이 없는 경우 == 로그인 실패
			return "member/login"; // 다시 로그인 화면 출력(하는 JSP 실행)
		}
		// 일치하는 회원이 있는 경우 == 로그인성공
		// 사용자(클라이언트, 웹브라우저)별로 1개씩 생성되어 유지되는 세션객체에 로그인 기록을 저장
		// 로그인한 사용자의 정보를 "loginuser"라는 이름으로 세션에 저장
		session.setAttribute("loginuser", mvo);
		return "redirect:/member/list.do"; // 게시판 목록 화면으로 이동
	} 
	
	@RequestMapping(path = "/member/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
//		session.setAttribute("loginuser", null); // 속성값으로 null을 저장
//		session.removeAttribute("loginuser"); // 속성을 제거
		session.invalidate(); // 세션객체 전체를 삭제(후 재생성)
		return "redirect:/member/login.do"; // 로그인 화면으로 이동
	}
	
}





