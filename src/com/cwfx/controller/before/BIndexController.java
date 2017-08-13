package com.cwfx.controller.before;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.controller.BaseController;
import com.cwfx.model.Nav;
import com.cwfx.model.News;
import com.cwfx.model.PageData;
import com.cwfx.util.Constants;
import com.cwfx.util.TimeStampUtil;

@Controller
public class BIndexController extends BaseController {
	@RequestMapping("index.html")
	ModelAndView index() {
		ModelAndView mv = this.getMV();
		/**
		 * 1.导航栏
		 */
		List<Nav> navList = navService.findNavByParentId(0);
		mv.addObject("navList", navList);
		/**
		 * 2.轮播图
		 */

		Nav lbt = navService.findNavByName("轮播图");
		PageData pd = new PageData();
		pd.put("audit", Constants.TWO);
		pd.put("status", Constants.ONE);
		pd.put("pageNum", 0);
		pd.put("pageSize", 5);
		pd.put("navId", lbt.getId());
		List<News> lbtList = newsService.findNewsByPd(pd);
		mv.addObject("lbtList", lbtList);
		/**
		 * 3.校园头条
		 */
		Nav xygg = navService.findNavByName("校园头条");
		mv.addObject("xygg", xygg);
		pd.put("pageSize", 3);
		pd.put("navId", xygg.getId());
		List<News> xyggList = newsService.findNewsByPd(pd);
		for (News news : xyggList) {
			String[] time = news.getTimeStr().split("-");
			news.setThreeDay(time[2]);
			news.setThreeMonth(time[1]);
			news.setThreeYear(time[0]);
		}
		mv.addObject("xyggList", xyggList);
		/**
		 * 4.新闻资讯
		 */
		Nav xwzx = navService.findNavByName("新闻资讯");
		mv.addObject("xwzx", xwzx);
		pd.put("pageSize", 6);
		pd.put("navId", xwzx.getId());
		List<News> xwzxList = newsService.findNewsByPd(pd);
		for (News news : xwzxList) {
			String[] time = news.getTimeStr().split("-");
			news.setThreeDay(time[2]);
			news.setThreeMonth(time[1]);
			news.setThreeYear(time[0]);
		}
		mv.addObject("xwzxList", xwzxList);
		/**
		 * 5.经典美读
		 */
		Nav jdmd = navService.findNavByName("经典美读");
		mv.addObject("jdmd", jdmd);
		pd.put("pageSize", 7);
		pd.put("navId", jdmd.getId());
		List<News> jdmdList = newsService.findNewsByPd(pd);
		for (News news : jdmdList) {
			String[] time = news.getTimeStr().split("-");
			news.setThreeDay(time[2]);
			news.setThreeMonth(time[1]);
			news.setThreeYear(time[0]);
		}
		mv.addObject("jdmdList", jdmdList);
		/**
		 * 6.校本课程
		 */
		Nav xbkc = navService.findNavByName("校本课程");
		mv.addObject("xbkc", xbkc);
		pd.put("pageSize", 4);
		pd.put("navId", xbkc.getId());
		List<News> xbkcList = newsService.findNewsByPd(pd);
		for (News news : xbkcList) {
			String[] time = news.getTimeStr().split("-");
			news.setThreeDay(time[2]);
			news.setThreeMonth(time[1]);
			news.setThreeYear(time[0]);
		}
		mv.addObject("xbkcList", xbkcList);
		/**
		 * 7.学生发展中心
		 */
		Nav xsfzzx = navService.findNavByName("学生发展中心");
		pd.put("pageSize", 3);
		pd.put("navId", xsfzzx.getId());
		List<News> xsfzzxList = newsService.findNewsByPd(pd);
		for (News news : xsfzzxList) {
			String[] time = news.getTimeStr().split("-");
			news.setThreeDay(time[2]);
			news.setThreeMonth(TimeStampUtil.getMonthOfDate(Integer
					.parseInt(time[1])));
			news.setThreeWeek(time[3]);
		}
		mv.addObject("xsfzzxList", xsfzzxList);
		/**
		 * 8.国旗下讲话
		 */
		Nav gqxjh = navService.findNavByName("国旗下讲话");
		pd.put("pageSize", 2);
		pd.put("navId", gqxjh.getId());
		List<News> gqxjhList = newsService.findNewsByPd(pd);
		mv.addObject("gqxjhList", gqxjhList);

		/**
		 * 9.名师风采
		 */
		Nav msfc = navService.findNavByName("名师风采");
		pd.put("pageSize", 5);
		pd.put("navId", msfc.getId());
		List<News> msfcList = newsService.findNewsByPd(pd);
		mv.addObject("msfcList", msfcList);
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
		/**
		 * 
		 * 翰墨飘香
		 * 
		 */
		Nav hmpx = navService.findNavByName("翰墨飘香");
		mv.addObject("hmpx", hmpx);
		/**
		 * 英语角E
		 */
		Nav yyj = navService.findNavByName("英语角");
		mv.addObject("yyj", yyj);
		mv.setViewName("template/index/index");
		return mv;
	}
}
