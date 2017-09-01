package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DeptDao;
import com.entity.Dept;

@Service
public class DeptServiceImp implements DeptService {
	@Autowired
	private DeptDao ded;

	@Override
	public List<Dept> findDept() {
		return ded.findDept();
	}

	@Override
	public int addDept(Dept dept) {
		return ded.addDept(dept);
	}

}
