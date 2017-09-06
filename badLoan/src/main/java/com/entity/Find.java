package com.entity;

/**
 * @author 蒙奇·D·路飞 查询实体类 BigFind
 *
 */
public class Find {
	// 银行信息表(bankinfo)
	private String bankinfoName; // 银行名称

	// !!!个人客户贷款信息表(borloaninfo)
	private String borloaninfoId; // 贷款编号（个人）
	private String borId; // 客户编号（个人）
	private String bankinfoId; // 银行编号
	private String empId; // 员工编号
	private String loanType; // 贷款类型
	private String loanNumber; // 贷款金额
	private String loanDate; // 贷款日期
	private String loanRepaymentdate; // 还款日期

	// 个人客户基本信息表(borrower)
	private String borName; // 客户姓名（个人）

	// 企业客户贷款信息表(comloaninfo)
	private String comloaninfoId; // 贷款编号（企业）
	private String comId; // 客户编号（企业）

	// 企业客户基本信息表(company)
	private String comName; // 客户姓名（企业）
	private String comLegalId; // 法人代表编号

	// 员工表(employee)
	private String empName; // 员工姓名

	// 担保人表(guarantor)
	private String guaName; // 担保人姓名
	private String guaPhone; // 担保人联系方式
	private String guaCardtype; // 担保人证件类型
	private String guaCardnumber; // 担保人证件号码
	private String guaUnit; // 担保人工作单位
	private String guaPosition; // 担保人职位
	private String guaEducation; // 担保人学历
	private String guaIncome; // 担保人收入

	// !!!担保人关系表（多对多）(borgua)
	private String loaninfoId; // 贷款编号
	private String guaId; // 担保人编号

	// 法人代表信息表(legal)
	private String legalId; // 法人代表编号
	private String legalName; // 法人代表姓名

	// !!!贷款处理状态关系表（单对单）(loanmanage)
	private String loanstateId; // 贷款状态编号

	// 贷款状态表(loanstate)
	private String loanstateName; // 贷款状态名称

	// 贷款类型表(loantype)
	private String loantypeName; // 贷款类型名称

	// 抵押物品信息表(pledge)
	private String pledgeId; // 抵押物品编号
	private String pledgeGenre; // 抵押或质押
	private String pledgeName; // 抵押物品名称
	private String pledgeValue; // 抵押物品价值
	private String pledgePhoto; // 抵押物品照片

	// !!!客户抵押物关系表(多对多)(customergoods)
	private String goodsId; // 抵押物品编号

	public String getBankinfoName() {
		return bankinfoName;
	}

	public void setBankinfoName(String bankinfoName) {
		this.bankinfoName = bankinfoName;
	}

	public String getBorloaninfoId() {
		return borloaninfoId;
	}

	public void setBorloaninfoId(String borloaninfoId) {
		this.borloaninfoId = borloaninfoId;
	}

	public String getBorId() {
		return borId;
	}

	public void setBorId(String borId) {
		this.borId = borId;
	}

	public String getBankinfoId() {
		return bankinfoId;
	}

	public void setBankinfoId(String bankinfoId) {
		this.bankinfoId = bankinfoId;
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

	public String getLoanDate() {
		return loanDate;
	}

	public void setLoanDate(String loanDate) {
		this.loanDate = loanDate;
	}

	public String getLoanRepaymentdate() {
		return loanRepaymentdate;
	}

	public void setLoanRepaymentdate(String loanRepaymentdate) {
		this.loanRepaymentdate = loanRepaymentdate;
	}

	public String getBorName() {
		return borName;
	}

	public void setBorName(String borName) {
		this.borName = borName;
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

	public String getComLegalId() {
		return comLegalId;
	}

	public void setComLegalId(String comLegalId) {
		this.comLegalId = comLegalId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getGuaName() {
		return guaName;
	}

	public void setGuaName(String guaName) {
		this.guaName = guaName;
	}

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

	public String getLegalId() {
		return legalId;
	}

	public void setLegalId(String legalId) {
		this.legalId = legalId;
	}

	public String getLegalName() {
		return legalName;
	}

	public void setLegalName(String legalName) {
		this.legalName = legalName;
	}

	public String getLoanstateId() {
		return loanstateId;
	}

	public void setLoanstateId(String loanstateId) {
		this.loanstateId = loanstateId;
	}

	public String getLoanstateName() {
		return loanstateName;
	}

	public void setLoanstateName(String loanstateName) {
		this.loanstateName = loanstateName;
	}

	public String getLoantypeName() {
		return loantypeName;
	}

	public void setLoantypeName(String loantypeName) {
		this.loantypeName = loantypeName;
	}

	public String getPledgeId() {
		return pledgeId;
	}

	public void setPledgeId(String pledgeId) {
		this.pledgeId = pledgeId;
	}

	public String getPledgeGenre() {
		return pledgeGenre;
	}

	public void setPledgeGenre(String pledgeGenre) {
		this.pledgeGenre = pledgeGenre;
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

	public String getPledgePhoto() {
		return pledgePhoto;
	}

	public void setPledgePhoto(String pledgePhoto) {
		this.pledgePhoto = pledgePhoto;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGuaPhone() {
		return guaPhone;
	}

	public void setGuaPhone(String guaPhone) {
		this.guaPhone = guaPhone;
	}

	public String getGuaCardtype() {
		return guaCardtype;
	}

	public void setGuaCardtype(String guaCardtype) {
		this.guaCardtype = guaCardtype;
	}

	public String getGuaCardnumber() {
		return guaCardnumber;
	}

	public void setGuaCardnumber(String guaCardnumber) {
		this.guaCardnumber = guaCardnumber;
	}

	public String getGuaUnit() {
		return guaUnit;
	}

	public void setGuaUnit(String guaUnit) {
		this.guaUnit = guaUnit;
	}

	public String getGuaPosition() {
		return guaPosition;
	}

	public void setGuaPosition(String guaPosition) {
		this.guaPosition = guaPosition;
	}

	public String getGuaEducation() {
		return guaEducation;
	}

	public void setGuaEducation(String guaEducation) {
		this.guaEducation = guaEducation;
	}

	public String getGuaIncome() {
		return guaIncome;
	}

	public void setGuaIncome(String guaIncome) {
		this.guaIncome = guaIncome;
	}

	public String getLoanNumber() {
		return loanNumber;
	}

	public void setLoanNumber(String loanNumber) {
		this.loanNumber = loanNumber;
	}

}
