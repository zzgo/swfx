package com.cwfx.service;

import java.util.List;

import com.cwfx.model.News;
import com.cwfx.model.PageData;

public interface NewsService {
	void save(News news);

	void updateBy(News news);

	List<News> findNewsByPd(PageData pd);

	int findCountByPd(PageData pd);

	News findOne(Integer id);

	void delete(Integer id);

}
