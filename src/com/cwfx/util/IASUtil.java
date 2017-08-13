package com.cwfx.util;

/**
 * 
 * @ClassName IASUtil.java
 * @Description: Integer and String 转换(这里用一句话描述这个类的作用)
 * @author 张棋
 * @company
 * @time 2017年7月31日
 */
public class IASUtil {
	public static int toInteger(String s) {
		if (isBlank(s)) {
			return Integer.parseInt(s);
		}
		return -1;
	}

	public static boolean isBlank(String s) {

		if (!"".equals(s) && s != null) {
			return true;
		}
		return false;
	}

}
