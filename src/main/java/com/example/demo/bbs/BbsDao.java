package com.example.demo.bbs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper //현재 인터페이스의 MyBatis 구현체를 생성하여 스프링에 등록
public interface BbsDao {

	//인자로 전달한 BbsVo의 게시글정보를 테이블에 저장하고, 영향받은 레코드수 반환
	public int insertBbs(BbsVo vo);

	public List<BbsVo> selectBbsList();

	public BbsVo selectBbs(BbsVo vo);

	public int updateBbs(BbsVo vo);

	public int deleteBbs(BbsVo vo);
	
}
