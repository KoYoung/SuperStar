package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LoanManageRecordDao;
import com.dao.LoanmanageDao;
import com.entity.LoanManageRecord;

/**
 * 贷款处理记录service接口实现类
 * 
 * @author yang kuo
 */
@Service
public class LoanManageRecordServiceImple implements LoanManageRecordService {
	@Autowired
	private LoanManageRecordDao lmrDao;
	@Autowired
	private LoanmanageDao loanDao;

	/**
	 * 查询所有贷款处理记录
	 * 
	 * @return LMR集合
	 */
	@Override
	public List<LoanManageRecord> findLoanManageRecord(String loaninfoId) {

		return lmrDao.findLoanManageRecord(loaninfoId);
	}

	/**
	 * 添加一条贷款处理记录
	 * 
	 * @param lmr
	 * @return 成功返回1
	 */
	@Override
	public int addLoanManageRecord(LoanManageRecord lmr) {
		return lmrDao.addLoanManageRecord(lmr);
	}

	/**
	 * 当核销通过时，添加贷款处理记录
	 */

	@Override
	public int addLoanMR(LoanManageRecord loanManageRecord) {
		
		return lmrDao.addLoanMR(loanManageRecord);
	}
	/**
	 * 当核销驳回时，添加贷款处理记录
	 */

	@Override
	public int addLoanMRBo(LoanManageRecord loanManageRecord,HttpSession session) {
		String loaninfoId = loanManageRecord.getLoaninfoId();
		String empId = (String) session.getAttribute("username");
		loanManageRecord.setEmpId(empId);
		SimpleDateFormat sd =new SimpleDateFormat("yyyy-MM-dd");
		loanManageRecord.setLmrDate(sd.format(new Date()));
		
		System.out.println(loanManageRecord.toString());
		loanDao.modifyloanstateIdBo(loaninfoId);
		return lmrDao.addLoanMRBo(loanManageRecord);
	}
}