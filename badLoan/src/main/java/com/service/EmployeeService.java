package com.service;

import java.util.List;

import com.entity.Employee;

public interface EmployeeService {
	/**
	 * 根据银行编号查询银行所有员工 马利肖
	 * 
	 * @return
	 */
	List<Employee> findAllEmployee(String empBankinfo);
}
