package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.User;
import com.service.UserService;

/**
 * @author 蒙奇·D·路飞
 * 用户controller
 * UserController
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	public UserService us;
	
	@RequestMapping("/login")
	public List<User> login(){
		List<User> list = us.findUserNameAndPassWord();
		return list;
	}
}
