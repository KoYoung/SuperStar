package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BorrowerDao;
import com.entity.Borrower;
@Service
public class BorrowerServiceImp implements BorrowerService{
	@Autowired
	private BorrowerDao BorrowerDao;
	
	
	@Override
	public List<Borrower> findBorrowers() {
		// TODO Auto-generated method stub
		return BorrowerDao.findBorrowers();
	}

	@Override
	public int updataBorrowers(Borrower bor) {
		// TODO Auto-generated method stub
		return BorrowerDao.updataBorrowers(bor);
	}

}
