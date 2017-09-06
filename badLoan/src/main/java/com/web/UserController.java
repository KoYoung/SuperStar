package com.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.User;
import com.service.UserService;

/**
 * @author why
 * 用户controller
 * UserController
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	public UserService us;
	
	/**
	 * 登录处理
	 * @param username
	 * @param password
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Integer login(@RequestBody String str,HttpSession session){
		System.out.println(str+"********************");	
		User user = JSON.parseObject(str,User.class);
		System.out.println(user);
		List<String> list = us.findUserName(user.getUserName());
		if(list.size() == 1){
			List<User> list2 = us.findUserNameAndPassWord(user);
			if (list2 != null && list2.size()>0) {
				String userName = list2.get(0).getUserName();
				session.setAttribute("username", userName);
				return 1;
			}else {
				return 2;
			}
		}else {
			return 0;
		}
	}
	
	
	
	
}
