package com.dao;

import java.util.List;

import com.entity.Emp;

public interface EmpDao {
	/**
	 * 查询员工
	 */
	List<Emp> findEmp();

	/**
	 * 新增员工
	 */
	int addEmp(Emp emp);

	/**
	 * 修改员工
	 */
	int modifyEmp(Emp emp);
}