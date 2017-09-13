package com.entity;

/**
 * 贷款合同实体类
 * 
 * @author yang
 *
 */
public class Contract {
	private String contractId;
	private String empId;
	private String loanType;
	private Integer loanNumber;
	private String loanAccount;
	private String loanDate;
	private String loanRepaymentDate;
	private Double loanRate;

	public String getLoanDate() {
		return loanDate;
	}

	public void setLoanDate(String loanDate) {
		this.loanDate = loanDate;
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

	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	public Integer getLoanNumber() {
		return loanNumber;
	}

	public void setLoanNumber(Integer loanNumber) {
		this.loanNumber = loanNumber;
	}

	public String getLoanAccount() {
		return loanAccount;
	}

	public void setLoanAccount(String loanAccount) {
		this.loanAccount = loanAccount;
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

	@Override
	public String toString() {
		return "Contract [contractId=" + contractId + ", empId=" + empId + ", loanType=" + loanType + ", loanNumber="
				+ loanNumber + ", loanAccount=" + loanAccount + ", loanDate=" + loanDate + ", loanRepaymentDate="
				+ loanRepaymentDate + ", loanRate=" + loanRate + "]";
	}

}
