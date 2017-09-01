package com.entity;

/**
 * 贷款处理记录实体类
 * 
 * @author yang kuo
 *
 */
public class LoanManageRecord {
	private String lmrId;
	private String empId;
	private String lmrDate;
	private String lmrName;
	private String lmrComment;

	public String getLmrId() {
		return lmrId;
	}

	public void setLmrId(String lmrId) {
		this.lmrId = lmrId;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getLmrDate() {
		return lmrDate;
	}

	public void setLmrDate(String lmrDate) {
		this.lmrDate = lmrDate;
	}

	public String getLmrName() {
		return lmrName;
	}

	public void setLmrName(String lmrName) {
		this.lmrName = lmrName;
	}

	public String getLmrComment() {
		return lmrComment;
	}

	public void setLmrComment(String lmrComment) {
		this.lmrComment = lmrComment;
	}

	@Override
	public String toString() {
		return "LoanManageRecord [lmrId=" + lmrId + ", empId=" + empId + ", lmrDate=" + lmrDate + ", lmrName=" + lmrName
				+ ", lmrComment=" + lmrComment + "]";
	}
}
