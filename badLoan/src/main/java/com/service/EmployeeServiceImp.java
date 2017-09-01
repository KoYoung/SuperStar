package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.EmployeeDao;
import com.entity.Employee;

@Service
public class EmployeeServiceImp implements EmployeeService{
	@Autowired
	private EmployeeDao eDao;
	
	/**
	 * 查询银行所有员工
	 * 马利肖
	 * @return
	 */
	public List<Employee> findAllEmployee(){
		return eDao.findAllEmployee();
	}
}
