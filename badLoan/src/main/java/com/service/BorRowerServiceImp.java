package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BorRowerDao;
import com.dao.ContectDao;
import com.dao.ContectUserDao;
import com.entity.BorRower;
import com.entity.Contect;
import com.entity.ContectUser;
/**
 * 张少华
 * 个人
 * @author Administrator
 *
 */
@Service
public class BorRowerServiceImp implements BorRowerService {
	@Autowired
	private BorRowerDao BorrowerDao;
	@Autowired
	private ContectDao  ContectDao;
	@Autowired
	private ContectUserDao ContectUserDao;
	@Override
	public List<BorRower> findBorRowers() {
		return BorrowerDao.findBorRowers();
	}

/*	@Override
	public int addBorrowers(BorRower bor, Contect contect, ContectUser contectUser) {
		// TODO Auto-generated method stub
		System.out.println("________3----------------------");
		int flag= BorrowerDao.addBorRowers(bor)+ContectDao.addContecct(contect)+ContectUserDao.addContectUser(contectUser);
		System.out.println(flag);
		System.out.println("________3----------------------");
		return flag;
	}*/
	
	
	

	@Override
	public int modifyBorRower(BorRower borRower, ContectUser contectUser, Contect contect) {
		// TODO Auto-generated method stub
		int flag= BorrowerDao.addBorRowers(borRower)+ContectDao.addContecct(contect)+ContectUserDao.addContectUser(contectUser);
		return flag;
	}

	@Override
	public List<BorRower> findBorRowersMohu(String str) {
		// TODO Auto-generated method stub
		return BorrowerDao.findBorRowersMohu(str);
	}

	@Override
	public int addBorrowers(BorRower bor, Contect contect,ContectUser contectUser) {
		// TODO Auto-generated method stub
		BorrowerDao.addBorRowers(bor);
		ContectDao.addContecct(contect);
		ContectUserDao.addContectUser(contectUser);
		return 0;
	}

	

}
