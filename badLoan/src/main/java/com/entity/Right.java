package com.entity;

/**
 * @author 蒙奇·D·路飞
 * 权限实体类
 * Right
 */
public class Right {
	//权限表
	private String rightId;
	private String rightName;
	private String rightUrl;
	private String rightParent;
	private String rightFlag;
	//角色权限表
	private String roleId;
	
	
	
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRightId() {
		return rightId;
	}
	public void setRightId(String rightId) {
		this.rightId = rightId;
	}
	public String getRightName() {
		return rightName;
	}
	public void setRightName(String rightName) {
		this.rightName = rightName;
	}
	public String getRightUrl() {
		return rightUrl;
	}
	public void setRightUrl(String rightUrl) {
		this.rightUrl = rightUrl;
	}
	public String getRightParent() {
		return rightParent;
	}
	public void setRightParent(String rightParent) {
		this.rightParent = rightParent;
	}
	public String getRightFlag() {
		return rightFlag;
	}
	public void setRightFlag(String rightFlag) {
		this.rightFlag = rightFlag;
	}
	
}
