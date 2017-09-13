package com.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.Emp;
import com.entity.Role;
import com.entity.RoleTree;
import com.entity.RoleTreeText;
import com.entity.Users;
import com.service.UsersService;

/**
 * @author DaYaFeng 系统用户Service实现类 RoleServiceImp
 *
 */
@Controller
@RequestMapping("/usersController")
public class UsersConterller {
	@Autowired
	public UsersService us;

	@RequestMapping("/queryUsers")
	@ResponseBody
	public List<Users> queryRole() {
		List<Users> usersList = us.findUsers();
		return usersList;
	}
	@RequestMapping(value = "/addUsers")
	@ResponseBody
	public int addUsers(Users room) {
		System.out.println(room);
		int addUsers = us.addUsers(room);
		return addUsers;
	}
	@RequestMapping("/queryRole1")
	@ResponseBody
	public List<Emp> queryRole1() {
		List<Emp> empList = us.findEmp();
		System.out.println(empList);
		return empList;
	}
	
	@RequestMapping(value="/queryRole2")
	@ResponseBody
	public String queryRole2() {
		List<Role> roleList = us.findRole();
		List roletree=new ArrayList();
		for(int i=0;i<roleList.size();i++){
			RoleTreeText rtt=new RoleTreeText();
			rtt.setText(roleList.get(i).getRoleName());
			roletree.add(rtt);
		}
		RoleTree role=new RoleTree();
		role.setText("全选");
		role.setChildren(roletree);
		String str=JSON.toJSONString(role);
		str="["+str+"]";
		System.out.println("ssssss"+str);
		return str;
	}
}