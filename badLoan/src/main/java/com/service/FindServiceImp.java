package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.FindDao;
import com.entity.Find;

/**
 * @author 蒙奇·D·路飞
 * 查询Service接口实现类
 * FindServiceImp
 *
 */
@Service
public class FindServiceImp implements FindService{
	
	@Autowired
	private FindDao fd;
	
	/**
	 * 查询客户（个人）信息
	 */
	@Override
	public List<Find> findBorLoan() {
		// TODO Auto-generated method stub
		return fd.findBorLoan();
	}

	/**
	 * 查询客户（企业）信息
	 */
	@Override
	public List<Find> findComLoan() {
		// TODO Auto-generated method stub
		return fd.findComLoan();
	}

	/**
	 * 查询担保人关系表(个人)
	 */
	@Override
	public List<Find> findBorGuarantor() {
		// TODO Auto-generated method stub
		return fd.findBorGuarantor();
	}

	/**
	 * 查询担保人关系表(企业)
	 */
	@Override
	public List<Find> findComGuarantor() {
		// TODO Auto-generated method stub
		return fd.findComGuarantor();
	}

	/**
	 * 查询客户抵押物关系表(个人)
	 */
	@Override
	public List<Find> findBorPledge() {
		// TODO Auto-generated method stub
		return fd.findBorPledge();
	}

	/**
	 * 查询客户抵押物关系表(企业)
	 */
	@Override
	public List<Find> findComPledge() {
		// TODO Auto-generated method stub
		return fd.findComPledge();
	}

}
