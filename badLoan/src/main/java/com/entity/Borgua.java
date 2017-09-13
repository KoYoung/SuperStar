package com.entity;

public class Borgua {
	/**
	 * 担保人关系表实体类
	 */
	private String loaninfoId;
	private String guaId;
	private String borguaComment;

	public String getLoaninfoId() {
		return loaninfoId;
	}

	public void setLoaninfoId(String loaninfoId) {
		this.loaninfoId = loaninfoId;
	}

	public String getGuaId() {
		return guaId;
	}

	public void setGuaId(String guaId) {
		this.guaId = guaId;
	}

	public String getBorguaComment() {
		return borguaComment;
	}

	public void setBorguaComment(String borguaComment) {
		this.borguaComment = borguaComment;
	}

}
