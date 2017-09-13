package com.entity;

import java.util.List;

/**
 * 核销信息表实体类
 * @author Administrator
 *
 */
public class WriteoffManage {
	private String writeoffId;
	private String loaninfoId;
	private String borId;
	private String empId;
	private String witeoffMoney;
	private String opinion;
	private String borName;
	private String empName;
	private String loanNumber;
	private String lmrComment;
	private String loaninfoType;
	private String loantypeName;
	private String bankinfoId;
	private String bankinfoName;
	private String contractId;
	private String loanType;
	private String loanAccount;
	private String loanDate;
	private String loanRepaymentDate;
	private String reapMoney;
	private String lmrName;
	private Integer unrepayNumber;
	private String loanstateName;
	
	private List<Repaymentinfo> repaymentinfo;
	
	
	public String getLoanstateName() {
		return loanstateName;
	}
	public void setLoanstateName(String loanstateName) {
		this.loanstateName = loanstateName;
	}
	public Integer getUnrepayNumber() {
		return unrepayNumber;
	}
	public void setUnrepayNumber(Integer unrepayNumber) {
		this.unrepayNumber = unrepayNumber;
	}
	public String getLmrName() {
		return lmrName;
	}
	public void setLmrName(String lmrName) {
		this.lmrName = lmrName;
	}
	public String getReapMoney() {
		return reapMoney;
	}
	public void setReapMoney(String reapMoney) {
		this.reapMoney = reapMoney;
	}
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	public String getLoanType() {
		return loanType;
	}
	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}
	public String getLoanAccount() {
		return loanAccount;
	}
	public void setLoanAccount(String loanAccount) {
		this.loanAccount = loanAccount;
	}
	public String getLoanDate() {
		return loanDate;
	}
	public void setLoanDate(String loanDate) {
		this.loanDate = loanDate;
	}
	public String getLoanRepaymentDate() {
		return loanRepaymentDate;
	}
	public void setLoanRepaymentDate(String loanRepaymentDate) {
		this.loanRepaymentDate = loanRepaymentDate;
	}
	public String getBankinfoId() {
		return bankinfoId;
	}
	public void setBankinfoId(String bankinfoId) {
		this.bankinfoId = bankinfoId;
	}
	public String getBankinfoName() {
		return bankinfoName;
	}
	public void setBankinfoName(String bankinfoName) {
		this.bankinfoName = bankinfoName;
	}
	public String getWriteoffId() {
		return writeoffId;
	}
	public void setWriteoffId(String writeoffId) {
		this.writeoffId = writeoffId;
	}
	public String getLoaninfoId() {
		return loaninfoId;
	}
	public void setLoaninfoId(String loaninfoId) {
		this.loaninfoId = loaninfoId;
	}
	public String getBorId() {
		return borId;
	}
	public void setBorId(String borId) {
		this.borId = borId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getWiteoffMoney() {
		return witeoffMoney;
	}
	public void setWiteoffMoney(String witeoffMoney) {
		this.witeoffMoney = witeoffMoney;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	public String getBorName() {
		return borName;
	}
	public void setBorName(String borName) {
		this.borName = borName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getLoanNumber() {
		return loanNumber;
	}
	public void setLoanNumber(String loanNumber) {
		this.loanNumber = loanNumber;
	}
	public String getLmrComment() {
		return lmrComment;
	}
	public void setLmrComment(String lmrComment) {
		this.lmrComment = lmrComment;
	}
	public String getLoaninfoType() {
		return loaninfoType;
	}
	public void setLoaninfoType(String loaninfoType) {
		this.loaninfoType = loaninfoType;
	}
	public String getLoantypeName() {
		return loantypeName;
	}
	public void setLoantypeName(String loantypeName) {
		this.loantypeName = loantypeName;
	}
	public List<Repaymentinfo> getRepaymentinfo() {
		return repaymentinfo;
	}
	public void setRepaymentinfo(List<Repaymentinfo> repaymentinfo) {
		this.repaymentinfo = repaymentinfo;
	}
	@Override
	public String toString() {
		return "WriteoffManage [writeoffId=" + writeoffId + ", loaninfoId=" + loaninfoId + ", borId=" + borId
				+ ", empId=" + empId + ", witeoffMoney=" + witeoffMoney + ", opinion=" + opinion + ", borName=" + borName + ", empName=" + empName + ", loanNumber=" + loanNumber
				+ ", lmrComment=" + lmrComment + ", loaninfoType=" + loaninfoType + ", loantypeName=" + loantypeName
				+ ", bankinfoId=" + bankinfoId + ", bankinfoName=" + bankinfoName + ", contractId=" + contractId
				+ ", loanType=" + loanType + ",  loanAccount=" + loanAccount
				+ ", loanDate=" + loanDate + ", loanRepaymentDate=" + loanRepaymentDate + ", repaymentinfo="
				+ repaymentinfo + "]";
	}
	
	
	
	
	
	
}
