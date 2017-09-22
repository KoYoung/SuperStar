package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.EmpDao;
import com.entity.Emp;

@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpDao ed;

	public List<Emp> findEmp() {
		return ed.findEmp();
	}

	public int addEmp(Emp emp) {
		return ed.addEmp(emp);
	}

	public int modifyEmp(Emp empId) {
		return ed.modifyEmp(empId);
	}

	public List<Emp> findIdEmp(Emp empId) {
		return ed.findIdEmp(empId);
	}

	public void enableEmp(String data) {
		String empFlag = "";
		String empId = "";
		ed.enableEmp(empFlag,empId);
	}
}
