package com.cwfx.timestack;

import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.cwfx.util.TimeStampUtil;

@Component
public class TaskCool {

	private static final Logger logger = Logger.getLogger(TaskCool.class);

	/**
	 * 第一个定时器测试方法
	 * 
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public void testJob() throws ClientProtocolException, IOException {
		WebApplicationContext webApplicationContext = ContextLoader
				.getCurrentWebApplicationContext();
		ServletContext servletContext = webApplicationContext
				.getServletContext();
		logger.info("## [" + TimeStampUtil.getTimestamp() + "]\t 定时器起作用了。");
		String url = "http://119.23.201.8" + servletContext.getContextPath()
				+ "/index";
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost method = new HttpPost(url);
		HttpResponse re = httpClient.execute(method);
		// String strResult = EntityUtils.toString(re.getEntity());
	}
}