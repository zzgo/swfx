package com.cwfx.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.model.Page;
import com.cwfx.model.PageData;
import com.cwfx.model.Recruit;
import com.cwfx.util.Constants;
import com.cwfx.util.IASUtil;
import com.cwfx.util.ObjectExcelView;
import com.cwfx.util.TimeStampUtil;

/**
 * 
 * @ClassName RecruitController.java
 * @Description: 招聘(这里用一句话描述这个类的作用)
 * @author 张棋
 * @company
 * @time 2017年7月28日
 */
@Controller
public class RecruitController extends BaseController {
	Map<String, Object> map = new HashMap<String, Object>();

	final static Logger logger = Logger.getLogger(RecruitController.class);

	@RequestMapping("admin/recruit/list")
	ModelAndView list() {
		ModelAndView mv = this.getMV();
		mv.addObject("active", Constants.SIX);
		int pageNum = Constants.ONE;
		PageData pd = this.getPageData();
		Page<Recruit> page = null;
		try {
			if (pd.containsKey("pageNum")) {
				if (IASUtil.isBlank(pd.getString("pageNum"))) {
					pageNum = Integer.parseInt(pd.getString("pageNum"));
					pageNum = pageNum < 1 ? 1 : pageNum;
				}
			}
			int count = recruitService.findCountByPd(pd);
			// 0-10 10-10 20-10 3 5
			int countPage = (count + 10 - 1) / 10;
			pd.put("pageSize", Constants.ONE);
			pd.put("pageNum",
					(countPage < pageNum && countPage > 1) ? (countPage - 1)
							* Constants.ONE : (pageNum - 1) * Constants.ONE);
			List<Recruit> recruitList = recruitService.findRecruitByPd(pd);
			page = new Page<Recruit>(recruitList, pageNum, Constants.ONE, count);
		} catch (Exception e) {
			page = null;
		}
		mv.addObject("page", page);
		mv.setViewName("admin/recruit/list");
		return mv;
	}

	/**
	 * 保存
	 */
	@RequestMapping("recruit/add")
	@ResponseBody
	Map<String, Object> add(Recruit recruit) {
		try {
			String vc = this.getRequest().getParameter("vc").toLowerCase();
			String vc0 = (String) this.getRequest().getSession()
					.getAttribute("vc");
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
				recruit.setCreateTime(TimeStampUtil.getTimestamp());
				recruitService.save(recruit);
				map.put("message", "招聘信息已保存，等待管理员与你联系！");
				map.put("status", Constants.N_200);
			} catch (Exception e) {
				map.put("message", "抱歉，请检查输入是否正确，字数是否合理！");
				map.put("status", Constants.N_500);
			}
		} catch (Exception e) {
			map.put("message", "抱歉，服务异常，请稍后！");
			map.put("status", Constants.N_500);
		}
		return map;
	}

	@RequestMapping(value = "admin/recruit/daoExcel")
	ModelAndView daoExcel() throws Exception {
		ModelAndView mv = this.getMV();
		try {

			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("ID"); // 1
			titles.add("姓名");// 2
			titles.add("性别"); // 3
			titles.add("出生年月"); // 4
			titles.add("政治面貌"); // 5
			titles.add("职称"); // 6
			titles.add("普通话"); // 7
			titles.add("英语等级"); // 8
			titles.add("电话"); // 9
			titles.add("谋求职位"); // 10
			titles.add("毕业校系及时间"); // 11
			titles.add("居住地址"); // 12
			titles.add("个人简介"); // 13
			titles.add("获奖情况"); // 14
			titles.add("创建时间"); // 15
			dataMap.put("titles", titles);
			// 时间段
			String startTime = this.getRequest().getParameter("startTime");
			String endTime = this.getRequest().getParameter("endTime");
			List<Recruit> recruitList = recruitService.findRecruitByTime(
					endTime, startTime);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < recruitList.size(); i++) {
				PageData vpd = new PageData();
				vpd.put("var1", recruitList.get(i).getId() + "");
				vpd.put("var2", recruitList.get(i).getName());
				vpd.put("var3", recruitList.get(i).getSex());
				vpd.put("var4", recruitList.get(i).getDate());
				vpd.put("var5", recruitList.get(i).getPolitics());
				vpd.put("var6", recruitList.get(i).getTitle());
				vpd.put("var7", recruitList.get(i).getPth());
				vpd.put("var8", recruitList.get(i).getEnglish());
				vpd.put("var9", recruitList.get(i).getCall());
				vpd.put("var10", recruitList.get(i).getPosition());
				vpd.put("var11", recruitList.get(i).getTime());
				vpd.put("var12", recruitList.get(i).getAddress());
				vpd.put("var13", recruitList.get(i).getPerson());
				vpd.put("var14", recruitList.get(i).getWinning());
				vpd.put("var15", recruitList.get(i).getCreateTime());
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv, dataMap);
		} catch (Exception e) {
			mv.setViewName("404");
		}
		return mv;
	}
}
