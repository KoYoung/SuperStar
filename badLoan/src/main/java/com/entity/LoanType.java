package com.entity;

/**
 * 贷款种类表实体类
 * 
 * @author 马利肖 2017-8-31
 */
public class LoanType {
	private String loantypeId;
	private String loantypeName;
	private String loanTypeId;
	private String loanTypeName;
	private Integer typesOfLoant;

	public String getLoantypeId() {
		return loantypeId;
	}

	public void setLoantypeId(String loantypeId) {
		this.loantypeId = loantypeId;
	}

	public String getLoantypeName() {
		return loantypeName;
	}

	public void setLoantypeName(String loantypeName) {
		this.loantypeName = loantypeName;
	}

	public String getLoanTypeId() {
		return loanTypeId;
	}

	public void setLoanTypeId(String loanTypeId) {
		this.loanTypeId = loanTypeId;
	}

	public String getLoanTypeName() {
		return loanTypeName;
	}

	public void setLoanTypeName(String loanTypeName) {
		this.loanTypeName = loanTypeName;
	}

	public Integer getTypesOfLoant() {
		return typesOfLoant;
	}

	public void setTypesOfLoant(Integer typesOfLoant) {
		this.typesOfLoant = typesOfLoant;
	}

}
