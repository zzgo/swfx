package com.cwfx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cwfx.mapper.NewsMapper;
import com.cwfx.model.News;
import com.cwfx.model.PageData;
import com.cwfx.service.NewsService;

public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsMapper newsMapper;

	@Override
	public void save(News news) {
		newsMapper.save(news);
	}

	@Override
	public void updateBy(News news) {
		newsMapper.updateBy(news);
	}

	@Override
	public List<News> findNewsByPd(PageData pd) {
		return newsMapper.findNewsByPd(pd);
	}

	@Override
	public int findCountByPd(PageData pd) {
		return newsMapper.findCountByPd(pd);
	}

	@Override
	public News findOne(Integer id) {

		return newsMapper.findOne(id);
	}

	@Override
	public void delete(Integer id) {
		newsMapper.delete(id);
	}

}
