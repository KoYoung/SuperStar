package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Dept;

public interface DeptDao {
	/**
	 * 查詢部門
	 */
	List<Map<String, String>> findDept();

	/**
	 * 新增部门
	 * 
	 * @param dept
	 * @return
	 */
	int addDept(Dept dept);
}
