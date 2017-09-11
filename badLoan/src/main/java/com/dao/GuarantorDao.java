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
	 * 添加担保人信息
	 * 
	 * @author Administrator 马利肖
	 */
	int addGuarantor(Guarantor guarantor);
}
