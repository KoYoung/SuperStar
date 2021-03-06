package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.BorLoanInfo;
import com.entity.ComloanInfo;

public interface ComloanInfoDao {
	/**
	 * 添加企业贷款信息
	 */
	int addComloanInfo(ComloanInfo comloanInfo);

	/**
	 * 查询企业贷款信息
	 */
	List<ComloanInfo> findComloanInfo();

	/**
	 * 根据贷款编号查询贷款详情
	 */
	List<BorLoanInfo> findComloanInfo2(String comloaninfoId);

	/**
	 * 根据贷款编号修改企业业务移交相关信息
	 * 
	 * @return
	 */
	public void modifyComloanInfo(String empId, String comloaninfoId);

	/**
	 * 合同编号唯一性验证
	 */
	List<ComloanInfo> findContractIdCom(String contractId);

	/**
	 * 查询企业贷款
	 */
	List<Map<String, String>> findComLoan(Map<String, String> datamap);

	/**
	 * 添加修改记录
	 * 
	 * @param datamap
	 */
	void addLmr(Map<String, String> datamap);

	/**
	 * 修改贷款状态
	 * 
	 * @param datamap
	 */
	void modifyLoanState(Map<String, String> datamap);

	/**
	 * 修改未还金额
	 * 
	 * @param datamap
	 */
	void modifyUnrepayNumber(Map<String, String> datamap);

	/**
	 * 添加回收信息 修改未还金额
	 * 
	 * @param datamap
	 */
	void addRepaymentinfo(Map<String, String> datamap);
}
