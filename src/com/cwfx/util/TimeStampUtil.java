package com.cwfx.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeStampUtil {
	public static String getTimestamp() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(new java.sql.Timestamp(Calendar.getInstance()
				.getTime().getTime()));
	}

	public static String getTimestampStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		return sdf.format(new java.sql.Timestamp(Calendar.getInstance()
				.getTime().getTime()));
	}

	public static String getWeekOfDate() {
		String[] weekDays = { "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT" };
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (w < 0)
			w = 0;
		return weekDays[w];
	}

	// year&month&day&
	public static String getMonthOfDate(int index) {
		String[] mothons = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
				"Aug", "Sept", "Oct", "Nov", "Dec" };
		return mothons[index - 1];
	}

	public static void main(String[] args) {
		int i = Integer.parseInt("10");
		System.out.println(i);
		System.out.println(getTimestampStr());
	}

	public static int compare_date(String DATE1, String DATE2) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dt1 = df.parse(DATE1);
			Date dt2 = df.parse(DATE2);
			if (dt1.getTime() > dt2.getTime()) {
				System.out.println("dt1 在dt2前");
				return 1;
			} else if (dt1.getTime() < dt2.getTime()) {
				System.out.println("dt1在dt2后");
				return -1;
			} else {
				return 0;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return 0;
	}
}
