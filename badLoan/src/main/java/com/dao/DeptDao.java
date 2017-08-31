package com.dao;

import java.util.List;

import com.entity.Dept;

public interface DeptDao {
	/*
	 * 查詢部門
	 * */
	List<Dept> findDept();
	/*
	 * 新增部门
	 * */
	int addDept(Dept dept);
}
