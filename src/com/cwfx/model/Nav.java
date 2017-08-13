package com.cwfx.model;

import java.util.List;

public class Nav {
	private int id;
	private String name;// 栏目名称
	private String link;// 链接
	private int tempId;// 模板文件 0-列表 1-图文
	private String description;// 说明
	private Nav parent;// 父级
	private int parentId;// 父级ID
	private String parentName;// 父级名称
	private List<Nav> children;

	private String addTime;// 添加时间

	private int show;// 显示时间

	private int order;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getTempId() {
		return tempId;
	}

	public void setTempId(int tempId) {
		this.tempId = tempId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Nav getParent() {
		return parent;
	}

	public void setParent(Nav parent) {
		this.parent = parent;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public List<Nav> getChildren() {
		return children;
	}

	public void setChildren(List<Nav> children) {
		this.children = children;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public int getShow() {
		return show;
	}

	public void setShow(int show) {
		this.show = show;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

}
