package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BorLoanInfoDao;
import com.entity.BorLoanInfo;

@Service
public class BorLoanInfoServiceImp implements BorLoanInfoService {
	@Autowired
	private BorLoanInfoDao borLoanInfoDao;

	@Override
	public int addBorLoanInfo(BorLoanInfo BorLoanInfo) {
		return borLoanInfoDao.addBorLoanInfo(BorLoanInfo);
	}

	@Override
	public List<BorLoanInfo> findBorLoanInfo() {
		return borLoanInfoDao.findBorLoanInfo();
	}

	/**
	 * 查询个人用户贷款详情
	 * 
	 * @return
	 */
	@Override
	public List<Map<String, String>> findBorLoanDetail() {
		return borLoanInfoDao.findBorLoanDetail();
	}

	/**
	 * 查询某用户贷款所有详情
	 * 
	 * @return
	 */
	@Override
	public List<Map<String, String>> findDetailsById(int borloaninfoId) {
		List<Map<String, String>> borList = borLoanInfoDao.findBorLoanDetailsById(borloaninfoId);
		List<Map<String, String>> guaList = borLoanInfoDao.findGuaDetailsById(borloaninfoId);
		System.out.println("--------------------borList:" + borList + "----------------------");
		System.out.println("--------------------guaList:" + guaList + "----------------------");
		System.out.println(borList.get(0).get("BOR_ID"));
		System.out.println(borList.get(0).get("EMP_ID"));
		int borId = Integer.parseInt(borList.get(0).get("BOR_ID"));
		String empId = borList.get(0).get("EMP_ID");
		System.out.println("--------------------" + borId + "   " + empId + "----------------------");
		List<Map<String, String>> cusList = borLoanInfoDao.findCusDetailsById(borId);
		List<Map<String, String>> empList = borLoanInfoDao.findEmpDetailsById(empId);
		System.out.println("--------------------cusList:" + cusList + "----------------------");
		System.out.println("--------------------empList:" + empList + "----------------------");
		/*
		 * if(!guaList.isEmpty()){ for (Map<String, String> map : empList) {
		 * map.get(key); } }
		 */
		for (Map<String, String> map : cusList) {
			borList.add(map);
		}
		for (Map<String, String> map : empList) {
			borList.add(map);
		}
		System.out.println("borlist::::::::::::::::::::::::::::::::::::::::::::::::::" + borList);
		// String str = "{'total':3,'rows':[" + borList.get(0) + "," +
		// cusList.get(0) + "," + empList.get(0) + "]}";

		return borList;
	}

}
