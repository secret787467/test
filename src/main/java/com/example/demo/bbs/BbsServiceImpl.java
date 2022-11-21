package com.example.demo.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service //서비스 계층의 역할을 수행하는 객체로서 스프링에 등록
public class BbsServiceImpl implements BbsService {
	@Autowired //스프링에 등록된 객체들중 이 변수에 맞는 객체를 주입(저장)
	private BbsDao bbsDao;

	@Override
	public int insertBbs(BbsVo vo) {
		return bbsDao.insertBbs(vo);
	}

	@Override
	public List<BbsVo> selectBbsList() {
		return bbsDao.selectBbsList();
	}

	@Override
	public BbsVo selectBbs(BbsVo vo) {
		return bbsDao.selectBbs(vo);
	}

	@Override
	public int updateBbs(BbsVo vo) {
		return bbsDao.updateBbs(vo);
	}

	@Override
	public int deleteBbs(BbsVo vo) {
		return bbsDao.deleteBbs(vo);
	}

}





