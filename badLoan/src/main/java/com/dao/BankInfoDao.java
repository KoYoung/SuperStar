package com.dao;

import java.util.List;

import com.entity.BankInfo;

public interface BankInfoDao {
	/**
	 * ��ѯ����������Ϣ
	 * ����Ф
	 * @return
	 */
	List<BankInfo> findBankInfo();
}
