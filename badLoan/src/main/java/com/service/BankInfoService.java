package com.service;

import java.util.List;

import com.entity.BankInfo;

public interface BankInfoService {
	/**
	 * 查询所有银行信息
	 * 马利肖
	 * @return 银行信息集合
	 */
	List<BankInfo> findBankInfo();
}
