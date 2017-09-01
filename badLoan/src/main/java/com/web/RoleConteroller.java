package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.Role;
import com.service.RoleService;

/**
 * @author DaYaFeng 角色Service实现类 RoleServiceImp
 *
 */
@Controller
@RequestMapping("/roleController")
public class RoleConteroller {
	@Autowired
	public RoleService rs;

	@RequestMapping("/queryRole")
	@ResponseBody
	public List<Role> queryRole() {
		System.out.println("11111111111111111");
		List<Role> roleList = rs.findRole();
		return roleList;
	}

	@RequestMapping(value = "/addRole")
	@ResponseBody
	public int addRole(Role room) {
		System.out.println(room);
		int addRole = rs.addRole(room);
		return addRole;
	}

}