package com.service;

import java.util.List;

import com.entity.Dept;

public interface DeptService {
	/*
	 * 查询部门
	 * */
	List<Dept> findDept();
	/*
	 * 新增部门
	 * */
	int addDept(Dept dept);
	
}
