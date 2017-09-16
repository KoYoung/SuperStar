package com.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.Emp;
import com.entity.Role;
import com.entity.RoleTree;
import com.entity.Children;
import com.entity.Users;
import com.service.UsersService;
import com.util.Paging;
import com.util.PagingResult;

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
	public PagingResult<Users> queryUsers(@RequestParam Integer rows, Integer page) {
		List<Users> usersList = us.findUsers();
		System.out.println(usersList);
		Paging<Users> pagingMap = new Paging<Users>();
		List<Users> list1 = pagingMap.paging(usersList, rows, page);
		PagingResult<Users> pResult = new PagingResult<Users>();
		pResult.setTotal(usersList.size());
		pResult.setRows(list1);
		System.out.println(pResult);
		return pResult;
	}

	@RequestMapping(value = "/addUsers")
	@ResponseBody
	public String addUsers(Users room) {
		us.addUsers(room);
		System.out.println(room);
		return "success";
	}

	@RequestMapping("/queryRole1")
	@ResponseBody
	public List<Emp> queryRole1() {
		List<Emp> empList = us.findEmp();
		return empList;
	}

	@RequestMapping(value = "/queryRole2")
	@ResponseBody
	public String queryRole2() {
		List<Role> roleList = us.findRole();
		List<Children> roletree = new ArrayList<Children>();
		for (int i = 0; i < roleList.size(); i++) {
			Children rtt = new Children();
			rtt.setText(roleList.get(i).getRoleName());
			rtt.setId(roleList.get(i).getRoleId());
			roletree.add(rtt);
		}
		RoleTree role = new RoleTree();
		role.setId(0);
		role.setText("全选");
		role.setChildren(roletree);
		String str = JSON.toJSONString(role);
		str = "[" + str + "]";
		System.out.println("ssssss" + str);
		return str;
	}
}