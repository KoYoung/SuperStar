package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.User;

/**
 * @author why
 * 用户Dao接口
 * UserDao
 *
 */
public interface UserDao {
	/**
	 * 登录验证，查询用户名和密码
	 */
	public List<Map<String, String>> findUserNameAndPassWord(User user);
	
	/**
	 * 登录验证，查询用户名
	 */
	public List<String> findUserName(String username);
	/*
	 * 查询用户
	 */
	List<User> findUser();
	/*
	 * 添加用户
	 */
	int addUser(User user);
}
