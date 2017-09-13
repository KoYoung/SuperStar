package com.entity;

/**
 * 贷款处理状态关系表实体类
 * 
 * @author Administrator
 *
 */
public class Loanmanage {
	private Integer loaninfoType;
	private String loanInfoId;
	private String loanStateId;

	public Integer getLoaninfoType() {
		return loaninfoType;
	}

	public void setLoaninfoType(Integer loaninfoType) {
		this.loaninfoType = loaninfoType;
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
