package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BorLoanInfoDao;
import com.dao.BorguaDao;
import com.dao.CustomerGoodsDao;
import com.dao.GuarantorDao;
import com.dao.LoanManageRecordDao;
import com.dao.LoanmanageDao;
import com.dao.PledgeDao;
import com.entity.BorLoanInfo;
import com.entity.Borgua;
import com.entity.CustomerGoods;
import com.entity.Guarantor;
import com.entity.LoanManageRecord;
import com.entity.Loanmanage;
import com.entity.Pledge;
@Service
public class BorLoanInfoServiceImp implements BorLoanInfoService {
	@Autowired
	private BorLoanInfoDao BorLoanInfoDao;
	@Autowired
	private PledgeDao PledgeDao;
	@Autowired
	private CustomerGoodsDao customerGoodsDao;
	@Autowired
	private GuarantorDao GuarantorDao;
	@Autowired
	private BorguaDao borguaDao;
	@Autowired
	private LoanManageRecordDao LoanManageRecordDao;
	@Autowired
	private LoanmanageDao LoanmanageDao;
	/**
	 * 添加个人用户贷款信息
	 */
	@Transactional
	public int addBorLoanInfo(BorLoanInfo borLoanInfo,Pledge pledge,CustomerGoods customerGoods,Guarantor guarantor,Borgua borgua
			,LoanManageRecord lmr,Loanmanage lonm) {
		System.out.println("银行id----"+borLoanInfo.getBankinfoId());
		String pledgeGenre = borLoanInfo.getLoanType();
		System.out.println("担保人："+" "+pledgeGenre);
		pledge.setPledgeGenre(pledgeGenre);
		String empId = borLoanInfo.getEmpId();
		lmr.setEmpId(empId);
		SimpleDateFormat sd =new SimpleDateFormat("yyyy-MM-dd");
		lmr.setLmrDate(sd.format(new Date()));
		int loaninfoType = borLoanInfo.getLoaninfoType();
		lonm.setLoaninfoType(loaninfoType);
		try {
		BorLoanInfoDao.addBorLoanInfo(borLoanInfo);
		PledgeDao.addPledge(pledge);
		customerGoodsDao.addCustomerGoods(customerGoods);
		GuarantorDao.addGuarantor(guarantor);
		borguaDao.addBorgua(borgua);
		LoanManageRecordDao.addLoanManageRecord(lmr);
		LoanmanageDao.addLoanmanage(lonm);
		
		} catch (Exception e) {
			System.out.println("---------------------------------------"+e.getMessage());
			return 0;
		}
		return 1;
	}
	/**
	 * 查询个人用户贷款信息
	 */
	@Override
	public List<BorLoanInfo> findBorLoanInfo() {
		return BorLoanInfoDao.findBorLoanInfo();
	}
	/**
	 * 根据贷款类型，贷款编号查询贷款信息
	 */
	@Override
	public List<BorLoanInfo> findBorLoanInfo2(String borloaninfoId) {
		
		return BorLoanInfoDao.findBorLoanInfo2(borloaninfoId);
	}
	/**
	 * 根据贷款编号修改业务移交相关信息
	 * @return 
	 */
	/*@Override
	public void modifyBorLoanInfo(String empId,String borloaninfoId) {
		BorLoanInfoDao.modifyBorLoanInfo(empId,borloaninfoId);
		
		
	}*/

}
