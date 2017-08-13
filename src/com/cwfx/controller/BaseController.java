package com.cwfx.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.model.PageData;
import com.cwfx.model.User;
import com.cwfx.service.MailService;
import com.cwfx.service.NavService;
import com.cwfx.service.NewsService;
import com.cwfx.service.RecruitService;
import com.cwfx.service.UserService;

public class BaseController {
	@Autowired
	public UserService userService;
	@Autowired
	public NavService navService;
	@Autowired
	public NewsService newsService;
	@Autowired
	public MailService mailService;
	@Autowired
	public RecruitService recruitService;

	public User getUserInfo() {
		return (User) getRequest().getSession().getAttribute("UserInfo");
	}

	public ModelAndView getMV() {
		return new ModelAndView();
	}

	/**
	 * 得到request对象
	 * 
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		return request;
	}

	/**
	 * new PageData对象
	 * 
	 * @return
	 */
	public PageData getPageData() {
		return new PageData(this.getRequest());
	}
}
