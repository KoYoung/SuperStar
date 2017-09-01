package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BorRowerDao;
import com.entity.BorRower;

@Service
public class BorRowerServiceImp implements BorRowerService {
	@Autowired
	private BorRowerDao BorrowerDao;

	@Override
	public List<BorRower> findBorRowers() {
		return BorrowerDao.findBorRowers();
	}

	@Override
	public int addBorrowers(BorRower bor) {
		return BorrowerDao.addBorRowers(bor);
	}

}
