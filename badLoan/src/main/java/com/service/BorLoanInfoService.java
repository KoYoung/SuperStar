package com.service;

import java.util.List;

import com.dao.BorLoanInfoDao;
import com.entity.BorLoanInfo;



public interface BorLoanInfoService {
	/**
	 * ��Ӹ����û�������Ϣ
	 * ����Ф
	 * @return
	 */
	int addBorLoanInfo(BorLoanInfo BorLoanInfo);
	/**
	 * ��ѯ�����û�������Ϣ
	 * ����Ф
	 * @return
	 */
	List<BorLoanInfo> findBorLoanInfo();
}
