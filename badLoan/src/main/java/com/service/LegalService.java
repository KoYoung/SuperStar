package com.service;

import java.util.List;

import com.entity.Legal;

/**
 * 法人代表service
 * 
 * @author yang
 *
 */
public interface LegalService {
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
	/**
	 * 根据企业编号查询贷款企业的法人
	 */
	public Legal findLegalCom(String comId);
}
