package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LoanTypeDao;
import com.entity.LoanType;

@Service
public class LoanTypeServiceImp implements LoanTypeService{
	@Autowired
	private LoanTypeDao loanDao;

	@Override
	public List<LoanType> findLoanType() {
		
		return loanDao.findLoanType();
	}
	
}
