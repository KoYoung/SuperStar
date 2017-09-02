package com.entity;
/**
 * 企业用户贷款信息表实体类
 * @author Administrator
 *
 */
public class ComloanInfo {
	private String comloaninfoId;
	private String comId;
	private String bankinfoId;
	private String contractId;
	private String empId;
	private String loanType;
	private String loanNumber;
	private String loanAccount;
	private String loanDate;
	private String loanRepaymentDate;
	private String loanRate;
	
	
	public String getLoanType() {
		return loanType;
	}
	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}
	public String getComloaninfoId() {
		return comloaninfoId;
	}
	public void setComloaninfoId(String comloaninfoId) {
		this.comloaninfoId = comloaninfoId;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getBankinfoId() {
		return bankinfoId;
	}
	public void setBankinfoId(String bankinfoId) {
		this.bankinfoId = bankinfoId;
	}
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
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
	public String getLoanRate() {
		return loanRate;
	}
	public void setLoanRate(String loanRate) {
		this.loanRate = loanRate;
	}
	@Override
	public String toString() {
		return "ComloanInfo [comloaninfoId=" + comloaninfoId + ", comId=" + comId + ", bankinfoId=" + bankinfoId
				+ ", contractId=" + contractId + ", empId=" + empId + ", loanNumber=" + loanNumber + ", loanAccount="
				+ loanAccount + ", loanDate=" + loanDate + ", loanRepaymentDate=" + loanRepaymentDate + ", loanRate="
				+ loanRate + "]";
	}
	
	
}
