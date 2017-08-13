package com.cwfx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cwfx.mapper.RecruitMapper;
import com.cwfx.model.PageData;
import com.cwfx.model.Recruit;
import com.cwfx.service.RecruitService;

public class RecruitServiceImpl implements RecruitService {
	@Autowired
	private RecruitMapper recruitMapper;

	@Override
	public void save(Recruit recruit) {
		recruitMapper.save(recruit);
	}

	@Override
	public List<Recruit> findRecruitByPd(PageData pd) {
		return recruitMapper.findRecruitByPd(pd);
	}

	@Override
	public int findCountByPd(PageData pd) {
		return recruitMapper.findCountByPd(pd);
	}

	@Override
	public List<Recruit> findRecruitByTime(String endTime, String startTime) {
		return recruitMapper.findRecruitByTime(endTime, startTime);
	}

}
