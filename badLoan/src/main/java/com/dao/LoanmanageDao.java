package com.dao;

import com.entity.Loanmanage;

public interface LoanmanageDao {
	/**
	 * 添加个人贷款处理状态
	 */
	int addLoanmanage(Loanmanage lonm);
	/**
	 * 添加企业贷款处理状态
	 */
	/*int addLoanmanageCom(Loanmanage lonm);*/
}
