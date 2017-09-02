package com.dao;

import java.util.List;

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
}
