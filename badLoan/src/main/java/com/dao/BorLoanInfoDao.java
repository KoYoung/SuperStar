package com.dao;

import java.util.List;

import com.entity.BorLoanInfo;





public interface BorLoanInfoDao {
	/**
	 * ��Ӹ����û�������Ϣ
	 * ����Ф
	 * @return
	 */
	public int addBorLoanInfo(BorLoanInfo borLoanInfo);
	/**
	 * ��ѯ�����û�������Ϣ
	 * ����Ф
	 * @return
	 */
	public List<BorLoanInfo> findBorLoanInfo();
}
