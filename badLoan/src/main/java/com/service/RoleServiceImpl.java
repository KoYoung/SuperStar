package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.RoleDao;

import com.entity.Role;

/**
 * @author DaYaFeng 角色Service实现类 RoleServiceImp
 *
 */
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao rd;

	/**
	 * 查询角色
	 */
	public List<Role> findRole() {
		return rd.findRole();
	}

	/**
	 * 添加角色
	 */
	public int addRole(Role re) {
		return rd.addRole(re);
	}

	@Override
	public List<Map<String, String>> queryRightByRoleId(String roleId) {
		return rd.queryRightByRoleId(roleId);
	}

	@Transactional
	public void deleteRoleRightById(String roleId, String[] rightIds) {
		for (int i = 0; i < rightIds.length; i++) {
			rd.deleteRoleRightById(roleId, rightIds[i]);
		}
	}

	@Transactional
	public void updateRoleRightById(String roleId, String[] rightIds) {
		rd.deleteAllRightById(roleId);
		for (int i = 0; i < rightIds.length; i++) {
			rd.addRoleRight(roleId, rightIds[i]);
		}
	}

	@Override
	public void addRoleByAJAX(Map<String, String> datamap) {
		rd.addRoleByAJAX(datamap);
	}

}
