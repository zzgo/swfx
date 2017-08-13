package com.cwfx.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.model.Nav;
import com.cwfx.model.News;
import com.cwfx.model.Page;
import com.cwfx.model.PageData;
import com.cwfx.util.Constants;
import com.cwfx.util.HtmlToText;
import com.cwfx.util.IASUtil;
import com.cwfx.util.ImageUploadUtils;
import com.cwfx.util.TimeStampUtil;
import com.cwfx.util.TreeUtil;

@Controller
public class NewsController extends BaseController {
	Map<String, Object> map = new HashMap<String, Object>();

	final static Logger logger = Logger.getLogger(NewsController.class);

	@RequestMapping("admin/newsleft/list")
	ModelAndView newsleft() throws Exception {
		ModelAndView mv = this.getMV();
		List<Nav> navList = null;
		List<Nav> topList = null;
		try {
			// 获取左边的导航 默认show=0 顶级并且 不显示的
			navList = navService.findNavByShow(Constants.ZERO, Constants.ZERO);
			topList = navService.findNavByParentIdAndShow(Constants.ZERO,
					Constants.ONE);
		} catch (Exception e) {
			navList = null;
			topList = null;
		}
		mv.addObject("navList", navList);
		mv.addObject("topList", topList);
		mv.addObject("active", Constants.THREE);
		// 根据点击的栏目显示
		mv.setViewName("admin/news/list");
		return mv;
	}

	//
	@RequestMapping("admin/news/column")
	ModelAndView list() throws Exception {
		ModelAndView mv = this.getMV();
		try {
			int pageNum = Constants.ONE;
			PageData pd = this.getPageData();
			String navId = pd.getString("navId");
			Nav nav = navService.findOne(IASUtil.toInteger(navId));
			mv.addObject("nav", nav);
			if (pd.containsKey("pageNum")) {
				pageNum = IASUtil.toInteger(pd.getString("pageNum"));
				pageNum = pageNum < 1 ? 1 : pageNum;
			}
			int count = newsService.findCountByPd(pd);
			// 0-10 10-10 20-10 3 5
			int countPage = (count + 10 - 1) / 10;
			pd.put("pageSize", Constants.TEN);
			pd.put("pageNum",
					(countPage < pageNum && countPage > 1) ? (countPage - 1)
							* Constants.TEN : (pageNum - 1) * Constants.TEN);
			pd.put("status", Constants.ONE);
			List<News> newList = newsService.findNewsByPd(pd);
			Page<News> page = new Page<News>(newList, pageNum, Constants.TEN,
					count);
			mv.addObject("page", page);
			// 获取左边的导航 默认show=0 顶级并且 不显示的
			List<Nav> navList = navService.findNavByShow(Constants.ZERO,
					Constants.ZERO);
			mv.addObject("navList", navList);
			List<Nav> topList = navService.findNavByParentIdAndShow(
					Constants.ZERO, Constants.ONE);
			mv.addObject("topList", topList);
		} catch (Exception e) {
			mv.addObject("topList", null);
			mv.addObject("navList", null);
			mv.addObject("page", null);
			mv.addObject("nav", null);
		}
		mv.addObject("active", Constants.THREE);
		// 根据点击的栏目显示
		mv.setViewName("admin/news/list");
		return mv;
	}

	@RequestMapping("admin/news/toAdd")
	ModelAndView toAdd() throws Exception {
		ModelAndView mv = this.getMV();
		String navId = this.getRequest().getParameter("navId");
		mv.addObject("navId", navId);
		mv.addObject("action", "admin/news/add");
		mv.setViewName("admin/news/add");
		return mv;
	}

	@RequestMapping("admin/news/add")
	@ResponseBody
	Map<String, Object> add(News news) throws Exception {
		news.setClickCount(Constants.ONE);
		try {
			String content = news.getContent();
			String title = news.getTitle();
			String error = "";
			if (!IASUtil.isBlank(content)) {
				error = "新闻内容不能为空！";
			}
			if (!IASUtil.isBlank(title)) {
				error += "新闻标题不能为空！";
			}
			if (IASUtil.isBlank(error)) {
				map.put("message", error);
				map.put("backUrl", "");
				map.put("status", Constants.N_500);
				return map;
			}
			/**
			 * 编辑人
			 */
			String editor = news.getEditor();
			if (!IASUtil.isBlank(editor)) {
				news.setEditor(getUserInfo().getName());
			}
			/**
			 * 作者
			 */
			String author = news.getAuthor();
			if (!IASUtil.isBlank(author)) {
				news.setAuthor(getUserInfo().getName());
			}
			String summary = news.getSummary();
			if (!IASUtil.isBlank(summary)) {
				String htmlToText = HtmlToText.getText(news.getContent())
						.replaceAll("\\s*", "");
				if (htmlToText.length() <= 50) {
					news.setSummary(htmlToText);
				} else {
					news.setSummary(htmlToText.substring(Constants.ZERO,
							Constants.FIVE * Constants.TEN));
				}

			}
			String time = "";
			String addTime = news.getAddTime();
			if (IASUtil.isBlank(addTime) && (addTime.split(" ").length >= 1)) {
				time = addTime.split(" ")[0];
			} else {
				addTime = TimeStampUtil.getTimestamp();
				time = addTime.split(" ")[0];
				news.setAddTime(addTime);
			}
			time += "-" + TimeStampUtil.getWeekOfDate();
			news.setTimeStr(time);

			/**
			 * aduit = 1 未通过 aduit = 2 通过 audit = 3 不通过
			 */
			news.setAudit(Constants.ONE);
			/**
			 * news = 1 news = 2 垃圾
			 */
			news.setStatus(Constants.ONE);
			newsService.save(news);
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ getUserInfo().getName() + "添加了一个" + news.getTitle()
					+ "新闻");
			map.put("message", "恭喜你，新闻添加成功！");
			map.put("status", Constants.N_200);
			map.put("backUrl", "/admin/news/column?navId=" + news.getNavId());
			PageData pd = new PageData();
			pd.put("audit", Constants.ONE);
			pd.put("status", Constants.ONE);
			this.getRequest()
					.getSession()
					.setAttribute("auditNewsCount",
							newsService.findCountByPd(pd));
		} catch (Exception e) {
			map.put("message", "抱歉，新闻添加失败，请检查你的输入是否合理！");
			map.put("status", Constants.N_500);
			map.put("backUrl", "");
		}
		return map;
	}

	@RequestMapping("admin/news/toEdit")
	ModelAndView toEdit() throws Exception {
		ModelAndView mv = this.getMV();
		String id = this.getRequest().getParameter("id");
		String navId = this.getRequest().getParameter("navId");
		String pageNum = this.getRequest().getParameter("pageNum");
		News news = newsService.findOne(IASUtil.toInteger(id));
		mv.addObject("news", news);
		mv.addObject("navId", navId);
		mv.addObject("pageNum", pageNum);
		mv.addObject("action", "admin/news/edit");
		mv.setViewName("admin/news/add");
		return mv;
	}

	@RequestMapping("admin/news/edit")
	@ResponseBody
	Map<String, Object> edit(News news) throws Exception {
		String pageNum = this.getRequest().getParameter("pageNum");
		try {

			newsService.updateBy(news);
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ getUserInfo().getName() + "修改了一个" + news.getTitle()
					+ "新闻");
			map.put("message", "恭喜你，新闻修改成功！");
			map.put("status", Constants.N_200);
			map.put("backUrl", "/admin/news/column?navId=" + news.getNavId()
					+ "&pageNum=" + pageNum);
		} catch (Exception e) {
			map.put("message", "抱歉，服务繁忙，新闻修改失败！");
			map.put("status", Constants.N_500);
			map.put("backUrl", "");
		}
		return map;
	}

	/**
	 * 删除到垃圾箱
	 */
	@RequestMapping("admin/news/remove")
	@ResponseBody
	Map<String, Object> remove() {
		String id = this.getRequest().getParameter("id");
		try {
			News news = new News();
			news.setId(IASUtil.toInteger(id));
			news.setStatus(Constants.TWO);
			newsService.updateBy(news);
			map.put("status", Constants.N_200);
			map.put("message", "恭喜你，移除至垃圾箱成功!");
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ getUserInfo().getName() + "把新闻《《" + id + "》》移除至垃圾箱");
			PageData pd = new PageData();
			pd.put("audit", Constants.ONE);
			pd.put("status", Constants.ONE);
			this.getRequest()
					.getSession()
					.setAttribute("auditNewsCount",
							newsService.findCountByPd(pd));
		} catch (Exception e) {
			map.put("status", Constants.N_500);
			map.put("message", "抱歉，移除至垃圾箱异常!");
			map.put("backUrl", "");
		}
		return map;
	}

	/**
	 * 审核
	 */
	@RequestMapping("admin/news/auditList")
	ModelAndView auditList() {
		ModelAndView mv = this.getMV();
		mv.addObject("active", Constants.FOUR);
		int pageNum = Constants.ONE;
		PageData pd = this.getPageData();
		/**
		 * 查询待审核的 1
		 */
		pd.put("audit", Constants.ONE);
		pd.put("status", Constants.ONE);
		int count = newsService.findCountByPd(pd);
		if (pd.containsKey("pageNum")) {
			if (IASUtil.isBlank(pd.getString("pageNum"))) {
				pageNum = Integer.parseInt(pd.getString("pageNum"));
				pageNum = pageNum < 1 ? 1 : pageNum;
			}
		}
		int countPage = (count + 10 - 1) / 10;
		pd.put("pageSize", Constants.TEN);
		pd.put("pageNum",
				(countPage < pageNum && countPage > 1) ? (countPage - 1)
						* Constants.TEN : (pageNum - 1) * Constants.TEN);
		List<News> auditNewsList = newsService.findNewsByPd(pd);
		Page<News> page = new Page<News>(auditNewsList, pageNum, Constants.TEN,
				count);
		mv.addObject("page", page);
		mv.addObject("active", Constants.FOUR);
		mv.setViewName("admin/news/auditList");
		return mv;
	}

	/**
	 * 审核页面
	 * 
	 * @return
	 */
	@RequestMapping("admin/news/toAudit")
	ModelAndView toAudit() {
		ModelAndView mv = this.getMV();
		String id = this.getRequest().getParameter("id");
		String pageNum = this.getRequest().getParameter("pageNum");
		News news = newsService.findOne(IASUtil.toInteger(id));
		mv.addObject("news", news);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("admin/news/audit");
		return mv;
	}

	/**
	 * 审核
	 * 
	 * @return
	 */
	@RequestMapping("admin/news/audit")
	@ResponseBody
	Map<String, Object> audit() {
		String id = this.getRequest().getParameter("id");
		String audit = this.getRequest().getParameter("audit");
		String pageNum = this.getRequest().getParameter("pageNum");
		try {
			News news = new News();
			news.setId(IASUtil.toInteger(id));
			news.setAudit(IASUtil.isBlank(audit) ? Integer.parseInt(audit) : 1);
			newsService.updateBy(news);
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ getUserInfo().getName() + "审核了《《" + id + "》》新闻");
			map.put("backUrl", "/admin/news/auditList?pageNum=" + pageNum);
			map.put("status", Constants.N_200);
			map.put("message", "恭喜你，审核成功！");
			PageData pd = new PageData();
			pd.put("audit", Constants.ONE);
			pd.put("status", Constants.ONE);
			this.getRequest()
					.getSession()
					.setAttribute("auditNewsCount",
							newsService.findCountByPd(pd));
		} catch (Exception e) {
			map.put("status", Constants.N_500);
			map.put("message", "抱歉，服务器繁忙，审核失败！");
			map.put("backUrl", "");
		}
		return map;
	}

	/**
	 * 垃圾箱
	 */
	@RequestMapping("admin/news/binList")
	ModelAndView binList() {
		ModelAndView mv = this.getMV();
		int pageNum = Constants.ONE;
		PageData pd = this.getPageData();
		pd.put("status", Constants.TWO);
		int count = newsService.findCountByPd(pd);
		if (pd.containsKey("pageNum")) {
			pageNum = Integer.parseInt(pd.getString("pageNum"));
			pageNum = pageNum < 1 ? 1 : pageNum;
		}
		int countPage = (count + 10 - 1) / 10;
		pd.put("pageSize", Constants.TEN);
		pd.put("pageNum",
				(countPage < pageNum && countPage > 1) ? (countPage - 1)
						* Constants.TEN : (pageNum - 1) * Constants.TEN);
		List<News> auditNewsList = newsService.findNewsByPd(pd);
		Page<News> page = new Page<News>(auditNewsList, pageNum, Constants.TEN,
				count);
		mv.addObject("page", page);
		mv.addObject("active", Constants.SEVEN);
		mv.addObject("admin/news/binList");
		return mv;
	}

	/**
	 * 删除或还原
	 */
	@RequestMapping("admin/news/drNew")
	@ResponseBody
	Map<String, Object> drNew() {
		String id = this.getRequest().getParameter("id");
		String sta = this.getRequest().getParameter("status");
		int status = IASUtil.isBlank(sta) ? Integer.parseInt(sta)
				: Constants.TWO;
		try {

			if (status == Constants.ONE) {
				News news = new News();
				news.setId(IASUtil.toInteger(id));
				news.setStatus(Constants.ONE);
				newsService.updateBy(news);
				map.put("status", Constants.N_200);
				map.put("message", "恭喜你，新闻还原成功!");
				logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
						+ getUserInfo().getName() + "还原了《《" + id + "》》新闻");
				PageData pd = new PageData();
				pd.put("audit", Constants.ONE);
				pd.put("status", Constants.ONE);
				this.getRequest()
						.getSession()
						.setAttribute("auditNewsCount",
								newsService.findCountByPd(pd));
			} else if (status == Constants.TWO) {
				newsService.delete(IASUtil.toInteger(id));
				map.put("status", Constants.N_200);
				map.put("message", "恭喜你，彻底删除成功!");
				logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
						+ getUserInfo().getName() + "删除了《《" + id + "》》新闻");
			}
		} catch (Exception e) {
			map.put("status", Constants.N_500);
			map.put("message", "抱歉，新闻还原或删除异常!");
			map.put("backUrl", "");
		}
		return map;
	}

	/**
	 * 预览
	 */
	@RequestMapping("admin/news/preLook")
	ModelAndView prevLook(News news) {
		ModelAndView mv = this.getMV();
		/**
		 * 新闻详情
		 */
		mv.addObject("news", news);
		/**
		 * 1.导航栏
		 */
		List<Nav> navList = navService.findNavByParentId(0);
		mv.addObject("navList", navList);

		/**
		 * 对应栏目
		 */
		Nav nav = navService.findOne(news.getNavId());
		mv.addObject("nav", nav);
		/*
		 * 通知公告
		 */
		PageData pd = new PageData();
		Nav tzgg = navService.findNavByName("通知公告");
		pd.put("pageNum", 0);
		pd.put("pageSize", 5);
		pd.put("navId", tzgg.getId());
		List<News> tzggList = newsService.findNewsByPd(pd);
		mv.addObject("tzgghList", tzggList);
		mv.setViewName("template/list/detail");
		return mv;
	}

	/***
	 * 图片上传
	 * 
	 * @throws IOException
	 * @throws IllegalStateException
	 * 
	 */
	@RequestMapping("admin/news/upload")
	@ResponseBody
	Map<String, Object> upload(@RequestParam("image") MultipartFile image)
			throws IllegalStateException, IOException {
		try {
			String name = image.getOriginalFilename();
			String suffix = name.substring(name.lastIndexOf(".") + 1);
			String suffixs = "gif,jpg,jpeg,png,bmp";
			if (suffixs.contains(suffix)) {
				map = ImageUploadUtils.saveImg(image, this.getRequest());
			} else {
				map.put("message", "上传的图片格式有误，请重新上传！");
				map.put("status", Constants.N_500);
			}
			return map;
		} catch (Exception e) {
			map.put("backImgUrl", "");
			map.put("status", Constants.N_500);
			map.put("message", "服务器繁忙，上传图片失败！");
			return map;
		}
	}

}
