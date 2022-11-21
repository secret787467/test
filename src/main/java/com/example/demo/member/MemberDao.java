package com.example.demo.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper //이 인터페이스의 MyBatis 구현체를 자동 생성하여 스프링에 등록
public interface MemberDao {
	public int insertMember(MemberVo vo);
	public List<MemberVo> selectMemberList();
	public MemberVo selectMember(MemberVo vo);
	public int updateMember(MemberVo vo);
	public int deleteMember(MemberVo vo);
	public MemberVo selectloginMember(MemberVo vo);
}
