package com.dao;

import java.util.List;

import com.entity.Employee;

public interface EmployeeDao {
	/**
	 * ��ѯ��������Ա��
	 * ����Ф
	 * @return
	 */
	List<Employee> findAllEmployee();
}
