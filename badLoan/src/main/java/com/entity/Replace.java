package com.entity;

public class Replace {
	private String  repId;
	private String oldEmpId;
	private String newEmpId;
	private String loaninfoId;
	private String replaceComment;
	private String replaceDate;
	private Integer loaninfoType;
	private String borName;
	private String oldEmpName;
	private String newEmpName;
	
	
	public String getBorName() {
		return borName;
	}
	public void setBorName(String borName) {
		this.borName = borName;
	}
	public String getOldEmpName() {
		return oldEmpName;
	}
	public void setOldEmpName(String oldEmpName) {
		this.oldEmpName = oldEmpName;
	}
	public String getNewEmpName() {
		return newEmpName;
	}
	public void setNewEmpName(String newEmpName) {
		this.newEmpName = newEmpName;
	}
	public String getReplaceDate() {
		return replaceDate;
	}
	public void setReplaceDate(String replaceDate) {
		this.replaceDate = replaceDate;
	}
	public Integer getLoaninfoType() {
		return loaninfoType;
	}
	public void setLoaninfoType(Integer loaninfoType) {
		this.loaninfoType = loaninfoType;
	}
	public String getRepId() {
		return repId;
	}
	public void setRepId(String repId) {
		this.repId = repId;
	}
	public String getOldEmpId() {
		return oldEmpId;
	}
	public void setOldEmpId(String oldEmpId) {
		this.oldEmpId = oldEmpId;
	}
	public String getNewEmpId() {
		return newEmpId;
	}
	public void setNewEmpId(String newEmpId) {
		this.newEmpId = newEmpId;
	}
	public String getLoaninfoId() {
		return loaninfoId;
	}
	public void setLoaninfoId(String loaninfoId) {
		this.loaninfoId = loaninfoId;
	}
	public String getReplaceComment() {
		return replaceComment;
	}
	public void setReplaceComment(String replaceComment) {
		this.replaceComment = replaceComment;
	}
	@Override
	public String toString() {
		return "Replace [repId=" + repId + ", oldEmpId=" + oldEmpId + ", newEmpId=" + newEmpId + ", loaninfoId="
				+ loaninfoId + ", replaceComment=" + replaceComment + "]";
	}
	
	
}
