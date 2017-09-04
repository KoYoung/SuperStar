package com.entity;

/**
 * 担保人实体类
 * 
 * @author yang
 *
 */
public class Guarantor {
	private String guaId;
	private String guaName;
	private String guaGender;
	private String guaPhone;
	private String guaBirthday;
	private String guaCardType;
	private String guaCardNumber;
	private String guaRegister;
	private String guaAddress;
	private String guaUnit;
	private String guaPosition;
	private String guaMarry;
	private String guaNation;
	private String guaEducation;
	private Double guaIncome;

	public String getGuaId() {
		return guaId;
	}

	public void setGuaId(String guaId) {
		this.guaId = guaId;
	}

	public String getGuaName() {
		return guaName;
	}

	public void setGuaName(String guaName) {
		this.guaName = guaName;
	}

	public String getGuaGender() {
		return guaGender;
	}

	public void setGuaGender(String guaGender) {
		this.guaGender = guaGender;
	}

	public String getGuaPhone() {
		return guaPhone;
	}

	public void setGuaPhone(String guaPhone) {
		this.guaPhone = guaPhone;
	}

	public String getGuaBirthday() {
		return guaBirthday;
	}

	public void setGuaBirthday(String guaBirthday) {
		this.guaBirthday = guaBirthday;
	}

	public String getGuaCardType() {
		return guaCardType;
	}

	public void setGuaCardType(String guaCardType) {
		this.guaCardType = guaCardType;
	}

	public String getGuaCardNumber() {
		return guaCardNumber;
	}

	public void setGuaCardNumber(String guaCardNumber) {
		this.guaCardNumber = guaCardNumber;
	}

	public String getGuaRegister() {
		return guaRegister;
	}

	public void setGuaRegister(String guaRegister) {
		this.guaRegister = guaRegister;
	}

	public String getGuaAddress() {
		return guaAddress;
	}

	public void setGuaAddress(String guaAddress) {
		this.guaAddress = guaAddress;
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

	public String getGuaMarry() {
		return guaMarry;
	}

	public void setGuaMarry(String guaMarry) {
		this.guaMarry = guaMarry;
	}

	public String getGuaNation() {
		return guaNation;
	}

	public void setGuaNation(String guaNation) {
		this.guaNation = guaNation;
	}

	public String getGuaEducation() {
		return guaEducation;
	}

	public void setGuaEducation(String guaEducation) {
		this.guaEducation = guaEducation;
	}

	public Double getGuaIncome() {
		return guaIncome;
	}

	public void setGuaIncome(Double guaIncome) {
		this.guaIncome = guaIncome;
	}

	@Override
	public String toString() {
		return "Guarantor [guaId=" + guaId + ", guaName=" + guaName + ", guaGender=" + guaGender + ", guaPhone="
				+ guaPhone + ", guaBirthday=" + guaBirthday + ", guaCardType=" + guaCardType + ", guaCardNumber="
				+ guaCardNumber + ", guaRegister=" + guaRegister + ", guaAddress=" + guaAddress + ", guaUnit=" + guaUnit
				+ ", guaPosition=" + guaPosition + ", guaMarry=" + guaMarry + ", guaNation=" + guaNation
				+ ", guaEducation=" + guaEducation + ", guaIncome=" + guaIncome + "]";
	}

}
