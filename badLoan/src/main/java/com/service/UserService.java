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
	public List<User> findUserNameAndPassWord();
}
