package com.cwfx.mapper;

import java.util.List;

import com.cwfx.model.News;
import com.cwfx.model.PageData;

public interface NewsMapper {
	void save(News news);

	void updateBy(News news);

	List<News> findNewsByPd(PageData pd);

	int findCountByPd(PageData pd);

	News findOne(Integer id);

	void delete(Integer id);
}
