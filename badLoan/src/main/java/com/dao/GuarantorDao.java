package com.dao;

import java.util.List;

import com.entity.Guarantor;

/**
 * 担保人实体类
 * 
 * @author yang
 *
 */
public interface GuarantorDao {
	/**
	 * 查询担保人
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
