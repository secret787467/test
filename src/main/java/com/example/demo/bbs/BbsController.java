package com.example.demo.bbs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.member.MemberVo;

@Controller
public class BbsController {
	@Autowired //스프링에 등록된 객체들 중 BbsService 타입의 객체를 이 변수에 주입
	private BbsService bbsService;
	
	@RequestMapping(path = "/bbs/list.do", method = RequestMethod.GET)
	public String list( Model model ) {
		//데이터베이스의 게시글정보를 조회하여 list 변수에 저장
		List<BbsVo> list = bbsService.selectBbsList();
		//list 변수의 데이터를 모델에 "bbsList"라는 이름으로 저장
		//JSP에서 ${bbsList}라는 이름으로 list 변수의 데이터를 사용 가능
		model.addAttribute("bbsList", list); 
		///WEB-INF/views/bbs/list.jsp 파일로 이동(실행)
		return "bbs/list";
	}
	
	@RequestMapping(path = "/bbs/add.do", method = RequestMethod.GET)
	public String addform() {
		return "bbs/add";
	}
	
	@RequestMapping(path = "/bbs/add.do", method = RequestMethod.POST)
	public String add( BbsVo vo, HttpSession session ) {
		MemberVo mvo = (MemberVo)session.getAttribute("loginuser");
		if (mvo==null) { // 로그인한 적이 없는 사용자인 경우
			return "redirect:/member/login.do"; // 로그인 화면으로 이동
		}
		
		int num = bbsService.insertBbs(vo); // 로그인한 사용자일 경우
		System.out.println( num + "개의 레코드 추가" );
		return "redirect:/bbs/list.do";
		// "/bbs/list.do"로 이동하라는 명령을 담은 응답을 브라우저에게 전송
	}
	
	@RequestMapping(path = "/bbs/edit.do", method = RequestMethod.GET)
	public String editform( BbsVo vo, Model model) {
		BbsVo mvo = bbsService.selectBbs(vo);
		model.addAttribute("bbsVo", mvo);
		return "bbs/edit";
	}
	
	@RequestMapping(path = "/bbs/edit.do", method = RequestMethod.POST)
	public String edit( BbsVo vo ) {
		int num = bbsService.updateBbs(vo);
		System.out.println( num + "개의 레코드 변경" );
		return "redirect:/bbs/list.do";
		// "/bbs/list.do"로 이동하라는 명령을 담은 응답을 브라우저에게 전송
	}
	
	@RequestMapping(path = "/bbs/del.do", method = RequestMethod.GET)
	public String del( BbsVo vo ) {
		int num = bbsService.deleteBbs(vo);
		System.out.println( num + "개의 레코드 삭제" );
		return "redirect:/bbs/list.do";
		// "/bbs/list.do"로 이동하라는 명령을 담은 응답을 브라우저에게 전송
	}
	
}





