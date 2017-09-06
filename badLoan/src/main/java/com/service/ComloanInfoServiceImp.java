package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
	private ComloanInfoDao ComloanInfoDao;
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
	 * 添加企业贷款信息
	 */
	@Transactional
	@Override
	public int addComloanInfo(ComloanInfo comloanInfo,Pledge pledge,CustomerGoods customerGoods,Guarantor guarantor,Borgua borgua
			,LoanManageRecord lmr,Loanmanage lonm) {
		System.out.println(comloanInfo.toString());
		String pledgeGenre = comloanInfo.getLoanType();
		pledge.setPledgeGenre(pledgeGenre);
		String empId = comloanInfo.getEmpId();
		lmr.setEmpId(empId);
		SimpleDateFormat sd =new SimpleDateFormat("yyyy-MM-dd");
		lmr.setLmrDate(sd.format(new Date()));
		int loaninfoType = comloanInfo.getLoaninfoType();
		lonm.setLoaninfoType(loaninfoType);
		try {
		ComloanInfoDao.addComloanInfo(comloanInfo);
		System.out.println(ComloanInfoDao.toString());
		PledgeDao.addPledge(pledge);
		System.out.println(PledgeDao.toString());
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
	 * 查询企业贷款信息
	 */
	@Override
	public List<ComloanInfo> findComloanInfo() {
		return ComloanInfoDao.findComloanInfo();
	}
	/**
	 * 根据贷款编号查询贷款详情
	 */
	
	@Override
	public List<BorLoanInfo> findComloanInfo2(String comloaninfoId) {
		
		return ComloanInfoDao.findComloanInfo2(comloaninfoId);
	}
	/**
	 * 根据贷款编号修改企业业务移交相关信息
	 * @return 
	 */
	/*@Override
	public void modifyComloanInfo(String empId,String comloaninfoId) {
		ComloanInfoDao.modifyComloanInfo(empId,comloaninfoId);
		
	}*/

}
