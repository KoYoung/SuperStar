package com.entity;

/**
 * 部门表
 * 
 * @author zcs
 */
public class Dept {
	String deptId;
	String deptName;
	String deptPhone;
	String bankinfoId;

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptPhone() {
		return deptPhone;
	}

	public void setDeptPhone(String deptPhone) {
		this.deptPhone = deptPhone;
	}

	public String getBankinfoId() {
		return bankinfoId;
	}

	public void setBankinfoId(String bankinfoId) {
		this.bankinfoId = bankinfoId;
	}

	@Override
	public String toString() {
		return "department [deptId=" + deptId + ", deptName=" + deptName + ", deptPhone=" + deptPhone + ", bankinfoId="
				+ bankinfoId + "]";
	}

}
