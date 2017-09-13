package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RoleDao;

import com.entity.Role;

/**
 * @author DaYaFeng 角色Service实现类 RoleServiceImp
 *
 */
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired

	private RoleDao RD;

	/**
	 * 查询角色
	 */
	public List<Role> findRole() {
		return RD.findRole();
	}

	/**
	 * 添加角色
	 */
	public int addRole(Role re) {
		return RD.addRole(re);
	}

}
