package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BorrowerDao;
import com.entity.BorRower;
@Service
public class BorRowerServiceImp implements BorRowerService{
	@Autowired
	private BorrowerDao BorrowerDao;
	
	
	@Override
	public List<BorRower> findBorRowers() {
		// TODO Auto-generated method stub
		return BorrowerDao.findBorrowers();
	}

	@Override
	public int updataBorrowers(BorRower bor) {
		// TODO Auto-generated method stub
		return BorrowerDao.updataBorrowers(bor);
	}

}
