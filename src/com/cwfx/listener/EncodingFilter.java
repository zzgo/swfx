package com.cwfx.listener;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

public class EncodingFilter implements Filter {
	private String charEncoding = null;

	public EncodingFilter() {

	}

	public void init(FilterConfig fConfig) throws ServletException {
		charEncoding = fConfig.getInitParameter("encoding");
		System.out.println(charEncoding);
		if (charEncoding == null) {
			throw new ServletException("EncodingFilter不存在");
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (!charEncoding.equals(request.getCharacterEncoding())) {
			request.setCharacterEncoding(charEncoding);
		}
		response.setCharacterEncoding(charEncoding);
		chain.doFilter(request, response);
	}

	public void destroy() {
	}

}
