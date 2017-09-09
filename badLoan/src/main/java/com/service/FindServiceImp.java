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
	public List<Find> findBorGuarantor(String borloaninfoId) {
		// TODO Auto-generated method stub
		return fd.findBorGuarantor(borloaninfoId);
	}

	/**
	 * 查询担保人关系表(企业)
	 */
	@Override
	public List<Find> findComGuarantor(String comloaninfoId) {
		// TODO Auto-generated method stub
		return fd.findComGuarantor(comloaninfoId);
	}

	/**
	 * 查询客户抵押物关系表(个人)
	 */
	@Override
	public List<Find> findBorPledge(String borloaninfoId) {
		// TODO Auto-generated method stub
		return fd.findBorPledge(borloaninfoId);
	}

	/**
	 * 查询客户抵押物关系表(企业)
	 */
	@Override
	public List<Find> findComPledge(String comloaninfoId) {
		// TODO Auto-generated method stub
		return fd.findComPledge(comloaninfoId);
	}

	/**
	 * 查询所有担保人
	 */
	@Override
	public List<Find> findGuarantor() {
		// TODO Auto-generated method stub
		return fd.findGuarantor();
	}

	/**
	 * 查询某个担保人所担保的个人项目
	 */
	@Override
	public List<Find> findGuarantorBor(String guaId) {
		// TODO Auto-generated method stub
		return fd.findGuarantorBor(guaId);
	}
	
	/**
	 * 查询某个担保人所担保的企业项目
	 */
	@Override
	public List<Find> findGuarantorCom(String guaId) {
		// TODO Auto-generated method stub
		return fd.findGuarantorCom(guaId);
	}

	/**
	 * 查询所有经手人
	 */
	@Override
	public List<Find> findEmp() {
		// TODO Auto-generated method stub
		return fd.findEmp();
	}

	/**
	 * 查询某个经手人所经手的个人项目
	 */
	@Override
	public List<Find> findEmpBor(String empId) {
		// TODO Auto-generated method stub
		return fd.findEmpBor(empId);
	}
	
	/**
	 * 查询某个经手人所经手的企业项目
	 */
	@Override
	public List<Find> findEmpCom(String empId){
		// TODO Auto-generated method stub
		return fd.findEmpCom(empId);
	}

}
