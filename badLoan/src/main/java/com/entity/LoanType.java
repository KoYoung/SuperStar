package com.entity;

/**
 * 贷款种类表实体类
 * 
 * @author 马利肖 2017-8-31
 */
public class LoanType {
	private String loantypeId;
	private String loanTypeName;
	private Integer typesOfLoant;

	public String getLoantypeId() {
		return loantypeId;
	}

	public void setLoantypeId(String loantypeId) {
		this.loantypeId = loantypeId;
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

	@Override
	public String toString() {
		return "LoanType [loantypeId=" + loantypeId + ", loanTypeName=" + loanTypeName + ", typesOfLoant=" + typesOfLoant + "]";
	}
	
}
