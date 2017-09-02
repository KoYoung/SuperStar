package com.dao;

import com.entity.Borgua;

public interface BorguaDao {
	/**
	 * 添加客户与担保人关系
	 */
	int addBorgua(Borgua borgua);
}
