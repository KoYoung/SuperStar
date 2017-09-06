package com.dao;

import com.entity.CustomerGoods;

public interface CustomerGoodsDao {
	/**
	 * 添加客户抵押物关系表
	 */
	int addCustomerGoods(CustomerGoods customerGoods);
	/**
	 * 添加企业客户抵押物关系表
	 */
	/*int addCustomerGoodsCom(CustomerGoods customerGoods);*/
}
