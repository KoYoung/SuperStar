package com.dao;

import java.util.List;

import com.entity.LoanManageRecord;
/**
 * 贷款处理记录Dao
 * @author yang kuo
 */
public interface LoanManageRecordDao {
	/**
	 * 根据贷款编号查询所有贷款处理记录
	 * @return LMR集合
	 */
	List<LoanManageRecord> findLoanManageRecord(String loaninfoId);
	/**
	 * 添加个人贷款处理记录
	 * @param lmr
	 * @return 成功返回1
	 */
	int addLoanManageRecord(LoanManageRecord lmr);
	/**
	 * 添加企业贷款处理记录
	 * @param lmr
	 * @return 成功返回1
	 */
	//int addLoanManageRecordCom(LoanManageRecord lmr);
	/**
	 * 当核销通过时，添加贷款处理记录
	 */
	int addLoanMR(LoanManageRecord loanManageRecord);
}
