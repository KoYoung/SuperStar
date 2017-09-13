package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.entity.LoanManageRecord;

/**
 * 贷款处理记录service接口
 * 
 * @author yang kuo
 */
public interface LoanManageRecordService {
	/**
	 * 查询所有贷款处理记录
	 * 
	 * @return LMR集合
	 */
	List<LoanManageRecord> findLoanManageRecord(String loaninfoId);

	/**
	 * 添加一条贷款处理记录
	 * 
	 * @param lmr
	 * @return 成功返回1
	 */
	int addLoanManageRecord(LoanManageRecord lmr);

	/**
	 * 当核销通过时，添加贷款处理记录
	 */
	int addLoanMR(LoanManageRecord loanManageRecord);
	/**
	 * 当核销驳回时，添加贷款处理记录
	 */
	int addLoanMRBo(LoanManageRecord loanManageRecord,HttpSession session);
}
