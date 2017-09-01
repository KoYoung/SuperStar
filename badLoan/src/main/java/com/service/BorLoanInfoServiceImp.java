package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BorLoanInfoDao;
import com.entity.BorLoanInfo;
@Service
public class BorLoanInfoServiceImp implements BorLoanInfoService {
	@Autowired
	private BorLoanInfoDao BorLoanInfoDao;
	@Override
	public int addBorLoanInfo(BorLoanInfo BorLoanInfo) {
		return BorLoanInfoDao.addBorLoanInfo(BorLoanInfo);
	}

	@Override
	public List<BorLoanInfo> findBorLoanInfo() {
		return BorLoanInfoDao.findBorLoanInfo();
	}

}
