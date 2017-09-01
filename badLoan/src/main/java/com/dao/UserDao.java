package com.dao;

import java.util.List;

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
	public List<User> findUserNameAndPassWord();
}
