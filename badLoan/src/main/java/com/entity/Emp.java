package com.entity;

/**
 * 员工表
 */
public class Emp {
	String empId;
	String empName;
	String empGender;
	String empTelphone;
	String empCardnumber;
	String empAddress;
	String empEducation;
	String empDepartment;
	String empEmail;
	String empNation;

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpGender() {
		return empGender;
	}

	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}

	public String getEmpTelphone() {
		return empTelphone;
	}

	public void setEmpTelphone(String empTelphone) {
		this.empTelphone = empTelphone;
	}

	public String getEmpCardnumber() {
		return empCardnumber;
	}

	public void setEmpCardnumber(String empCardnumber) {
		this.empCardnumber = empCardnumber;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public String getEmpEducation() {
		return empEducation;
	}

	public void setEmpEducation(String empEducation) {
		this.empEducation = empEducation;
	}

	public String getEmpDepartment() {
		return empDepartment;
	}

	public void setEmpDepartment(String empDepartment) {
		this.empDepartment = empDepartment;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpNation() {
		return empNation;
	}

	public void setEmpNation(String empNation) {
		this.empNation = empNation;
	}

	@Override
	public String toString() {
		return "Emp [empId=" + empId + ", empName=" + empName + ", empGender=" + empGender + ", empTelphone="
				+ empTelphone + ", empCardnumber=" + empCardnumber + ", empAddress=" + empAddress + ", empEducation="
				+ empEducation + ", empDepartment=" + empDepartment + ", empEmail=" + empEmail + ", empNation="
				+ empNation + "]";
	}
}
