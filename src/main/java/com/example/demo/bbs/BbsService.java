package com.example.demo.bbs;

import java.util.List;

public interface BbsService {
	public int insertBbs(BbsVo vo);

	public List<BbsVo> selectBbsList();

	public BbsVo selectBbs(BbsVo vo);

	public int updateBbs(BbsVo vo);

	public int deleteBbs(BbsVo vo);
}
