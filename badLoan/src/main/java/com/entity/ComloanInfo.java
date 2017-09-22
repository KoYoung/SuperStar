package com.entity;

/**
 * 企业用户贷款信息表实体类
 * 
 * @author Administrator
 *
 */
public class ComloanInfo {
	private Integer loaninfoType;
	private String comloaninfoId;
	private String comId;
	private String comName;
	private String bankinfoId;
	private String bankinfoName;
	private String contractId;
	private String empId;
	private String empName;
	private String loanType;
	private String loanTypeName;
	private String loanNumber;
	private String loanAccount;
	private String loanDate;
	private String loanRepaymentDate;
	private Double loanRate;
	private String pledgeGenre;
	private String pledgeType;
	private String pledgeName;
	private String pledgeValue;
	private String pledgeOwner;
	private String guaName;
	private String loanstateName;
	private Integer unrepayNumber;

	public Integer getUnrepayNumber() {
		return unrepayNumber;
	}

	public void setUnrepayNumber(Integer unrepayNumber) {
		this.unrepayNumber = unrepayNumber;
	}

	public Integer getLoaninfoType() {
		return loaninfoType;
	}

	public void setLoaninfoType(Integer loaninfoType) {
		this.loaninfoType = loaninfoType;
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

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
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

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	public String getLoanTypeName() {
		return loanTypeName;
	}

	public void setLoanTypeName(String loanTypeName) {
		this.loanTypeName = loanTypeName;
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

	public String getPledgeGenre() {
		return pledgeGenre;
	}

	public void setPledgeGenre(String pledgeGenre) {
		this.pledgeGenre = pledgeGenre;
	}

	public String getPledgeType() {
		return pledgeType;
	}

	public void setPledgeType(String pledgeType) {
		this.pledgeType = pledgeType;
	}

	public String getPledgeName() {
		return pledgeName;
	}

	public void setPledgeName(String pledgeName) {
		this.pledgeName = pledgeName;
	}

	public String getPledgeValue() {
		return pledgeValue;
	}

	public void setPledgeValue(String pledgeValue) {
		this.pledgeValue = pledgeValue;
	}

	public String getPledgeOwner() {
		return pledgeOwner;
	}

	public void setPledgeOwner(String pledgeOwner) {
		this.pledgeOwner = pledgeOwner;
	}

	public String getGuaName() {
		return guaName;
	}

	public void setGuaName(String guaName) {
		this.guaName = guaName;
	}
	public String getLoanstateName() {
		return loanstateName;
	}

	public void setLoanstateName(String loanstateName) {
		this.loanstateName = loanstateName;
	}

	@Override
	public String toString() {
		return "ComloanInfo [loaninfoType=" + loaninfoType + ", comloaninfoId=" + comloaninfoId + ", comId=" + comId
				+ ", comName=" + comName + ", bankinfoId=" + bankinfoId + ", bankinfoName=" + bankinfoName
				+ ", contractId=" + contractId + ", empId=" + empId + ", empName=" + empName + ", loanType=" + loanType
				+ ", loanTypeName=" + loanTypeName + ", loanNumber=" + loanNumber + ", loanAccount=" + loanAccount
				+ ", loanDate=" + loanDate + ", loanRepaymentDate=" + loanRepaymentDate + ", loanRate=" + loanRate
				+ ", pledgeGenre=" + pledgeGenre + ", pledgeType=" + pledgeType + ", pledgeName=" + pledgeName
				+ ", pledgeValue=" + pledgeValue + ", pledgeOwner=" + pledgeOwner + ", guaName=" + guaName
				+ ", loanstateName=" + loanstateName + "]";
	}

}
