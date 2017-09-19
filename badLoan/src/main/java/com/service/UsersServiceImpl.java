package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UsersDao;
import com.entity.Emp;
import com.entity.Role;
import com.entity.Users;

/**
 * @author Dayafeng 用户Service实现类 UsersServiceImp
 *
 */
@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao ud;

	/**
	 * 查询用户
	 */

	public List<Users> findUsers() {
		List<Users> findUsers = ud.findUsers();
		String str;
		for (int i = 0; i < findUsers.size(); i++) {
			Users u = findUsers.get(i);
			u.setEmpName(u.getEmp().getEmpName());
			str = "";
			for (int j = 0; j < u.getRole().size(); j++) {
				str += u.getRole().get(j).getRoleName() + ",";
			}
			str = str.substring(0, str.length() - 1);
			u.setRoleName(str);
		}
		return findUsers;
	}

	/**
	 * 添加用户
	 */
	@Transactional
	public void addUsers(Users us) {
		ud.addUsers(us);
		String userId = ud.getUsersKey();
		us.setUserId(userId);
		String[] roles = us.getRoleIds().split(",");
		for (int i = 0; i < roles.length; i++) {
			ud.addUserRole(us.getUserId(), roles[i]);
		}
	}

	/**
	 * 查询员工
	 */
	@Transactional
	public List<Emp> findEmp() {
		return ud.findEmp();
	}

	/**
	 * 查询角色
	 */
	public List<Role> findRole() {
		return ud.findRole();
	}

}
