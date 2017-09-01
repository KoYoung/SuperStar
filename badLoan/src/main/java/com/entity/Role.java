package com.entity;

public class Role {
	
	
	
	/**
	 * @author DaYaFeng
	 * 角色实体类
	 * role
	 *
	 */
	private int roleId;
	private String roleName;
	private String roleComment;
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleComment() {
		return roleComment;
	}
	public void setRoleComment(String roleComment) {
		this.roleComment = roleComment;
	}
	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", roleComment=" + roleComment + "]";
	}
	
}
