package com.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.entity.Emp;
import com.service.EmpService;

/**
 * 
 *
 */
@Controller
@RequestMapping("/Emp")
public class EmpConntroller {
	@Autowired
	private EmpService es;

	@RequestMapping("/findEmp")
	@ResponseBody
	public List<Emp> findDept() {
		List<Emp> deptList = es.findEmp();
		return deptList;
	}

	@RequestMapping("/addEmp")
	@ResponseBody
	public String addEmp(Emp emp) {
		System.out.println(emp);
		int flag = es.addEmp(emp);
		if (flag > 0)
			return "success";
		else
			return "error";
	}
}
