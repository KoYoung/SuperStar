package com.dao;

import com.entity.Borgua;

public interface BorguaDao {
	/**
	 * 添加个人用户与担保人关系信息
	 */
	int addBorgua(Borgua borgua);
	/**
	 * 添加企业用户与担保人关系信息
	 */
	/*int addBorguaCom(Borgua borgua);*/
}
