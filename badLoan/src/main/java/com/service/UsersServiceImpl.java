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
 * @author Dayafeng
 * 用户Service实现类
 * UsersServiceImp
 *
 */
@Service
public class UsersServiceImpl implements UsersService{
	@Autowired
	private UsersDao ud;
	/**
	 * 查询用户
	 */	

	public List<Users> findUsers() {
		// TODO Auto-generated method stub
		return ud.findUsers();
	}
	/**
	 * 添加用户
	 */
	public int addUsers(Users us) {
		// TODO Auto-generated method stub
		return ud.addUsers(us);
	}
	
	/**
	 * 查询员工
	 */	
	@Transactional
	public List<Emp> findEmp() {
		// TODO Auto-generated method stub
		return ud.findEmp();
	}
	/**
	 * 查询角色
	 */	
	public List<Role> findRole() {
		// TODO Auto-generated method stub
		System.out.println("11111111111");
		return ud.findRole();
	}
	








}
