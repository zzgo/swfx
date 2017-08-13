package com.cwfx.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.cwfx.model.Nav;

public class TreeUtil {
	/**
	 * 遍历栏目树，把所有的栏目遍历出来放到同一个集合中返回，并且其中所有栏目的名称都修改了，以表示层次。
	 * 
	 * @param topList
	 * @return
	 */
	public static List<Nav> getAllNavs(List<Nav> topList) {
		List<Nav> list = new ArrayList<Nav>();
		walkNavTreeList(topList, "", list);
		return list;
	}

	/**
	 * 遍历栏目树，把遍历出的栏目信息放到指定的集合中
	 * 
	 * @param topList
	 */
	private static void walkNavTreeList(Collection<Nav> topList, String prefix,
			List<Nav> list) {
		for (Nav top : topList) {
			// 顶点
			Nav copy = new Nav(); // 使用副本，因为原对象在Session中
			copy.setId(top.getId());
			copy.setLink(top.getLink());
			copy.setAddTime(top.getAddTime());
			copy.setDescription(top.getDescription());
			copy.setName(top.getName());
			copy.setParentId(top.getParentId());
			copy.setParentName(top.getParentName());
			copy.setTempId(top.getTempId());
			list.add(copy); // 把副本添加到同一个集合中
			// 子树
			walkNavTreeList(top.getChildren(), "", list); // 使用全角的空格
		}
	}
}
