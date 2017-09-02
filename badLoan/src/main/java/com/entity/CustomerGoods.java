package com.entity;
/**
 * 客户抵押物关系表实体类
 * @author Administrator
 *
 */
public class CustomerGoods {
	
	private String borId;
	private String goodId;
	private String cusComment;
	
	
	public String getBorId() {
		return borId;
	}
	public void setBorId(String borId) {
		this.borId = borId;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getCusComment() {
		return cusComment;
	}
	public void setCusComment(String cusComment) {
		this.cusComment = cusComment;
	}
	
	
}
