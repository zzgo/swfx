package com.cwfx.model;

public class User {
	private int id;//
	private String name;
	private String password;
	private int type;// 0- 超级管理员 1-内容管理员
	private String lastLoginTime;
	private int count;// 登录次数

	// 张三 123456 超级管理员
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		return sb.append("[ ").append(name).append(",").append(type)
				.append(" ]").toString();
	}

}
