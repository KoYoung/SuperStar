package com.dao;

import java.util.List;

import com.entity.BankInfo;

public interface BankInfoDao {
	/**
	 * 查询所有银行信息
	 * 马利肖
	 * @return
	 */
	List<BankInfo> findBankInfo();
	public int addBankInfo(BankInfo bankInfo);
}
