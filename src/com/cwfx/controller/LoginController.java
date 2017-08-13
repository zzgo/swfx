package com.cwfx.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.dsna.util.images.ValidateCode;

import com.cwfx.model.PageData;
import com.cwfx.model.User;
import com.cwfx.util.Constants;
import com.cwfx.util.IASUtil;
import com.cwfx.util.TimeStampUtil;

@Controller
public class LoginController extends BaseController {

	Map<String, Object> map = new HashMap<String, Object>();

	final static Logger logger = Logger.getLogger(LoginController.class);

	@RequestMapping("admin/user/toLogin")
	String toLogin() {
		return "admin/login/login";
	}

	@RequestMapping("admin/user/login")
	@ResponseBody
	Map<String, Object> login(User u, HttpServletRequest request) {

		String vc = this.getRequest().getParameter("vc").toLowerCase();
		String vc0 = (String) this.getRequest().getSession().getAttribute("vc");
		if (IASUtil.isBlank(vc) && IASUtil.isBlank(vc0)) {
			if (!vc.equals(vc0)) {
				map.put("status", Constants.N_500);
				map.put("message", "抱歉，验证码输入错误！");
				map.put("backUrl", "");
				return map;
			}
		} else {
			map.put("message", "抱歉，验证码输入错误！");
			map.put("status", Constants.N_500);
			return map;
		}
		User user = userService.findByNamePass(u);
		if (user != null) {
			map.put("status", Constants.N_200);
			if (user.getCount() == 0) {
				// 你是第一次登录
				// 修改密码
				map.put("backUrl", "admin/user/modifyPass?id=" + user.getId());
				map.put("message", "为了你的账户安全，请修改你的密码！");
				return map;
			}
			// 更新时间和次数
			User updateUser = new User();
			updateUser.setLastLoginTime(TimeStampUtil.getTimestamp());
			int count = user.getCount();
			updateUser.setCount(count + 1);
			updateUser.setId(user.getId());
			userService.updateBy(updateUser);
			request.getSession().setAttribute("UserInfo", user);
			PageData pd = new PageData();
			pd.put("audit", Constants.ONE);
			pd.put("status", Constants.ONE);
			request.getSession().setAttribute("auditNewsCount",
					newsService.findCountByPd(pd));
			map.put("message", "恭喜你，登录成功！");
			map.put("backUrl", "admin/index");
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t"
					+ user.getName() + "登录了系统");
		} else {
			map.put("status", Constants.N_500);
			map.put("message", "抱歉，你的用户名或密码错误！");
			map.put("backUrl", "");
		}
		return map;
	}

	@RequestMapping("admin/user/modifyPass")
	ModelAndView modifyPass(HttpServletRequest request) {
		String id = request.getParameter("id");
		ModelAndView mv = this.getMV();
		mv.addObject("userId", id);
		mv.setViewName("admin/login/modifyPass");
		return mv;
	}

	@RequestMapping("admin/user/updatePass")
	@ResponseBody
	Map<String, Object> updatePass(HttpServletRequest request) {
		String oldPass = request.getParameter("oldPass");
		String password = request.getParameter("newPass");
		String id = request.getParameter("userId");
		User u = userService.findOne(IASUtil.toInteger(id));
		if (!u.getPassword().equals(oldPass)) {
			map.put("status", Constants.N_500);
			map.put("message", "抱歉，原密码错误！");
			return map;
		}
		try {
			User user = new User();
			user.setId(IASUtil.toInteger(id));
			user.setCount(Constants.ONE);
			user.setPassword(password);
			userService.updateBy(user);
			map.put("status", Constants.N_200);
			map.put("message", "恭喜你，密码修改成功！");
			map.put("backUrl", "admin/user/toLogin");
			logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t" + "用户ID="
					+ id + "修改了密码");
		} catch (Exception e) {
			map.put("status", Constants.N_500);
			map.put("message", "抱歉，修改密码异常！");
			map.put("backUrl", "admin/user/modifyPass?id=" + id);
		}
		return map;
	}

	@RequestMapping("admin/user/logout")
	String logout() {
		this.getRequest().getSession().setAttribute("UserInfo", null);
		this.getRequest().getSession().removeAttribute("UserInfo");
		this.getRequest().getSession().setMaxInactiveInterval(0);
		return "redirect:/admin/user/toLogin";
	}

	/**
	 * 验证码
	 * 
	 * @throws IOException
	 */
	@RequestMapping("vc/ma")
	void validateCode(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		ValidateCode yanzheng = new ValidateCode(110, 25, 4, 5);
		String validateCode = yanzheng.getCode();
		HttpSession session = request.getSession();
		session.setAttribute("vc", validateCode.toLowerCase());
		yanzheng.write(response.getOutputStream());

	}
}
