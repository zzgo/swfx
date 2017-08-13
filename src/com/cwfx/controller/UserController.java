package com.cwfx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.model.User;
import com.cwfx.service.UserService;
import com.cwfx.util.Constants;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("admin/user/list")
	ModelAndView list() {
		ModelAndView mv = new ModelAndView();
		List<User> userList = null;
		try {
			userList = userService.findAll();
		} catch (Exception e) {
			userList = null;
		}
		mv.addObject("userList", userList);
		mv.addObject("active", Constants.EIGHT);
		mv.setViewName("admin/user/list");
		return mv;
	}
}
