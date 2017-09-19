package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Dept;

public interface DeptService {
	/**
	 * 查询部门
	 */
	List<Map<String, String>> findDept();

	/**
	 * 新增部门
	 */
	String addDept(Dept dept);

}
