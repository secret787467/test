package com.example.demo.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service //이 클래스의 객체를 생성하여 서비스 계층의 역할을 하는 객체로서 스프링에 등록 
public class MemberServiceImpl implements MemberService {
	@Autowired //스프링에 등록된 객체들 중 이 변수의 타입(MemberDao)에 맞는 객체를 자동 주입(저장)
	private MemberDao memberDao;
	
	@Override
	public int insertMember(MemberVo vo) {
		return memberDao.insertMember(vo);
	}

	@Override
	public List<MemberVo> selectMemberList() {
		return memberDao.selectMemberList();
	}

	@Override
	public MemberVo selectMember(MemberVo vo) {
		return memberDao.selectMember(vo);
	}

	@Override
	public int updateMember(MemberVo vo) {
		return memberDao.updateMember(vo);
	}

	@Override
	public int deleteMember(MemberVo vo) {
		return memberDao.deleteMember(vo);
	}

	@Override
	public MemberVo selectloginMember(MemberVo vo) {
		// TODO Auto-generated method stub
		return memberDao.selectloginMember(vo);
	}

}





