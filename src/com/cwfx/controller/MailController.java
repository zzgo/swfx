package com.cwfx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.model.Mail;
import com.cwfx.model.Nav;
import com.cwfx.model.News;
import com.cwfx.model.Page;
import com.cwfx.model.PageData;
import com.cwfx.util.Constants;
import com.cwfx.util.IASUtil;
import com.cwfx.util.TimeStampUtil;

@Controller
public class MailController extends BaseController {
	Map<String, Object> map = new HashMap<String, Object>();

	final static Logger logger = Logger.getLogger(MailController.class);

	@RequestMapping("admin/mail/list")
	ModelAndView list() {
		ModelAndView mv = this.getMV();
		mv.addObject("active", Constants.FIVE);
		int pageNum = Constants.ONE;
		PageData pd = this.getPageData();
		if (pd.containsKey("pageNum")) {
			if (IASUtil.isBlank(pd.getString("pageNum"))) {
				pageNum = Integer.parseInt(pd.getString("pageNum"));
				pageNum = pageNum < 1 ? 1 : pageNum;
			}
		}
		int count = mailService.getCountByPd(pd);
		// 0-10 10-10 20-10 3 5
		int countPage = (count + 10 - 1) / 10;
		pd.put("pageSize", Constants.TEN);
		pd.put("pageNum",
				(countPage < pageNum && countPage > 1) ? (countPage - 1)
						* Constants.TEN : (pageNum - 1) * Constants.TEN);
		List<Mail> mailList = mailService.findMailByPd(pd);
		Page<Mail> page = new Page<Mail>(mailList, pageNum, Constants.TEN,
				count);
		mv.addObject("page", page);
		mv.setViewName("admin/mail/list");
		return mv;
	}

	/**
	 * 保存页面
	 * 
	 */
	@RequestMapping("mail/toAdd")
	ModelAndView toAdd() {
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
		/**
		 * 1.导航栏
		 */
		List<Nav> navList = navService.findNavByParentId(0);
		mv.addObject("navList", navList);
		mv.setViewName("template/mail/add");
		return mv;
	}

	/**
	 * 保存
	 * 
	 */
	@RequestMapping("mail/add")
	@ResponseBody
	Map<String, Object> add(Mail mail) {
		String vc = this.getRequest().getParameter("vc").toLowerCase();
		String vc0 = (String) this.getRequest().getSession().getAttribute("vc");
		if (IASUtil.isBlank(vc) && IASUtil.isBlank(vc0)) {
			if (!vc.equals(vc0)) {
				map.put("message", "抱歉，验证码输入错误!");
				map.put("status", Constants.N_500);
				return map;
			}
		} else {
			map.put("message", "抱歉，请输入验证码!");
			map.put("status", Constants.N_500);
			return map;
		}
		try {
			mail.setShow(Constants.ONE);
			mail.setDate(TimeStampUtil.getTimestamp());
			mailService.save(mail);
			map.put("message", "恭喜你，留言成功！");
			map.put("status", Constants.N_200);
		} catch (Exception e) {
			map.put("message", "抱歉，服务器繁忙！");
			map.put("status", Constants.N_500);
		}
		return map;
	}

	/**
	 * 回复
	 */
	@RequestMapping("admin/mail/toReply")
	ModelAndView toReply() {
		ModelAndView mv = this.getMV();
		String id = this.getRequest().getParameter("id");
		String pageNum = this.getRequest().getParameter("pageNum");
		Mail mail = mailService.getOne(IASUtil.toInteger(id));
		mv.addObject("mail", mail);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("admin/mail/reply");
		return mv;
	}

	/**
	 * 回复处理
	 */
	@RequestMapping("admin/mail/reply")
	String reply() {
		String id = this.getRequest().getParameter("id");
		String pageNum = this.getRequest().getParameter("pageNum");
		try {
			Mail mail = new Mail();
			mail.setShow(Constants.TWO);
			mail.setId(id);
			mail.setReply(this.getRequest().getParameter("reply"));
			mailService.update(mail);
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ getUserInfo().getName() + "回复了" + mail.getContent()
					+ "，回复内容：" + mail.getReply());
		} catch (Exception e) {
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ "回复留言异常！");
		}
		return "redirect:/admin/mail/list?pageNum=" + pageNum;
	}

	/**
	 * 删除处理
	 */
	@RequestMapping("admin/mail/delete")
	@ResponseBody
	Map<String, Object> delete() {
		String id = this.getRequest().getParameter("id");
		try {
			mailService.delete(IASUtil.toInteger(id));
			map.put("message", "恭喜你，留言删除成功！");
			map.put("status", Constants.N_200);
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ getUserInfo().getName() + "删除了邮箱ID=" + id);
		} catch (Exception e) {
			map.put("message", "抱歉，留言删除失败！");
			map.put("status", Constants.N_500);
		}

		return map;
	}

	/**
	 * 前段页面展示
	 */
	// @RequestMapping("mail/list")
	// ModelAndView mailList() {
	// ModelAndView mv = this.getMV();
	// int pageNum = Constants.ONE;
	// PageData pd = this.getPageData();
	// pd.put("show", Constants.TWO);
	// if (pd.containsKey("pageNum")) {
	// if (IASUtil.isBlank(pd.getString("pageNum"))) {
	// pageNum = Integer.parseInt(pd.getString("pageNum"));
	// pageNum = pageNum < 1 ? 1 : pageNum;
	// }
	// }
	// int count = mailService.getCountByPd(pd);
	// // 0-10 10-10 20-10 3 5
	// int countPage = (count + 10 - 1) / 10;
	// pd.put("pageSize", Constants.TEN);
	// pd.put("pageNum",
	// (countPage < pageNum && countPage > 1) ? (countPage - 1)
	// * Constants.TEN : (pageNum - 1) * Constants.TEN);
	// List<Mail> mailList = mailService.findMailByPd(pd);
	// Page<Mail> page = new Page<Mail>(mailList, pageNum, Constants.TEN,
	// count);
	// mv.addObject("page", page);
	// mv.setViewName("");
	// return mv;
	// }
}
