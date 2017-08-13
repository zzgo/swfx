package com.cwfx.controller.before;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.controller.BaseController;
import com.cwfx.model.Mail;
import com.cwfx.model.Nav;
import com.cwfx.model.News;
import com.cwfx.model.Page;
import com.cwfx.model.PageData;
import com.cwfx.util.Constants;
import com.cwfx.util.IASUtil;

/**
 * 
 * <b></b>
 * 
 * @Description: 栏目链接控制
 * @author 棋 张
 * @version V1.0
 * @ClassName: ColumnController类名
 * @Comments:
 * @Creatr Date:2017年7月31日 下午10:23:17
 * @Company:
 * @Copyright: Copyright (c) 2017
 * @版权所有 棋 张
 */
@Controller
public class ColumnController extends BaseController {
	@RequestMapping("/list/{link}-{pn}.html")
	ModelAndView link(@PathVariable(value = "link") String link,
			@PathVariable(value = "pn") String pn) {
		ModelAndView mv = this.getMV();
		PageData pd0 = new PageData();
		pd0.put("pageNum", 0);
		/**
		 * 9.学校概况
		 */
		Nav xxgk = navService.findNavByName("学校概况");
		pd0.put("pageSize", 5);
		pd0.put("navId", xxgk.getId());
		List<News> xxgkList = newsService.findNewsByPd(pd0);
		mv.addObject("xxgkList", xxgkList);
		/**
		 * 9.学生发展
		 */
		Nav xsfz = navService.findNavByName("学术发展");
		pd0.put("pageSize", 5);
		pd0.put("navId", xsfz.getId());
		List<News> xsfzList = newsService.findNewsByPd(pd0);
		mv.addObject("xsfzList", xsfzList);
		/**
		 * 9.入学咨询
		 */
		Nav rxzx = navService.findNavByName("入学咨询");
		pd0.put("pageSize", 5);
		pd0.put("navId", rxzx.getId());
		List<News> rxzxList = newsService.findNewsByPd(pd0);
		mv.addObject("rxzxList", rxzxList);
		String view = "";
		/**
		 * 1.导航栏
		 */
		List<Nav> navList = navService.findNavByParentId(0);
		mv.addObject("navList", navList);
		/**
		 * 当前栏目
		 */
		Nav nav0 = navService.findNavByLink(link);
		mv.addObject("nav", nav0);

		/**
		 * 这是一个栏目 >>navId
		 */
		int navId = nav0.getId();
		int pageNum = Constants.ONE;
		PageData pd = new PageData();
		pd.put("pageNum", pn);
		pd.put("navId", navId);
		pd.put("audit", Constants.TWO);
		pd.put("status", Constants.ONE);
		mv.addObject("nav", nav0);
		if (pd.containsKey("pageNum")) {
			pageNum = IASUtil.toInteger(pd.getString("pageNum"));
			pageNum = pageNum < 1 ? 1 : pageNum;
		}
		if (nav0.getName().equals("校长信箱")) {
			view = "template/mail/list";
			// 进入校长信箱
			pd.put("pageNum", pageNum);
			return mailList(mv, pd, pageNum);
		} else if (nav0.getName().equals("教师招聘")) {
			mv.setViewName("template/recruit/add");
			return mv;
		}
		int ps = Constants.TEN;
		int tempId = nav0.getTempId();
		if (tempId == 1) {
			view = "template/list/list";
		} else if (tempId == 2) {
			view = "template/list/listImg";
			ps = Constants.FIVE;
		}
		mv.addObject("page", getPage(pd, pageNum, ps));
		/**
		 * 栏目
		 * 
		 */
		/*
		 * 通知公告
		 */
		PageData pd2 = new PageData();
		Nav tzgg = navService.findNavByName("通知公告");
		pd2.put("pageNum", 0);
		pd2.put("pageSize", 5);
		pd2.put("navId", tzgg.getId());
		List<News> tzggList = newsService.findNewsByPd(pd2);
		mv.addObject("tzgghList", tzggList);

		mv.setViewName(view);
		return mv;
	}

	public Page<News> getPage(PageData pd, int pageNum, int ps) {
		int count = newsService.findCountByPd(pd);
		// 0-10 10-10 20-10 3 5
		int countPage = (count + 10 - 1) / 10;
		pd.put("pageSize", ps);
		pd.put("pageNum",
				(countPage < pageNum && countPage > 1) ? (countPage - 1) * ps
						: (pageNum - 1) * ps);
		pd.put("status", Constants.ONE);
		List<News> newList = newsService.findNewsByPd(pd);
		for (News news : newList) {
			String[] time = news.getTimeStr().split("-");
			news.setOneTime(time[0] + "-" + time[1] + "-" + time[2]);
		}
		Page<News> page = new Page<News>(newList, pageNum, ps, count);
		return page;
	}

	@RequestMapping("/detail/{id}.html")
	ModelAndView link(@PathVariable(value = "id") Integer id) {
		ModelAndView mv = this.getMV();
		try {

			/**
			 * 1.导航栏
			 */
			List<Nav> navList = navService.findNavByParentId(0);
			mv.addObject("navList", navList);
			/**
			 * 新闻详情
			 */
			News news = newsService.findOne(id);
			mv.addObject("news", news);
			// 更新点击量
			News nw = new News();
			nw.setId(news.getId());
			nw.setClickCount(news.getClickCount() + 1);
			newsService.updateBy(nw);
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

			/**
			 * 9.学校概况
			 */
			Nav xxgk = navService.findNavByName("学校概况");
			pd.put("pageSize", 5);
			pd.put("navId", xxgk.getId());
			List<News> xxgkList = newsService.findNewsByPd(pd);
			mv.addObject("xxgkList", xxgkList);
			/**
			 * 9.学生发展
			 */
			Nav xsfz = navService.findNavByName("学术发展");
			pd.put("pageSize", 5);
			pd.put("navId", xsfz.getId());
			List<News> xsfzList = newsService.findNewsByPd(pd);
			mv.addObject("xsfzList", xsfzList);
			/**
			 * 9.入学咨询
			 */
			Nav rxzx = navService.findNavByName("入学咨询");
			pd.put("pageSize", 5);
			pd.put("navId", rxzx.getId());
			List<News> rxzxList = newsService.findNewsByPd(pd);
			mv.addObject("rxzxList", rxzxList);
		} catch (Exception e) {

		}
		mv.setViewName("template/list/detail");
		return mv;
	}

	/**
	 * 校长信箱
	 * 
	 */
	ModelAndView mailList(ModelAndView mv, PageData pd, int pn) {
		pd.put("show", Constants.TWO);
		int pageNum = pn;
		int count = mailService.getCountByPd(pd);
		// 0-10 10-10 20-10 3 5
		int countPage = (count + 10 - 1) / 10;
		pd.put("pageSize", Constants.FIVE);
		pd.put("pageNum",
				(countPage < pageNum && countPage > 1) ? (countPage - 1)
						* Constants.FIVE : (pageNum - 1) * Constants.FIVE);
		List<Mail> mailList = mailService.findMailByPd(pd);
		for (Mail mail : mailList) {
			String[] time = mail.getDate().split(" ")[0].split("-");
			mail.setThreeDay(time[2]);
			mail.setThreeMonth(time[1]);
			mail.setThreeYear(time[0]);
		}
		Page<Mail> page = new Page<Mail>(mailList, pageNum, Constants.FIVE,
				count);
		mv.addObject("page", page);
		mv.setViewName("template/mail/list");
		return mv;
	}
}
