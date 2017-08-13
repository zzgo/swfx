package com.cwfx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.util.Constants;

/**
 * 
 * @ClassName IndexController.java
 * @Description:首页配置 (这里用一句话描述这个类的作用)
 * @author 张棋
 * @company
 * @time 2017年7月24日
 */
@Controller
public class IndexController {

	@RequestMapping("admin/index")
	ModelAndView adminIndex() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("active", Constants.ONE);
		mv.setViewName("admin/index/index");
		return mv;
	}

}
