package com.blt.app.applbasic.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blt.app.applbasic.mapper.ApplBasicMapper;
import com.blt.app.applbasic.service.ApplBasicService;
import com.blt.app.applbasic.vo.ApplBasicInfoVo;

@Service
public class ApplBasicServiceImpl implements ApplBasicService{
	
	@Autowired
	private ApplBasicMapper applBasicMapper;

	@Override
	public List<ApplBasicInfoVo> selectApplBasicInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplBasicInfo(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplDetailInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplDetailInfo(vo);
	}
	
	@Override
	public List<ApplBasicInfoVo> selectApplFileInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplFileInfo(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplCheatKeyInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplCheatKeyInfo(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplRelatedInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplRelatedInfo(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplRelatedSubInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplRelatedSubInfo(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplEmailInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplEmailInfo(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplSimpleInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplSimpleInfo(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplBreakerInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplBreakerInfo(vo);
	}

	@Override
	public int insertEmailLog(ApplBasicInfoVo vo) {
		return applBasicMapper.insertEmailLog(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplTimeTestInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplTimeTestInfo(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplNullInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplNullInfo(vo);
	}

	@Override
	public List<ApplBasicInfoVo> selectApplFinalInfo(ApplBasicInfoVo vo) {
		return applBasicMapper.selectApplFinalInfo(vo);
	}

}
