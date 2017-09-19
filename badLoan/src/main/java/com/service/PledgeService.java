package com.service;

import java.util.List;

import com.entity.Pledge;

public interface PledgeService {
	/**
	 * 根据贷款编号查询抵押物信息
	 */
	List<Pledge> findPledge(String loaninfoId);
}
