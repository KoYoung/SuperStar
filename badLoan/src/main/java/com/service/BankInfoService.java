package com.service;

import java.util.List;

import com.entity.BankInfo;

public interface BankInfoService {
	/**
	 * ��ѯ����������Ϣ
	 * ����Ф
	 * @return
	 */
	List<BankInfo> findBankInfo();
}
