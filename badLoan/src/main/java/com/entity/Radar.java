package com.entity;

import java.util.List;

public class Radar {
	private List<Integer> borMoneyList;
	private List<Integer> comMoneyList;
	private List<Integer> sumMoneyList;
	private List<String> bankNameList;
	private List<String> stateNameList;

	public List<Integer> getBorMoneyList() {
		return borMoneyList;
	}

	public void setBorMoneyList(List<Integer> borMoneyList) {
		this.borMoneyList = borMoneyList;
	}

	public List<Integer> getComMoneyList() {
		return comMoneyList;
	}

	public void setComMoneyList(List<Integer> comMoneyList) {
		this.comMoneyList = comMoneyList;
	}

	public List<Integer> getSumMoneyList() {
		return sumMoneyList;
	}

	public void setSumMoneyList(List<Integer> sumMoneyList) {
		this.sumMoneyList = sumMoneyList;
	}

	public List<String> getBankNameList() {
		return bankNameList;
	}

	public void setBankNameList(List<String> bankNameList) {
		this.bankNameList = bankNameList;
	}

	public List<String> getStateNameList() {
		return stateNameList;
	}

	public void setStateNameList(List<String> stateNameList) {
		this.stateNameList = stateNameList;
	}

	@Override
	public String toString() {
		return "Radar [borMoneyList=" + borMoneyList + ", comMoneyList=" + comMoneyList + ", sumMoneyList="
				+ sumMoneyList + ", bankNameList=" + bankNameList + ", stateNameList=" + stateNameList + "]";
	}

}
