package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Employee;
import com.service.EmployeeService;
@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	private EmployeeService eService;

	/**
	 * 查询银行所有员工
	 * 马利肖
	 * @return
	 */
	@RequestMapping("/findAllEmployee")
	@ResponseBody
	public List<Employee> findAllEmployee(){
		System.out.println("111-------------------");
		List<Employee> eList = eService.findAllEmployee();
		return eList;
	}
}
