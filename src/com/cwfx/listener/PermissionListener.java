package com.cwfx.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cwfx.model.User;

public class PermissionListener implements HandlerInterceptor {
	// 执行Handler完成执行此方法
	// 应用场景：统一异常处理，统一日志处理
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object object, Exception e)
			throws Exception {

	}

	// 进入Handler方法之后，返回modelAndView之前执行
	// 应用场景从modelAndView出发：将公用的模型数据(比如菜单导航)在这里传到视图，也可以在这里统一指定视图
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object object,
			ModelAndView modelAndView) throws Exception {

	}

	// 进入 Handler方法之前执行
	// 用于身份认证、身份授权
	// 比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object object) throws Exception {

		String url = request.getRequestURI();

		if (url.contains("admin/user/toLogin")
				|| url.contains("admin/user/login")
				|| url.contains("admin/user/modifyPass")
				|| url.contains("admin/user/updatePass")
				|| url.contains("admin/user/logout")) {
			return true;
		}
		User user = (User) request.getSession().getAttribute("UserInfo");
		if (user != null) {
			if (user.getType() == 2
					&& (url.contains("admin/news/auditList")
							|| url.contains("admin/news/toAudit") || url
								.contains("admin/news/audit"))) {
				response.sendRedirect(request.getContextPath()
						+ "/admin/user/toLogin");
				return false;
			}
			return true;
		}
		response.sendRedirect(request.getContextPath() + "/admin/user/toLogin");
		return false;
	}
}
