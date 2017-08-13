package com.cwfx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cwfx.model.PageData;
import com.cwfx.model.Recruit;

/**
 * 
 * <b></b>
 * 
 * @Description: TODO类的描述
 * @author 棋 张
 * @version V1.0
 * @ClassName: RecruitMapper类名
 * @Comments:
 * @Creatr Date:2017年7月22日 下午8:23:49
 * @Company:
 * @Copyright: Copyright (c) 2017
 * @版权所有 棋 张
 */
public interface RecruitMapper {
	void save(Recruit recruit);

	List<Recruit> findRecruitByPd(PageData pd);

	int findCountByPd(PageData pd);

	List<Recruit> findRecruitByTime(@Param(value = "endTime") String endTime,
			@Param(value = "startTime") String startTime);

}
