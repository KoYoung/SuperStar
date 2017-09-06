package com.service;

import java.util.List;

import com.entity.Find;

/**
 * @author 蒙奇·D·路飞
 * 查询Service接口
 * FindService
 *
 */
public interface FindService {
	/**
	 * 查询客户（个人）信息
	 */
	public List<Find> findBorLoan();
	
	/**
	 * 查询客户（企业）信息
	 */
	public List<Find> findComLoan();
	
	/**
	 * 查询担保人关系表(个人)
	 */
	public List<Find> findBorGuarantor();
	
	/**
	 * 查询担保人关系表(企业)
	 */
	public List<Find> findComGuarantor();
	
	/**
	 * 查询客户抵押物关系表(个人)
	 */
	public List<Find> findBorPledge();
	
	/**
	 * 查询客户抵押物关系表(企业)
	 */
	public List<Find> findComPledge();
}
