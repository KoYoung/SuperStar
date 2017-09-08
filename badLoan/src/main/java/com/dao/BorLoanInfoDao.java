package com.dao;

import java.util.List;

import com.entity.BorLoanInfo;

public interface BorLoanInfoDao {
	/**
	 * 添加个人用户贷款信息 马利肖
	 * 
	 * @return
	 */
	public int addBorLoanInfo(BorLoanInfo borLoanInfo);

	/**
	 * 查询个人用户贷款信息 马利肖
	 * 
	 * @return
	 */
	public List<BorLoanInfo> findBorLoanInfo();
	/**
	 * 根据贷款类型，贷款编号查询贷款信息
	 */
	List<BorLoanInfo> findBorLoanInfo2(String borloaninfoId);
	/**
	 * 根据贷款编号修改业务移交相关信息
	 * @return 
	 */
	public void modifyBorLoanInfo(String empId,String borloaninfoId);
	/**
	 * 合同编号唯一性验证
	 */
	List<BorLoanInfo> findcontractId(String contractId);
}
