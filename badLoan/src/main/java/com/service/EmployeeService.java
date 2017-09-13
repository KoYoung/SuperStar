package com.service;

import java.util.List;

import com.entity.Employee;

public interface EmployeeService {
	/**
	 * 查询银行所有员工 马利肖
	 * 
	 * @return
	 */
	List<Employee> findAllEmployee();

	/**
	 * 查询银行所有员工 马利肖
	 * 
	 * @return
	 */
	List<Employee> findAllEmployee(String empBankinfo);
}
