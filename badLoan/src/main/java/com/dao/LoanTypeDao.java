package com.dao;

import java.util.List;

import com.entity.LoanType;

public interface LoanTypeDao {
	/**
	 * 查询贷款种类
	 * 马利肖
	 * @return
	 */
	List<LoanType> findLoanType();
}
