package com.service;

import java.util.List;

import com.entity.Guarantor;

public interface GuarantorService {
	/**
	 * 手机号唯一性校验
	 * @author Administrator
	 * 马利肖
	 */
	List<Guarantor> findguaPhone(String guaPhone);
	/**
	 * 证件号唯一性校验
	 * @author Administrator
	 * 马利肖
	 */
	List<Guarantor> findguaCardNumber(String guaCardNumber);
}
