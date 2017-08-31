package com.service;

import java.util.List;

import com.entity.LoanManageRecord;
/**
 * 贷款处理记录service接口
 * @author yang kuo
 */
public interface LoanManageRecordService {
	/**
	 * 查询所有贷款处理记录
	 * 
	 * @return LMR集合
	 */
	List<LoanManageRecord> findLoanManageRecord();

	/**
	 * 添加一条贷款处理记录
	 * 
	 * @param lmr
	 * @return 成功返回1
	 */
	int addLoanManageRecord(LoanManageRecord lmr);
}
