package com.dao;

import java.util.List;

import com.entity.Dept;

public interface DeptDao {
	/*
	 * ��ԃ���T
	 * */
	List<Dept> findDept();
	/*
	 * ��������
	 * */
	int addDept(Dept dept);
}
