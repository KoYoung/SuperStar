package com.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.Role;
import com.service.RoleService;
import com.util.Paging;
import com.util.PagingResult;
import com.util.FormUtil;

/**
 * @author DaYaFeng 角色 Service实现类 RoleServiceImp
 *
 */
@Controller
@RequestMapping("/roleController")
public class RoleConteroller {
	@Autowired
	public RoleService rs;

	@RequestMapping("/queryRole")
	@ResponseBody
	public String queryRole() {
		List<Role> roleList = rs.findRole();
		System.out.println(roleList);
		String str = "[";
		for (int i = 0; i < roleList.size(); i++) {
			str += "{\"id\":" + roleList.get(i).getRoleId() + "," + "\"text\":\"" + roleList.get(i).getRoleName()
					+ "\"},";
		}
		str = str.substring(0, str.length() - 1);
		str += "]";
		System.out.println(str);
		return str;
	}

	@RequestMapping(value = "/addRole")
	@ResponseBody
	public int addRole(Role room) {
		System.out.println(room);
		int addRole = rs.addRole(room);
		return addRole;
	}

	@RequestMapping(value = "/addRoleByAJAX")
	@ResponseBody
	public String addRoleByAJAX(@RequestBody String data) {
		System.out.println(data);
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		rs.addRoleByAJAX(datamap);
		return "success";
	}

	@RequestMapping(value = "/queryRightByRoleId")
	@ResponseBody
	public PagingResult<Map<String, String>> queryRightByRoleId(@RequestBody String roleId, @RequestParam Integer page,
			Integer rows) {
		String role_id = roleId.substring(roleId.indexOf("=") + 1, roleId.indexOf("&"));
		System.out.println(role_id);

		List<Map<String, String>> queryRightByRoleId = rs.queryRightByRoleId(role_id);
		System.out.println(queryRightByRoleId);

		Paging<Map<String, String>> pagingMap = new Paging<Map<String, String>>();
		List<Map<String, String>> list1 = pagingMap.paging(queryRightByRoleId, rows, page);
		PagingResult<Map<String, String>> pResult = new PagingResult<Map<String, String>>();
		pResult.setTotal(queryRightByRoleId.size());
		pResult.setRows(list1);
		System.out.println(pResult);
		System.out.println(queryRightByRoleId);
		return pResult;
	}

	@RequestMapping(value = "/queryRightByRoleIdNoPage")
	@ResponseBody
	public List<Map<String, String>> queryRightByRoleIdNoPage(@RequestBody String data) {
		System.out.println(data);
		String role_id = data.substring(data.indexOf("=") + 1, data.length());
		System.out.println(role_id);
		List<Map<String, String>> queryRightByRoleId = rs.queryRightByRoleId(role_id);
		System.out.println(queryRightByRoleId);
		return queryRightByRoleId;
	}
	
	@RequestMapping(value = "/querySonRightByRoleId")
	@ResponseBody
	public List<Map<String, String>> querySonRightByRoleId(@RequestBody String data) {
		System.out.println(data);
		String role_id = data.substring(data.indexOf("=") + 1, data.length());
		System.out.println(role_id);
		List<Map<String, String>> queryRightByRoleId = rs.querySonRightByRoleId(role_id);
		System.out.println(queryRightByRoleId);
		return queryRightByRoleId;
	}
	@RequestMapping("/deleteRoleRightById")
	@ResponseBody
	public String deleteRoleRightById(@RequestBody String data) {
		data = FormUtil.getURLDecoderString(data);
		System.out.println(data);
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		String roleId = datamap.get("roleId");
		String[] rightIds = datamap.get("rightIds").split(",");
		System.out.println("roleId=" + roleId);

		rs.deleteRoleRightById(roleId, rightIds);
		return "success";
	}

	@RequestMapping("/updateRoleRightById")
	@ResponseBody
	public String updateRoleRightById(@RequestBody String data) {
		data = FormUtil.getURLDecoderString(data);
		System.out.println(data);
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		String roleId = datamap.get("roleId");
		String[] rightIds = datamap.get("rightIds").split(",");
		System.out.println("roleId=" + roleId);
		rs.updateRoleRightById(roleId, rightIds);
		return "success";
	}
}