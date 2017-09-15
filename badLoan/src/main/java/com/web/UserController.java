package com.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.User;
import com.service.UserService;

/**
 * @author why 用户controller UserController
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	public UserService us;

	/**
	 * 登录处理
	 * 
	 * @param username
	 * @param password
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Integer login(@RequestBody String str, HttpSession session) {
		System.out.println(str + "********************");
		User user = JSON.parseObject(str, User.class);
		System.out.println(user);
		List<String> list = us.findUserName(user.getUserName());
		if (list.size() == 1) {
			List<Map<String, String>> list2 = us.findUserNameAndPassWord(user);
			if (list2 != null && list2.size() > 0) {
				// String userName = list2.get(0).getUserName();
				System.out.println(list2.get(0));
				session.setAttribute("user", list2.get(0));
				return 1;
			} else {
				return 2;
			}
		} else {
			return 0;
		}
	}

	/**
	 * 注销登录
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/jsp/login.jsp";
	}

	/**
	 * 获取用户session
	 */
	@RequestMapping("/getUserSession")
	@ResponseBody
	public String getUserSession(HttpSession session) {
		Map<String, String> usermap = (Map<String, String>) session.getAttribute("user");
		if (usermap != null) {
			return JSON.toJSONString(usermap);
		} else {
			return "error";
		}
	}
}
