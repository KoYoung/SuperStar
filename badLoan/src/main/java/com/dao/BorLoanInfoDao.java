package com.dao;

import java.util.List;
import com.entity.BorLoanInfo;

public interface BorLoanInfoDao {
	/**
	 * 添加个人用户贷款信息 
	 * 马利肖
	 * @return
	 */
	public int addBorLoanInfo(BorLoanInfo borLoanInfo);

	/**
	 * 查询个人用户贷款信息 
	 * 马利肖
	 * @return
	 */
	public List<BorLoanInfo> findBorLoanInfo();
	
	/**
	 * 查询个人用户贷款详情
	 * @return
	 */
	List<BorLoanInfo> findBorLoanDetail();
}
