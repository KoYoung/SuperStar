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
	/**
	 * 核销通过后，改变贷款状态为8
	 * @param loaninfoId
	 */
	public void modifyloanstateId(String loaninfoId);
	/**
	 * 核销驳回后，改变贷款状态为9
	 * @param loaninfoId
	 */
	public void modifyloanstateIdBo(String loaninfoId);
}
