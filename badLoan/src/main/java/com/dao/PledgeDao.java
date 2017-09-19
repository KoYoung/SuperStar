package com.dao;

import java.util.List;

import com.entity.Pledge;

public interface PledgeDao {
	/**
	 * 添加抵押物品信息
	 * 马利肖
	 */
	int addPledge(Pledge pledge);
	/**
	 * 根据贷款编号查询抵押物信息
	 */
	List<Pledge> findPledge(String loaninfoId);
}
