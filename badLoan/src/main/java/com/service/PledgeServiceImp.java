package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PledgeDao;
import com.entity.Pledge;
@Service
public class PledgeServiceImp implements PledgeService {
	@Autowired
	private PledgeDao PledgeDao;
	/**
	 * 根据贷款编号查询抵押物信息
	 */
	@Override
	public List<Pledge> findPledge(String loaninfoId) {
		return PledgeDao.findPledge(loaninfoId);
	}

}
