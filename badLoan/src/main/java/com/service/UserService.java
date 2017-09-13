package com.service;

import java.util.List;

import com.entity.User;

/**
 * @author why
 * 用户Service接口
 * UserService
 *
 */
public interface UserService {
	/**
	 * 登录验证，查询用户名和密码
	 */
	public List<User> findUserNameAndPassWord(User user);
	/*
	 * 查询用户
	 */
	List<User> findUser();
	/*
	 * 添加用户
	 */
	int addUser(User user);
	/**
	 * 登录验证，查询用户名
	 */
	public List<String> findUserName(String username);
	
}
