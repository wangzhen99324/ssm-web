package com.core.entity;

import java.util.List;

/**
 * @author 1034683568@qq.com
 * @project_name ssm-demo
 * @date 2015-7-28
 * @time 下午1:50:45
 */
public class PageBean<T> {

	private int currentPage; // 页码
	private int pageSize; // 单页数据量
	
	@SuppressWarnings("unused")
	private int start;

	/**
	 * 数据集合
	 */
	private List<T> rows;

	/**
	 * 总记录数
	 */
	private int totalCount;

	/**
	 * 总页数
	 */
	private int totalPage;

	public PageBean(int currentPage, int pageSize) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStart() {
		return (currentPage - 1) * pageSize;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
		setTotalPage();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage() {
		this.totalPage = this.totalCount % this.pageSize == 0 ? this.totalCount / this.pageSize
				: this.totalCount / this.pageSize + 1;
	}

	public void setStart(int start) {
		this.start = start;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	

}
