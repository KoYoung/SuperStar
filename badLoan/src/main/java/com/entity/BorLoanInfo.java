package com.entity;
/**
 * 个人用户贷款信息实体类
 * @author 马利肖
 * 2017-8-31
 */
public class BorLoanInfo {
	private Integer borId;
	private Integer bankinfoId;
	private Integer contractId;
	private Integer empId;
	private Integer loanType;
	private String loanNumber;
	private String loanAccount;
	private String loanDate;
	private String loanRepaymentDate;
	private Double loanRate;
	public Integer getBorId() {
		return borId;
	}
	public void setBorId(Integer borId) {
		this.borId = borId;
	}
	public Integer getBankinfoId() {
		return bankinfoId;
	}
	public void setBankinfoId(Integer bankinfoId) {
		this.bankinfoId = bankinfoId;
	}
	public Integer getContractId() {
		return contractId;
	}
	public void setContractId(Integer contractId) {
		this.contractId = contractId;
	}
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public Integer getLoanType() {
		return loanType;
	}
	public void setLoanType(Integer loanType) {
		this.loanType = loanType;
	}
	public String getLoanNumber() {
		return loanNumber;
	}
	public void setLoanNumber(String loanNumber) {
		this.loanNumber = loanNumber;
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
	public Double getLoanRate() {
		return loanRate;
	}
	public void setLoanRate(Double loanRate) {
		this.loanRate = loanRate;
	}
	
	
}
