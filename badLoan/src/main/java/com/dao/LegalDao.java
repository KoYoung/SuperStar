package com.dao;

import java.util.List;

import com.entity.Legal;

/**
 * 法人代表Dao
 * 
 * @author yang
 *
 */
public interface LegalDao {
	/**
	 * 查询所有法人代表信息
	 * 
	 * @return 法人代表信息集合
	 */
	List<Legal> findLegal();

	/**
	 * 添加法人代表信息
	 * 
	 * @param legal
	 * @return 插入成功返回1
	 */
	int addLegal(Legal legal);
}
