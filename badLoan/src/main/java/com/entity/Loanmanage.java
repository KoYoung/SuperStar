package com.entity;
/**
 * 贷款处理状态关系表实体类
 * @author Administrator
 *
 */
public class Loanmanage {
	private Integer loanType;
	private String loanInfoId;
	private String loanStateId;
	
	public Integer getLoanType() {
		return loanType;
	}
	public void setLoanType(Integer loanType) {
		this.loanType = loanType;
	}
	public String getLoanInfoId() {
		return loanInfoId;
	}
	public void setLoanInfoId(String loanInfoId) {
		this.loanInfoId = loanInfoId;
	}
	public String getLoanStateId() {
		return loanStateId;
	}
	public void setLoanStateId(String loanStateId) {
		this.loanStateId = loanStateId;
	}
	
	
}
