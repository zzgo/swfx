package com.cwfx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cwfx.model.Nav;

public interface NavMapper {
	Nav findOne(@Param(value = "id") Integer id);

	Nav findNavByName(@Param(value = "name") String name);

	List<Nav> findNavByParentId(@Param(value = "parentId") Integer parentId);

	List<Nav> findNavByParentIdAndShow(
			@Param(value = "parentId") Integer parentId,
			@Param(value = "show") Integer show);

	void updateBy(Nav nav);

	List<Nav> findNavByShow(@Param(value = "show") Integer show,
			@Param(value = "parentId") Integer parentId);

	void save(Nav nav);

	void delete(Integer id);

	Nav findNavByLink(String link);

}
