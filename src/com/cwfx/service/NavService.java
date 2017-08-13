package com.cwfx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cwfx.model.Nav;

public interface NavService {
	Nav findOne(Integer id);

	Nav findNavByName(String name);

	List<Nav> findNavByParentId(Integer parentId);

	void updateBy(Nav nav);

	List<Nav> findNavByShow(Integer show, Integer parentId);

	List<Nav> findNavByParentIdAndShow(Integer parentId, Integer show);

	List<Nav> findOneNavByParentId(Integer parentId);

	void save(Nav nav);

	void delete(Integer id);

	Nav findNavByLink(String link);
}
