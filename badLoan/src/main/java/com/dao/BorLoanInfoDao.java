package com.dao;

import java.util.List;
import java.util.Map;

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
	 * 查询个人用户贷款详情
	 * 
	 * @return
	 */
	List<Map<String, String>> findBorLoanDetail();

	/**
	 * 根据ID查询贷款详情
	 * @return
	 */
	List<Map<String, String>> findBorLoanDetailsById(int borloaninfoId);
	/**
	 * 根据id查询客户详情
	 * @return
	 */
	List<Map<String, String>> findCusDetailsById(int borId);
	/**
	 * 根据id查询员工详情
	 * @return
	 */
	List<Map<String, String>> findEmpDetailsById(String empId);
	/**
	 * 根据id查询担保人详情
	 * @return
	 */
	List<Map<String, String>> findGuaDetailsById(int guaId);
}