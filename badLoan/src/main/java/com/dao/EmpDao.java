package com.dao;

import java.util.List;

import com.entity.Emp;

public interface EmpDao {
	/*
	 * ��ѯԱ��
	 */
	List<Emp> findEmp();
	/*
	 * ����Ա��
	 */
	int addEmp(Emp emp);
	/*
	 * �޸�Ա��
	 */
	int modifyEmp(Emp emp);
}
	