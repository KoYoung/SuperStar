package com.entity;

/**
 * @author DaYaFeng 系统用户表实体类 role
 *
 */

public class Users {
	/**
	 * 系统用户实体类 users
	 */
	private String userId;
	private String userName;
	private String userUsername;
	private String userPassword;

	/**
	 * 员工表实体类 employee
	 */
	private String empId;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserUsername() {
		return userUsername;
	}

	public void setUserUsername(String userUsername) {
		this.userUsername = userUsername;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

}
