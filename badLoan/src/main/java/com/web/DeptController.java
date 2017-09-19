package com.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Dept;
import com.service.DeptService;

@Controller
@RequestMapping("/deptController")
public class DeptController {
	@Autowired
	private DeptService des;

	@RequestMapping("/findDept")
	@ResponseBody
	public List<Map<String, String>> findDept() {
		List<Map<String, String>> deptList = des.findDept();
		return deptList;
	}

	@RequestMapping("/addDept")
	@ResponseBody
	public String addDept(@RequestBody Dept dept) {
		return des.addDept(dept);
	}
}
