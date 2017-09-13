package com.dao;

import java.util.List;

import com.entity.LoanType;

public interface LoanTypeDao {
	/**
	 * 查询个人贷款种类 马利肖
	 * 
	 * @return
	 */
	List<LoanType> findLoanType();

	/**
	 * 查询企业贷款种类 马利肖
	 * 
	 * @return
	 */
	List<LoanType> findComLoanType();
}
