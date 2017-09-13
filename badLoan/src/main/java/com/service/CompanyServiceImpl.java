package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CompanyDao;
import com.dao.ConpanyLegalDao;
import com.dao.ContectUserDao;
import com.dao.GuarantorDao;
import com.dao.LegalDao;
import com.entity.Company;
import com.entity.ConpanyLegal;
import com.entity.ContectUser;
import com.entity.Guarantor;
import com.entity.Legal;

/**
 * 张少华 企业基础信息
 * 
 * @author Administrator
 *
 */
@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDao CompanyDao;
	@Autowired
	private ConpanyLegalDao conpanyLegalDao;
	@Autowired
	private LegalDao legalDao;

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

	@Override
	public List<Company> findCompanmohu(String string) {
		// TODO Auto-generated method stub
		return CompanyDao.findCompanmohu(string);
	}

	@Override
	public int addCompany(Company company, Legal legal, ConpanyLegal conpanyLegal) {
		// TODO Auto-generated method stub
		CompanyDao.addCompany(company);
		legalDao.addLegal(legal);
		conpanyLegalDao.addConpanyLegal(conpanyLegal);
		return 0;

	}
	/**
	 * 查询所有企业用户编号
	 */
	@Override
	public List<Company> findCompanyId() {
		return CompanyDao.findCompanyId();
	}
}
