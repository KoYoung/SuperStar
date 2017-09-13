package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	private BorLoanInfoDao borLoanInfoDao;
	@Autowired
	private PledgeDao pledgeDao;
	@Autowired
	private CustomerGoodsDao customerGoodsDao;
	@Autowired
	private GuarantorDao guarantorDao;
	@Autowired
	private BorguaDao borguaDao;
	@Autowired
	private LoanManageRecordDao loanManageRecordDao;
	@Autowired
	private LoanmanageDao loanmanageDao;

	@Override
	public List<BorLoanInfo> findBorLoanInfo() {
		return borLoanInfoDao.findBorLoanInfo();
	}

	/**
	 * 查询个人用户贷款详情
	 * 
	 * @return
	 */
	@Override
	public List<Map<String, String>> findBorLoanDetail() {
		return borLoanInfoDao.findBorLoanDetail();
	}

	/**
	 * 查询某用户贷款所有详情
	 * 
	 * @return
	 */
	@Override
	public List<Map<String, String>> findDetailsById(int borloaninfoId) {
		List<Map<String, String>> borList = borLoanInfoDao.findBorLoanDetailsById(borloaninfoId);
		List<Map<String, String>> guaList = borLoanInfoDao.findGuaDetailsById(borloaninfoId);
		System.out.println("--------------------borList:" + borList + "----------------------");
		System.out.println("--------------------guaList:" + guaList + "----------------------");
		System.out.println(borList.get(0).get("BOR_ID"));
		System.out.println(borList.get(0).get("EMP_ID"));
		int borId = Integer.parseInt(borList.get(0).get("BOR_ID"));
		String empId = borList.get(0).get("EMP_ID");
		System.out.println("--------------------" + borId + "   " + empId + "----------------------");
		List<Map<String, String>> cusList = borLoanInfoDao.findCusDetailsById(borId);
		List<Map<String, String>> empList = borLoanInfoDao.findEmpDetailsById(empId);
		System.out.println("--------------------cusList:" + cusList + "----------------------");
		System.out.println("--------------------empList:" + empList + "----------------------");
		for (Map<String, String> map : cusList) {
			borList.add(map);
		}
		for (Map<String, String> map : empList) {
			borList.add(map);
		}
		return borList;
	}

	/**
	 * 添加个人用户贷款信息
	 */
	@Transactional
	public int addBorLoanInfo(BorLoanInfo borLoanInfo, Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor,
			Borgua borgua, LoanManageRecord lmr, Loanmanage lonm) {
				String pledgeGenre = borLoanInfo.getLoanType();
		int unrepayNumber = Integer.parseInt(borLoanInfo.getLoanNumber());
		borLoanInfo.setUnrepayNumber(unrepayNumber);
		pledge.setPledgeGenre(pledgeGenre);
		String empId = borLoanInfo.getEmpId();
		lmr.setEmpId(empId);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		lmr.setLmrDate(sd.format(new Date()));
		int loaninfoType = borLoanInfo.getLoaninfoType();
		lonm.setLoaninfoType(loaninfoType);
		try {
			borLoanInfoDao.addBorLoanInfo(borLoanInfo);
			pledgeDao.addPledge(pledge);
			customerGoodsDao.addCustomerGoods(customerGoods);
			guarantorDao.addGuarantor(guarantor);
			borguaDao.addBorgua(borgua);
			loanManageRecordDao.addLoanManageRecord(lmr);
			loanmanageDao.addLoanmanage(lonm);

		} catch (Exception e) {
			System.out.println("---------------------------------------" + e.getMessage());
			return 0;
		}
		return 1;
	}

	/**
	 * 根据贷款类型，贷款编号查询贷款信息
	 */
	@Override
	public List<BorLoanInfo> findBorLoanInfo2(String borloaninfoId) {

		return borLoanInfoDao.findBorLoanInfo2(borloaninfoId);
	}

	@Transactional
	public void modifyLoanState(Map<String, String> datamap) {
		borLoanInfoDao.addLoanManageRecordMap(datamap);
		borLoanInfoDao.modifyLoanStateMap(datamap);
	}

	@Override
	public List<Map<String, String>> findBorSearch(Map<String, String> datamap) {
		return borLoanInfoDao.findBorSearch(datamap);
	}

	/**
	 * 合同编号唯一性验证
	 */
	@Override
	public List<BorLoanInfo> findcontractId(String contractId) {

		return borLoanInfoDao.findcontractId(contractId);
	}

	/**
	 * 申请核销
	 * 
	 * @param datamap
	 */
	@Transactional
	public void applyWriteOff(Map<String, String> datamap) {
		borLoanInfoDao.addLoanManageRecordMap(datamap);
		borLoanInfoDao.modifyLoanStateMap(datamap);
	}

	/**
	 * 登记回收信息
	 */
	@Transactional
	public void updateUnrepayNumber(Map<String, String> datamap) {
		borLoanInfoDao.addRepaymentinfo(datamap);
		borLoanInfoDao.modifyUnrepayNumber(datamap);
	}
}