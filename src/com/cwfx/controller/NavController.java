package com.cwfx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.model.Nav;
import com.cwfx.util.Constants;
import com.cwfx.util.IASUtil;
import com.cwfx.util.TimeStampUtil;
import com.cwfx.util.TreeUtil;

/**
 * 
 * @ClassName NavController.java
 * @Description: 栏目管理(这里用一句话描述这个类的作用)
 * @author 张棋
 * @company
 * @time 2017年7月31日
 */
@Controller
public class NavController extends BaseController {
	final static Logger logger = Logger.getLogger(NavController.class);
	Map<String, Object> map = new HashMap<String, Object>();

	// 整个树结构
	@RequestMapping("admin/nav/list")
	ModelAndView list() {
		ModelAndView mv = this.getMV();
		/**
		 * 默认顶级ID=0
		 */
		List<Nav> topList = navService.findNavByParentId(Constants.ZERO);
		List<Nav> navList = TreeUtil.getAllNavs(topList);
		mv.addObject("navList", navList);
		mv.addObject("active", Constants.TWO);
		mv.setViewName("admin/nav/list");
		return mv;
	}

	@RequestMapping("admin/nav/toAdd")
	ModelAndView toAdd() {
		// 模板只有两种，写死了
		// 获取顶级栏目，
		List<Nav> topList = navService.findOneNavByParentId(Constants.ZERO);
		ModelAndView mv = this.getMV();
		mv.addObject("topList", topList);
		mv.addObject("action", "admin/nav/add");
		mv.setViewName("admin/nav/add");
		mv.addObject("active", Constants.TWO);
		return mv;
	}

	@RequestMapping("admin/nav/add")
	@ResponseBody
	Map<String, Object> add(Nav nav) {
		int id = nav.getParentId();
		/**
		 * 判断空的情况
		 * 
		 */
		String name = nav.getName();
		String link = nav.getLink();
		String error = "";
		if (!IASUtil.isBlank(name)) {
			error = "栏目名称不能为空";
		}
		if (IASUtil.isBlank(error)) {
			map.put("message", error);
			map.put("status", Constants.N_500);
			return map;
		}
		if (!IASUtil.isBlank(link)) {
			nav.setLink(TimeStampUtil.getTimestampStr());
		}
		try {
			Nav n = navService.findOne(id);
			nav.setParentName(n != null ? n.getName() : "顶级栏目");
			nav.setAddTime(TimeStampUtil.getTimestamp());
			int order = nav.getOrder();
			if (order == 0) {
				order = 999;
			}
			nav.setOrder(order);
			navService.save(nav);
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ getUserInfo().getName() + "添加了一个<< " + nav.getName()
					+ " >>栏目");
			map.put("message", "恭喜你，栏目添加成功！");
			map.put("backUrl", "/admin/nav/list");
			map.put("status", Constants.N_200);
		} catch (Exception e) {
			map.put("message", "抱歉，栏目添加失败！");
			map.put("backUrl", "/admin/nav/list");
			map.put("status", Constants.N_500);
		}
		return map;
	}

	@RequestMapping("admin/nav/toEdit")
	ModelAndView toEdit() {
		// 模板只有两种，写死了
		// 获取顶级栏目，
		String id = this.getRequest().getParameter("id");
		Nav nav = navService.findOne(IASUtil.toInteger(id));
		ModelAndView mv = this.getMV();
		List<Nav> topList = navService.findOneNavByParentId(Constants.ZERO);
		mv.addObject("topList", topList);
		mv.addObject("nav", nav);
		mv.addObject("action", "admin/nav/edit");
		mv.setViewName("admin/nav/add");
		mv.addObject("active", Constants.TWO);
		return mv;
	}

	@RequestMapping("admin/nav/edit")
	@ResponseBody
	Map<String, Object> edit(Nav nav) {
		try {
			String name = nav.getName();
			String error = "";
			if (!IASUtil.isBlank(name)) {
				error = "栏目名称不能为空";
			}
			if (IASUtil.isBlank(error)) {
				map.put("message", error);
				map.put("status", Constants.N_500);
				return map;
			}
			Nav n = navService.findOne(nav.getParentId());
			nav.setParentName(n != null ? n.getName() : "顶级栏目");
			navService.updateBy(nav);
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ getUserInfo().getName() + "修改了一个" + nav.getName() + "栏目");
			map.put("backUrl", "/admin/nav/list");
			map.put("message", "恭喜你，栏目修改成功！");
			map.put("status", Constants.N_200);
		} catch (Exception e) {
			map.put("backUrl", "/admin/nav/list");
			map.put("message", "抱歉，服务器繁忙，栏目修改失败！");
			map.put("status", Constants.N_200);
		}
		return map;
	}

	@RequestMapping("admin/nav/delete")
	@ResponseBody
	Map<String, Object> delete() {
		// 考虑删除的父级栏目
		String id = this.getRequest().getParameter("id");
		Nav nav = navService.findOne(IASUtil.toInteger(id));
		navService.delete(IASUtil.toInteger(id));
		map.put("status", Constants.N_200);
		map.put("message", "恭喜你，删除栏目成功!");
		String name = nav != null ? nav.getName() : "空";
		logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
				+ getUserInfo().getName() + "删除了一个" + name + "栏目");
		return map;
	}
}
