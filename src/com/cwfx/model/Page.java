package com.cwfx.model;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @ClassName PageData
 * @Description: 分页查询(这里用一句话描述这个类的作用)
 * @author 张棋
 * @company
 * @time 2017年3月22日 下午3:07:17
 * @param <T>
 */
public class Page<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	private List<T> results;// 数据
	private int pageNum;// 当前页
	private int pageSize;// 每页显示多少条数据
	private int countPage;// 总页数
	private int beginPageIndex;// 开始页码
	private int endPageIndex;// 结束页码
	private int recordPage;// 总记录数
	private PageData pd;

	public Page() {

	}

	public Page(List<T> results, int pageNum, int pageSize, int recordPage) {
		this.results = results;
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.recordPage = recordPage;

		// 计算页数
		countPage = (recordPage + pageSize - 1) / pageSize;
		this.pageNum = countPage < pageNum ? countPage : pageNum;
		// 小于10页
		if (countPage < 10) {
			beginPageIndex = 1;
			endPageIndex = countPage;
		} else {
			// 以当前页为中心，前面4页，后面5页。
			beginPageIndex = pageNum - 4;
			endPageIndex = pageNum + 5;
			// 当前页的前面不足4页
			if (beginPageIndex < 1) {
				beginPageIndex = 1;
				endPageIndex = 10;
			}
			// 当前页的后面不足5页
			if (endPageIndex > countPage) {
				endPageIndex = countPage;
				beginPageIndex = countPage - 9;
			}
		}
	}

	public PageData getPd() {
		return pd;
	}

	public void setPd(PageData pd) {
		this.pd = pd;
	}

	public List<T> getResults() {
		return results;
	}

	public void setResults(List<T> results) {
		this.results = results;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCountPage() {
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public int getBeginPageIndex() {
		return beginPageIndex;
	}

	public void setBeginPageIndex(int beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}

	public int getEndPageIndex() {
		return endPageIndex;
	}

	public void setEndPageIndex(int endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

	public int getRecordPage() {
		return recordPage;
	}

	public void setRecordPage(int recordPage) {
		this.recordPage = recordPage;
	}
}