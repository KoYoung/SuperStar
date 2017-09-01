package com.service;

import java.util.List;

import com.entity.Role;

/**
 * @author DaYaFeng
 * 
 * 角色dao接口
 * roleDao
 *
 */
public  interface RoleService {
	/**
	 * 查询角色
	 */	
	public List<Role>findRole();
	
	/**
	 * 添加角色
	 * 
	 * */
	public int addRole(Role re);
}
