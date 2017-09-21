package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.EmpDao;
import com.entity.Emp;

@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpDao ed;

	@Override
	public List<Emp> findEmp() {
		return ed.findEmp();
	}

	@Override
	public int addEmp(Emp emp) {
		return ed.addEmp(emp);
	}

	@Override
	public int modifyEmp(Emp empId) {
		return ed.modifyEmp(empId);
	}

	@Override
	public List<Emp> findIdEmp(Emp empId) {
		// TODO Auto-generated method stub
		return ed.findIdEmp(empId);
	}
	
}
