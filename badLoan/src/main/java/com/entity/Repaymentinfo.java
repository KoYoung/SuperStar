package com.entity;
/**
 * 贷款回收信息表实体类
 * @author Administrator
 *
 */
public class Repaymentinfo {
	private String repayId;
	private String loaninfoId;
	private String empId;
	private String repayDate;
	private String repayType;
	private String repayComment;
	private Integer repayNumber;
	public String getRepayId() {
		return repayId;
	}
	public void setRepayId(String repayId) {
		this.repayId = repayId;
	}
	public String getLoaninfoId() {
		return loaninfoId;
	}
	public void setLoaninfoId(String loaninfoId) {
		this.loaninfoId = loaninfoId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getRepayDate() {
		return repayDate;
	}
	public void setRepayDate(String repayDate) {
		this.repayDate = repayDate;
	}
	
	public String getRepayType() {
		return repayType;
	}
	public void setRepayType(String repayType) {
		this.repayType = repayType;
	}
	public String getRepayComment() {
		return repayComment;
	}
	public void setRepayComment(String repayComment) {
		this.repayComment = repayComment;
	}
	
	public Integer getRepayNumber() {
		return repayNumber;
	}
	public void setRepayNumber(Integer repayNumber) {
		this.repayNumber = repayNumber;
	}
	@Override
	public String toString() {
		return "Repaymentinfo [repayId=" + repayId + ", loaninfoId=" + loaninfoId + ", empId=" + empId + ", repayDate="
				+ repayDate + ",  repayComment=" + repayComment + ", repayNumber="
				+ repayNumber + "]";
	}
	
	
}
