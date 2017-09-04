package com.service;

import java.util.List;

import com.entity.Guarantor;

/**
 * 担保人service
 * 
 * @author yang
 *
 */
public interface GuarantorService {
	/**
	 * 查询担保人s
	 * 
	 * @return 担保人集合
	 */
	List<Guarantor> findGuarantor();

	/**
	 * 添加担保人
	 * 
	 * @param guarantor担保人实体
	 * @return 添加成功返回1
	 */
	int addGuarantor(Guarantor guarantor);
}
