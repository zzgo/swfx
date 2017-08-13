package com.cwfx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cwfx.mapper.NavMapper;
import com.cwfx.model.Nav;
import com.cwfx.service.NavService;

public class NavServiceImpl implements NavService {
	@Autowired
	private NavMapper navMapper;

	@Override
	public Nav findOne(Integer id) {

		return navMapper.findOne(id);
	}

	@Override
	public Nav findNavByName(String name) {
		return navMapper.findNavByName(name);
	}

	@Override
	public List<Nav> findNavByParentId(Integer parentId) {
		List<Nav> topList = navMapper.findNavByParentId(parentId);
		for (Nav nav : topList) {
			nav.setChildren(findNavByParentId(nav.getId()));
		}
		return topList;
	}

	/**
	 * 返回某一级
	 */
	@Override
	public List<Nav> findOneNavByParentId(Integer parentId) {
		return navMapper.findNavByParentId(parentId);
	}

	@Override
	public void updateBy(Nav nav) {
		navMapper.updateBy(nav);
	}

	@Override
	public List<Nav> findNavByShow(Integer show, Integer parentId) {
		return navMapper.findNavByShow(show, parentId);
	}

	@Override
	public void save(Nav nav) {
		navMapper.save(nav);
	}

	@Override
	public void delete(Integer id) {
		navMapper.delete(id);
	}

	@Override
	public List<Nav> findNavByParentIdAndShow(Integer parentId, Integer show) {
		List<Nav> topList = navMapper.findNavByParentIdAndShow(parentId, show);
		for (Nav nav : topList) {
			nav.setChildren(findNavByParentIdAndShow(nav.getId(), show));
		}
		return topList;
	}

	@Override
	public Nav findNavByLink(String link) {
		return navMapper.findNavByLink(link);
	}
}
