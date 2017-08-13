package com.cwfx.model;

/**
 * 
 * <b>校长信箱</b>
 * 
 * @Description: 校长信箱类
 * @author 棋 张
 * @version V1.0
 * @ClassName: Mail类名
 * @Comments:
 * @Creatr Date:2017年7月22日 下午8:10:24
 * @Company:
 * @Copyright: Copyright (c) 2017
 * @版权所有 棋 张
 */
public class Mail {
	private String id;// 唯一ID
	private String content;// 留言内容
	private String name;// 姓名
	private String call;// 电话
	private String email;// 邮箱
	private String date;// 时间
	private String reply;// 回复内容
	private int show;// 是否显示 1显示
	private String threeYear;
	private String threeMonth;
	private String threeDay;
	private String threeWeek;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCall() {
		return call;
	}

	public void setCall(String call) {
		this.call = call;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public int getShow() {
		return show;
	}

	public void setShow(int show) {
		this.show = show;
	}

	public String getThreeYear() {
		return threeYear;
	}

	public void setThreeYear(String threeYear) {
		this.threeYear = threeYear;
	}

	public String getThreeMonth() {
		return threeMonth;
	}

	public void setThreeMonth(String threeMonth) {
		this.threeMonth = threeMonth;
	}

	public String getThreeDay() {
		return threeDay;
	}

	public void setThreeDay(String threeDay) {
		this.threeDay = threeDay;
	}

	public String getThreeWeek() {
		return threeWeek;
	}

	public void setThreeWeek(String threeWeek) {
		this.threeWeek = threeWeek;
	}

}
