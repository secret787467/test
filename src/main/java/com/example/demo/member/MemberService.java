package com.example.demo.member;

import java.util.List;

public interface MemberService {
	public int insertMember(MemberVo vo);
	public List<MemberVo> selectMemberList();
	public MemberVo selectMember(MemberVo vo);
	public int updateMember(MemberVo vo);
	public int deleteMember(MemberVo vo);
	public MemberVo selectloginMember(MemberVo vo);
}
