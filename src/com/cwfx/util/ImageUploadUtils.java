package com.cwfx.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class ImageUploadUtils {
	/**
	 * 上传文件工具
	 * 
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static Map<String, Object> saveImg(MultipartFile file,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (file.getSize() < 1) {
			map.put("message", "上传的图片格式有误，请重新上传！");
			map.put("status", Constants.N_500);
			return map;
		}
		try {
			// 文件保存目录路径
			String savePath = request.getServletContext().getRealPath("/")
					+ Constants.UPLOAD_IMAGE_URL + DateUtils.getYear() + "/"
					+ DateUtils.getMonth() + "/";
			// 文件保存目录URL
			String saveUrl = "/" + Constants.UPLOAD_IMAGE_URL
					+ DateUtils.getYear() + "/" + DateUtils.getMonth() + "/";
			// 物理路径
			String path = savePath;
			// SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String aliasId = UUID.randomUUID().toString();
			// 如果目录不存在，则新建
			File dir = new File(path);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			// 获取一个
			// 创建日期分类
			String originalFilename = file.getOriginalFilename();
			String aliasName = aliasId
					+ originalFilename.substring(originalFilename
							.lastIndexOf("."));
			saveUrl += aliasName;
			File f = new File(path + "\\" + aliasName);
			file.transferTo(f);
			map.put("backImgUrl", saveUrl);
			map.put("status", Constants.N_200);
			map.put("message", "恭喜你，上传图片成功！");
			return map;
		} catch (Exception e) {
			map.put("message", "抱歉，服务器 异常！请重试");
			map.put("status", Constants.N_500);
			return map;
		}
	}
}
