package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.LoanManageRecordDao;
import com.dao.LoanmanageDao;
import com.dao.WriteoffManageDao;
import com.entity.LoanManageRecord;
import com.entity.Repaymentinfo;
import com.entity.WriteoffManage;
import com.util.Paging;
import com.util.PagingResult;

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
	 * 
	 * @author Administrator
	 *
	 */
	@Override
	public PagingResult<WriteoffManage> findWriteoffManage(Integer rows, Integer page){
		List<WriteoffManage> weList = writeDao.findWriteoffManage();
		Paging<WriteoffManage> paging = new Paging<WriteoffManage>();
		List<WriteoffManage> row = paging.paging(weList, rows, page);
		PagingResult<WriteoffManage> pr = new PagingResult<WriteoffManage>();
		pr.setRows(row);
		pr.setTotal(weList.size());
		return pr;
	}
	/**
	 * 根据贷款编号查询这笔贷款的所有回收记录
	 */
	public List<Repaymentinfo> findReayment(String loaninfoId) {
		return writeDao.findReayment(loaninfoId);
	}
	/**
	 * 添加核销信息
	 */
	@Override
	@Transactional
	public String addWriteoffManage(WriteoffManage write, HttpSession session) {
		String loaninfoId = write.getLoaninfoId();
		String lmrComment = write.getOpinion();
		LoanManageRecord loanMR = new LoanManageRecord();
		loanMR.setLoaninfoId(loaninfoId);
		String empId = (String) session.getAttribute("username");
		System.out.println("empID----" + empId);
		loanMR.setEmpId(empId);
		write.setEmpId(empId);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		loanMR.setLmrDate(sd.format(new Date()));
		loanMR.setLmrComment(lmrComment);
		loanMRDao.addLoanMR(loanMR);
		loanMDao.modifyloanstateId(loaninfoId);
		int flag = writeDao.addWriteoffManage(write);
		if(flag>0){
			return "add success";
		}else{
			return "add error";
		}
	}
	/**
	 * 根据贷款编号和贷款人姓名进行模糊查询
	 */
	@Override
	public PagingResult<WriteoffManage> findWriteM(String loaninfoId, Integer rows, Integer page){
		List<WriteoffManage> wrList = writeDao.findWriteM(loaninfoId);
		Paging<WriteoffManage> paging = new Paging<WriteoffManage>();
		List<WriteoffManage> wrRows = paging.paging(wrList, rows, page);
		PagingResult<WriteoffManage> pr = new PagingResult<WriteoffManage>();
		pr.setRows(wrRows);
		pr.setTotal(wrList.size());
		return pr;
	}

}
