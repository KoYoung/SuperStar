package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.dao.BorguaDao;
import com.dao.ComloanInfoDao;
import com.dao.CustomerGoodsDao;
import com.dao.GuarantorDao;
import com.dao.LoanManageRecordDao;
import com.dao.LoanmanageDao;
import com.dao.PledgeDao;
import com.entity.BorLoanInfo;
import com.entity.Borgua;
import com.entity.ComloanInfo;
import com.entity.CustomerGoods;
import com.entity.Guarantor;
import com.entity.LoanManageRecord;
import com.entity.Loanmanage;
import com.entity.Pledge;

@Service
public class ComloanInfoServiceImp implements ComloanInfoService {
	@Autowired
	private ComloanInfoDao comloanInfoDao;
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

	/**
	 * 添加企业贷款信息
	 */
	@Transactional
	public int addComloanInfo(ComloanInfo comloanInfo, Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor,
			Borgua borgua, LoanManageRecord lmr, Loanmanage lonm) {
		System.out.println(comloanInfo.toString());
		String pledgeGenre = comloanInfo.getLoanType();
		int unrepayNumber = Integer.parseInt(comloanInfo.getLoanNumber());
		comloanInfo.setUnrepayNumber(unrepayNumber);
		pledge.setPledgeGenre(pledgeGenre);
		String empId = comloanInfo.getEmpId();
		lmr.setEmpId(empId);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		lmr.setLmrDate(sd.format(new Date()));
		int loaninfoType = comloanInfo.getLoaninfoType();
		lonm.setLoaninfoType(loaninfoType);
		try {
			comloanInfoDao.addComloanInfo(comloanInfo);
			System.out.println(comloanInfoDao.toString());
			pledgeDao.addPledge(pledge);
			System.out.println(pledgeDao.toString());
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
	 * 查询企业贷款信息
	 */
	@Override
	public List<ComloanInfo> findComloanInfo() {
		return comloanInfoDao.findComloanInfo();
	}

	/**
	 * 根据贷款编号查询贷款详情
	 */

	@Override
	public List<BorLoanInfo> findComloanInfo2(String comloaninfoId) {

		return comloanInfoDao.findComloanInfo2(comloaninfoId);
	}

	/**
	 * 根据贷款编号修改企业业务移交相关信息
	 * 
	 * @return 合同编号唯一性验证
	 */
	/*
	 * @Override public void modifyComloanInfo(String empId,String
	 * comloaninfoId) { ComloanInfoDao.modifyComloanInfo(empId,comloaninfoId);
	 * 
	 * }
	 */
	@Override
	public List<ComloanInfo> findContractIdCom(String contractId) {

		return comloanInfoDao.findContractIdCom(contractId);
	}

	@Override
	public List<Map<String, String>> findComLoan(Map<String, String> datamap) {
		return comloanInfoDao.findComLoan(datamap);
	}

	@Transactional
	public void modifyComState(Map<String, String> datamap) {
		comloanInfoDao.addLmr(datamap);
		comloanInfoDao.modifyLoanState(datamap);
	}

	@Transactional
	public void applyWriteOff(Map<String, String> datamap) {
		comloanInfoDao.addLmr(datamap);
		comloanInfoDao.modifyLoanState(datamap);
	}

	@Transactional
	public void updateUnrepayNumber(Map<String, String> datamap) {
		comloanInfoDao.addRepaymentinfo(datamap);
		comloanInfoDao.modifyUnrepayNumber(datamap);
	}

}
