package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CompanyDao;
import com.entity.Company;
/**
 * 张少华
 * 企业基础信息
 * @author Administrator
 *
 */
@Service
public class CompanyServiceImpl implements CompanyService{
	
	@Autowired
	private CompanyDao CompanyDao;

	@Override
	public int addCompany(Company company) {
		// TODO Auto-generated method stub
		return CompanyDao.addCompany(company);
	}

	@Override
	public List<Company> findCompany() {
		// TODO Auto-generated method stub
		return CompanyDao.findCompany();
	}

	
	

}
