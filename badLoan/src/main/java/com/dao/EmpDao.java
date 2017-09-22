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
	int modifyEmp(Emp empId);

	/**
	 * 员工详情中的查看
	 */
	List<Emp> findIdEmp(Emp empId);

	/**
	 * 员工启用
	 * @param string员工编号
	 */
	void enableEmp(String empFlag,String empId);
}