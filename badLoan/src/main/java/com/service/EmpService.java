package com.service;

import java.util.List;

import com.entity.Emp;

public interface EmpService {
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
