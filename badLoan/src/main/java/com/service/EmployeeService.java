package com.service;

import java.util.List;

import com.entity.Employee;

public interface EmployeeService {
	/**
	 * ��ѯ��������Ա��
	 * ����Ф
	 * @return
	 */
	List<Employee> findAllEmployee();
}
