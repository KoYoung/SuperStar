package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.LoanManageRecordDao;
import com.dao.LoanmanageDao;
import com.dao.WriteoffManageDao;
import com.entity.LoanManageRecord;
import com.entity.Repaymentinfo;
import com.entity.WriteoffManage;
@Service
public class WriteoffManageServiceImp implements WriteoffManageService {
	@Autowired
	private WriteoffManageDao writeDao;
	@Autowired
	private LoanManageRecordDao loanMRDao;
	@Autowired
	private LoanmanageDao loanMDao;
	/**
	 * 查询所有申请核销的贷款信息
	 * @author Administrator
	 *
	 */
	@Override
	public List<WriteoffManage> findWriteoffManage() {
		
		return writeDao.findWriteoffManage();
	}
	/**
	 * 根据贷款编号查询这笔贷款的所有回收记录
	 */
	public List<Repaymentinfo> findReayment(String loaninfoId){
		return writeDao.findReayment(loaninfoId);
	}
	/**
	 * 添加核销信息
	 */
	@Override
	@Transactional
	public int addWriteoffManage(WriteoffManage write) {
		String loaninfoId = write.getLoaninfoId();
		String empId = write.getEmpId();
		String lmrComment =write.getOpinion();
		System.out.println("loaninfoId---"+loaninfoId+"--empId--"+loaninfoId+"lmrComment--"+lmrComment);
		LoanManageRecord loanMR = new LoanManageRecord();
		loanMR.setLoaninfoId(loaninfoId);
		loanMR.setEmpId(empId);
		SimpleDateFormat sd =new SimpleDateFormat("yyyy-MM-dd");
		loanMR.setLmrDate(sd.format(new Date()));
		loanMR.setLmrComment(lmrComment);
		loanMRDao.addLoanMR(loanMR);
		loanMDao.modifyloanstateId(loaninfoId);
		return writeDao.addWriteoffManage(write);
	}
	

}
