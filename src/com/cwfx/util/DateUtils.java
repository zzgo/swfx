package com.cwfx.util;

import java.util.Calendar;

public class DateUtils {
	private final static Calendar cal = Calendar.getInstance();

	public static String getYear() {
		return cal.get(Calendar.YEAR) + "";
	}

	public static String getMonth() {
		return (cal.get(Calendar.MONTH) + 1) + "";
	}

	public static String getDay() {
		return cal.get(Calendar.DATE) + "";
	}

	public static String getWeek() {
		return cal.get(Calendar.DAY_OF_WEEK) + "";
	}

	public static String getHour() {
		return cal.get(Calendar.HOUR) + "";
	}

	public static String getMinute() {
		return cal.get(Calendar.MINUTE) + "";
	}

	public static String getSecond() {
		return cal.get(Calendar.SECOND) + "";
	}

	public static void main(String[] args) {
		System.out.println(getMonth());
	}
}
