package com.service;

import java.util.List;

import com.entity.LoanType;

public interface LoanTypeService {
	/**
	 * 查询贷款种类
	 * 马利肖
	 * @return
	 */
	List<LoanType> findLoanType();
}
