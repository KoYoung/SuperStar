package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Role;

/**
 * @author DaYaFeng
 * 
 *         角色dao接口 roleDao
 *
 */
public interface RoleDao {
	/**
	 * 查询角色
	 */
	public List<Role> findRole();

	/**
	 * 添加角色
	 * 
	 * @return
	 */
	public int addRole(Role re);

	/**
	 * 根据角色id查询角色对应的权限
	 * 
	 * @param roleId
	 * @return
	 */
	List<Map<String, String>> queryRightByRoleId(String roleId);

	/**
	 * 根据角色ID 删除相应的角色权限
	 * 
	 * @param roleId
	 * @param rightIds
	 */
	void deleteRoleRightById(String roleId, String rightIds);
	/**
	 * 删除该角色所有权限
	 * @param roleId
	 */
	void deleteAllRightById(String roleId);
	/**
	 * 添加角色权限
	 * @param roleId
	 * @param rightid
	 */
	void addRoleRight(String roleId, String rightid);

	void addRoleByAJAX(Map<String, String> datamap);
}
