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
	public int addBorLoanInfo(BorLoanInfo BorLoanInfo,Pledge pledge,CustomerGoods customerGoods,Guarantor guarantor,Borgua borgua
			,LoanManageRecord lmr,Loanmanage lonm) {
		String borId = BorLoanInfo.getBorId();
		customerGoods.setBorId(borId);
		borgua.setBorId(borId);
		String empId = BorLoanInfo.getEmpId();
		lmr.setEmpId(empId);
		SimpleDateFormat sd =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
		lmr.setLmrDate(sd.format(new Date()));
		BorLoanInfoDao.addBorLoanInfo(BorLoanInfo);
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
		System.out.println(BorLoanInfo.getBorId()+" "+BorLoanInfo.getLoanType()+" "+BorLoanInfo.getBankinfoId()+"/n");
		System.out.println(customerGoods.getBorId()+" "+customerGoods.getCusComment());
		return 1;
	}
	/**
	 * 查询个人用户贷款信息
	 */
	@Override
	public List<BorLoanInfo> findBorLoanInfo() {
		return BorLoanInfoDao.findBorLoanInfo();
	}

}
