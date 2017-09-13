package com.dao;



import java.util.List;

import com.entity.Role;



/**
 * @author DaYaFeng
 * 
 * 角色dao接口
 * roleDao
 *
 */
public interface RoleDao {
	/**
	 * 查询角色
	 */	
	public List<Role>findRole();
	
	/**
	 * 添加角色
	 * @return 
	 */	
	public int addRole(Role re);
}
