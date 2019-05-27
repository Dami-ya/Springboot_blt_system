package com.blt.app.applbasic.service;

import java.util.List;

import com.blt.app.applbasic.vo.ApplBasicInfoVo;

public interface ApplBasicService {
		
	public List<ApplBasicInfoVo> selectApplBasicInfo(ApplBasicInfoVo vo);
	public List<ApplBasicInfoVo> selectApplDetailInfo(ApplBasicInfoVo vo);
	public List<ApplBasicInfoVo> selectApplFileInfo(ApplBasicInfoVo vo);
	public List<ApplBasicInfoVo> selectApplCheatKeyInfo(ApplBasicInfoVo vo);
	public List<ApplBasicInfoVo> selectApplRelatedInfo(ApplBasicInfoVo vo);
	public List<ApplBasicInfoVo> selectApplRelatedSubInfo(ApplBasicInfoVo vo);
	public List<ApplBasicInfoVo> selectApplEmailInfo(ApplBasicInfoVo vo);
	public List<ApplBasicInfoVo> selectApplSimpleInfo(ApplBasicInfoVo vo);
	public List<ApplBasicInfoVo> selectApplBreakerInfo(ApplBasicInfoVo vo);
	
	public List<ApplBasicInfoVo> selectApplFinalInfo(ApplBasicInfoVo vo);
	public List<ApplBasicInfoVo> selectApplNullInfo(ApplBasicInfoVo vo);
	
	public List<ApplBasicInfoVo> selectApplTimeTestInfo(ApplBasicInfoVo vo);
	public int insertEmailLog(ApplBasicInfoVo vo);
}
