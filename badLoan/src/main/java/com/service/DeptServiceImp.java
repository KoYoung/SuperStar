package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DeptDao;
import com.entity.Dept;

@Service
public class DeptServiceImp implements DeptService {
	@Autowired
	private DeptDao ded;

	@Override
	public List<Map<String, String>> findDept() {
		return ded.findDept();
	}

	@Override
	public String addDept(Dept dept) {
		int flag =  ded.addDept(dept);
		if(flag!=0){
			return "success";
		}else{
			return "error";
		}
	}

}
