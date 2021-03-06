package com.dao;

import java.util.List;

import com.entity.Emp;
import com.entity.Employee;
import com.entity.Role;
import com.entity.Users;

/**
 * @author DaYaFeng
 * 
 *         系统用户dao接口 roleDao
 *
 */
public interface UsersDao {

	/**
	 * 查询用户
	 */
	public List<Users> findUsers();

	/**
	 * 查询员工
	 */
	public List<Emp> findEmp();

	/**
	 * 添加用户
	 */
	public int addUsers(Users us);

	/**
	 * 查询角色
	 */
	public List<Role> findRole();

	/**
	 * 增加用户角色
	 * 
	 * @param userId
	 * @param roleId
	 */
	void addUserRole(String userId, String roleId);

	/**
	 * 查询users序列自增主键
	 * 
	 * @return
	 */
	String getUsersKey();
}
