package com.dao;

import java.util.List;

import com.entity.LoanType;

public interface LoanTypeDao {
	/**
	 * ��ѯ��������
	 * ����Ф
	 * @return
	 */
	List<LoanType> findLoanType();
}
