package com.service;

import java.util.List;

import com.entity.Emp;
import com.entity.Role;
import com.entity.Users;

/**
 * @author DaYaFeng
 * 
 * 角色service接口
 * roleDao
 *
 */
public  interface UsersService {
		
	
	/**
	 * 查询用户
	 */	
	public List<Users>findUsers();
	
	
	/**
	 * 查询员工
	 */	
	public List<Emp>findEmp();
	
	/**
	 * 添加用户
	 */	
	public void addUsers(Users us);
	
	/**
	 * 添加角色
	 */
	public List<Role>findRole();
	
}
