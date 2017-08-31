package com.dao;

import java.util.List;

import com.entity.BorRower;

public interface BorRowerDao {
	/**
	 * 查询所有的个人用户
	 * 马利肖
	 * @return
	 */
	List<BorRower> findBorRower();
}
