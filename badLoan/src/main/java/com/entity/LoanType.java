package com.entity;
/**
 * 贷款种类表实体类
 * @author 马利肖
 * 2017-8-31
 */
public class LoanType {

	private String loantypeId;
	private String loantypeName;
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
	public Integer getTypesOfLoant() {
		return typesOfLoant;
	}
	public void setTypesOfLoant(Integer typesOfLoant) {
		this.typesOfLoant = typesOfLoant;
	}
	
	
}
