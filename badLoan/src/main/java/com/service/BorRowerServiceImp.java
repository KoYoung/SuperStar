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
	@Override
	public int modifyBorRower(BorRower borRower, ContectUser contectUser, Contect contect) {
		int flag= BorrowerDao.addBorRowers(borRower)+ContectDao.addContecct(contect)+ContectUserDao.addContectUser(contectUser);
		return flag;
	}

	@Override
	public List<BorRower> findBorRowersMohu(String str) {
		return BorrowerDao.findBorRowersMohu(str);
	}

	@Override
	public int addBorrowers(BorRower bor, Contect contect,ContectUser contectUser) {
		BorrowerDao.addBorRowers(bor);
		ContectDao.addContecct(contect);
		ContectUserDao.addContectUser(contectUser);
		return 0;
	}
	/**
	 * 查询所有个人用户编号
	 */
	public List<BorRower> findBorId() {
		return BorrowerDao.findBorId();
	}
	
}
