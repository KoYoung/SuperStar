package com.entity;

import java.util.List;

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
	private Employee emp;
	private List<Role> role;

	private String empName;
	private String empId;
	private String roleIds;
	private String roleName;

	public String getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Employee getEmp() {
		return emp;
	}

	public void setEmp(Employee emp) {
		this.emp = emp;
	}

	public List<Role> getRole() {
		return role;
	}

	public void setRole(List<Role> role) {
		this.role = role;
	}

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

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userName=" + userName + ", userUsername=" + userUsername
				+ ", userPassword=" + userPassword + ", emp=" + emp + ", role=" + role + ", empName=" + empName
				+ ", roleIds=" + roleIds + ", roleName=" + roleName + ", empId=" + empId + "]";
	}

}
