package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.entity.User;
import com.util.MD5Util;

/**
 * @author why 用户Service实现类 UserServiceImp
 *
 */
@Service
public class UserServiceImp implements UserService {
	@Autowired
	private UserDao ud;

	/**
	 * 登录验证，查询用户名和密码
	 */
	public List<User> findUserNameAndPassWord(User user) {
		user.setPassWord(MD5Util.toMD5(user.getPassWord()).toUpperCase());
		List<User> list = ud.findUserNameAndPassWord(user);
		return list;
	}

	/**
	 * 登录验证，查询用户名
	 */
	@Override
	public List<String> findUserName(String username) {
		List<String> list = ud.findUserName(username);
		return list;
	}

	@Override
	public List<User> findUser() {
		// TODO Auto-generated method stub
		return ud.findUser();
	}

	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return ud.addUser(user);
	}

}
