package com.service;

import java.util.List;

import com.entity.LoanType;

public interface LoanTypeService {
	/**
	 * ��ѯ��������
	 * ����Ф
	 * @return
	 */
	List<LoanType> findLoanType();
}
