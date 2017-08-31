package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.EmpDao;
import com.entity.Emp;
@Service
public class EmpServiceImpl implements EmpService{
	@Autowired
	private EmpDao ed;
	@Override
	public List<Emp> findEmp() {
		// TODO Auto-generated method stub
		return ed.findEmp();
	}

	@Override
	public int addEmp(Emp emp) {
		// TODO Auto-generated method stub
		return ed.addEmp(emp);
	}

	@Override
	public int modifyEmp(Emp emp) {
		// TODO Auto-generated method stub
		return ed.modifyEmp(emp);
	}



}
