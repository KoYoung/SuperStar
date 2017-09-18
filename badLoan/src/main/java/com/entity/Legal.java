package com.entity;

/**
 * 张少华 法人类
 * 
 * @author Administrator
 *
 */
public class Legal {
	String legalId;
	String legalName;
	String legalCardtype;
	String legalCardnumber;
	String legalNation;
	String legalGender;
	String legalMarry;
	String legalAddress;
	String legalPhone;
	String legalInfo;

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

	public String getLegalCardtype() {
		return legalCardtype;
	}

	public void setLegalCardtype(String legalCardtype) {
		this.legalCardtype = legalCardtype;
	}

	public String getLegalCardnumber() {
		return legalCardnumber;
	}

	public void setLegalCardnumber(String legalCardnumber) {
		this.legalCardnumber = legalCardnumber;
	}

	public String getLegalNation() {
		return legalNation;
	}

	public void setLegalNation(String legalNation) {
		this.legalNation = legalNation;
	}

	public String getLegalGender() {
		return legalGender;
	}

	public void setLegalGender(String legalGender) {
		this.legalGender = legalGender;
	}

	public String getLegalMarry() {
		return legalMarry;
	}

	public void setLegalMarry(String legalMarry) {
		this.legalMarry = legalMarry;
	}

	public String getLegalAddress() {
		return legalAddress;
	}

	public void setLegalAddress(String legalAddress) {
		this.legalAddress = legalAddress;
	}

	public String getLegalPhone() {
		return legalPhone;
	}

	public void setLegalPhone(String legalPhone) {
		this.legalPhone = legalPhone;
	}

	public String getLegalInfo() {
		return legalInfo;
	}

	public void setLegalInfo(String legalInfo) {
		this.legalInfo = legalInfo;
	}

	@Override
	public String toString() {
		return "Legal [legalId=" + legalId + ", legalName=" + legalName + ", legalCardtype=" + legalCardtype
				+ ", legalCardnumber=" + legalCardnumber + ", legalNation=" + legalNation + ", legalGender="
				+ legalGender + ", legalMarry=" + legalMarry + ", legalAddress=" + legalAddress + ", legalPhone="
				+ legalPhone + ", legalInfo=" + legalInfo + "]";
	}
	
}
