package com.core.entity;

import java.io.Serializable;

/**
 * 假期申请
 * 
 * @author Administrator
 *
 */
public class Vacation implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	private Integer id;

	/**
	 * 申请人
	 */
	private String staffName;

	/**
	 * 开始时间
	 */
	private String kaishishijian;

	/**
	 * 结束时间
	 */
	private String jieshushijian;

	/**
	 * 时长
	 */
	private String shichang;

	/**
	 * 假期类型
	 */
	private String jiaqileixing;

	/**
	 * 请假理由
	 */
	private String yuanyin;

	/**
	 * 审核人员
	 */
	private String auditor;

	/**
	 * 审核状态 (0 审核中 1 : 批准 2 : 拒绝)
	 */
	private Integer auditStatus;

	/**
	 * 拒绝理由
	 */
	private String reason;

	/**
	 * 创建时间
	 */
	private String createTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getKaishishijian() {
		return kaishishijian;
	}

	public void setKaishishijian(String kaishishijian) {
		this.kaishishijian = kaishishijian;
	}

	public String getJieshushijian() {
		return jieshushijian;
	}

	public void setJieshushijian(String jieshushijian) {
		this.jieshushijian = jieshushijian;
	}

	public String getShichang() {
		return shichang;
	}

	public void setShichang(String shichang) {
		this.shichang = shichang;
	}

	public String getJiaqileixing() {
		return jiaqileixing;
	}

	public void setJiaqileixing(String jiaqileixing) {
		this.jiaqileixing = jiaqileixing;
	}

	public String getYuanyin() {
		return yuanyin;
	}

	public void setYuanyin(String yuanyin) {
		this.yuanyin = yuanyin;
	}

	public Integer getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(Integer auditStatus) {
		this.auditStatus = auditStatus;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getAuditor() {
		return auditor;
	}

	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}

	@Override
	public String toString() {
		return "Vacation [id=" + id + ", staffName=" + staffName + ", kaishishijian=" + kaishishijian
				+ ", jieshushijian=" + jieshushijian + ", shichang=" + shichang + ", jiaqileixing=" + jiaqileixing
				+ ", yuanyin=" + yuanyin + ", auditor=" + auditor + ", auditStatus=" + auditStatus + ", reason="
				+ reason + ", createTime=" + createTime + "]";
	}

	public Vacation(Integer id, String staffName, String kaishishijian, String jieshushijian, String shichang,
			String jiaqileixing, String yuanyin, String auditor, Integer auditStatus, String reason,
			String createTime) {
		super();
		this.id = id;
		this.staffName = staffName;
		this.kaishishijian = kaishishijian;
		this.jieshushijian = jieshushijian;
		this.shichang = shichang;
		this.jiaqileixing = jiaqileixing;
		this.yuanyin = yuanyin;
		this.auditor = auditor;
		this.auditStatus = auditStatus;
		this.reason = reason;
		this.createTime = createTime;
	}

	public Vacation() {
		super();
	}

	/**
	 * 天数
	 */
	private String day;

	/**
	 * 小时
	 */
	private String hour;

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

}
