package com.service;

import java.util.List;
import java.util.Map;

import com.entity.BorLoanInfo;

public interface BorLoanInfoService {
	/**
	 * 添加个人用户贷款信息
	 * 马利肖
	 * @return
	 */
	int addBorLoanInfo(BorLoanInfo BorLoanInfo);
	/**
	 * 查询个人用户贷款信息
	 * 马利肖
	 * @return
	 */
	List<BorLoanInfo> findBorLoanInfo();
	
	/**
	 * 查询个人用户贷款详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findBorLoanDetail();
	
	/**
	 * 查询个人用户所有贷款详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findDetailsById(int borloaninfoId);
}
