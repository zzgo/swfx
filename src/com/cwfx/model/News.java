package com.cwfx.model;

public class News {
	private int id;
	private String title;// 标题
	private String subTitle;// 副标题
	private String summary;// 摘要
	private String author;// 作者
	private String editor;// 编辑者
	private String from;// 来源
	private String addTime;// 添加时间
	private String content;// 内容
	private String image;// 图片
	private int audit;// 审核字段 1 表示通过 0表示没有通过
	private String auditor;// 审核者
	private String auditorTime;// 审核时间
	private int navId;// 栏目ID
	private int status;// 状态 垃圾箱+正常

	private String timeStr;// 时间 2017-07-06 12:12 星期三

	private String oneTime;
	private String twoTime;
	private String threeYear;
	private String threeMonth;
	private String threeDay;
	private String threeWeek;

	private int clickCount;

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getAudit() {
		return audit;
	}

	public void setAudit(int audit) {
		this.audit = audit;
	}

	public String getAuditor() {
		return auditor;
	}

	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}

	public String getAuditorTime() {
		return auditorTime;
	}

	public void setAuditorTime(String auditorTime) {
		this.auditorTime = auditorTime;
	}

	public int getNavId() {
		return navId;
	}

	public void setNavId(int navId) {
		this.navId = navId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTimeStr() {
		return timeStr;
	}

	public void setTimeStr(String timeStr) {
		this.timeStr = timeStr;
	}

	public String getOneTime() {
		return oneTime;
	}

	public void setOneTime(String oneTime) {
		this.oneTime = oneTime;
	}

	public String getTwoTime() {
		return twoTime;
	}

	public void setTwoTime(String twoTime) {
		this.twoTime = twoTime;
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

	public String getThreeYear() {
		return threeYear;
	}

	public void setThreeYear(String threeYear) {
		this.threeYear = threeYear;
	}

}
