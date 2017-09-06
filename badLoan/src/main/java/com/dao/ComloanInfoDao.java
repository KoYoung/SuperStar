package com.dao;

import java.util.List;

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
	 * @return 
	 */
	public void modifyComloanInfo(String empId,String comloaninfoId);
}
