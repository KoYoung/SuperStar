package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LoanStateDao;

@Service
public class LoanStateServiceImpl implements LoanStateService {
	@Autowired
	private LoanStateDao loanStateDao;

	public List<Map<String, String>> findAllLoanState() {
		return loanStateDao.findAllLoanState();
	}

	public List<Map<String, String>> findLoanState() {
		return loanStateDao.findLoanState();
	}

}
