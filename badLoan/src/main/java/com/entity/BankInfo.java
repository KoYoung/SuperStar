package com.entity;

/**
 * 银行信息实体类
 * 
 * @author 马利肖 2017-8-31
 */
public class BankInfo {

	private String bankInfoId;
	private String bankInfoName;
	private String bankInfoTelePhone;
	private String bankinfoAddress;

	public String getBankInfoId() {
		return bankInfoId;
	}

	public void setBankInfoId(String bankInfoId) {
		this.bankInfoId = bankInfoId;
	}

	public String getBankInfoName() {
		return bankInfoName;
	}

	public void setBankInfoName(String bankInfoName) {
		this.bankInfoName = bankInfoName;
	}

	public String getBankInfoTelePhone() {
		return bankInfoTelePhone;
	}

	public void setBankInfoTelePhone(String bankInfoTelePhone) {
		this.bankInfoTelePhone = bankInfoTelePhone;
	}

	public String getBankinfoAddress() {
		return bankinfoAddress;
	}

	public void setBankinfoAddress(String bankinfoAddress) {
		this.bankinfoAddress = bankinfoAddress;
	}

}
