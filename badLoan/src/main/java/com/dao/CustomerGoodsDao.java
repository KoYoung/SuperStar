package com.dao;

import com.entity.CustomerGoods;

public interface CustomerGoodsDao {
	/**
	 * 添加客户抵押物关系表
	 */
	int addCustomerGoods(CustomerGoods customerGoods);
}
