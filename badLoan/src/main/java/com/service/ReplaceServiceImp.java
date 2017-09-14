package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BorLoanInfoDao;
import com.dao.ComloanInfoDao;
import com.dao.ReplaceDao;
import com.entity.Replace;
import com.util.Paging;
import com.util.PagingResult;
@Service
public class ReplaceServiceImp implements ReplaceService{
	@Autowired
	private ReplaceDao ReplaceDao;
	@Autowired
	private BorLoanInfoDao BorLoanInfoDao;
	@Autowired
	private ComloanInfoDao ComloanInfoDao;
	/**
	 * 添加业务移交记录
	 */
	@Override
	@Transactional
	public String addReplace(Replace replace) {
		int loaninfoType = replace.getLoaninfoType();
		String borloaninfoId=replace.getLoaninfoId();
		String empId=replace.getNewEmpId();
		String[] oldEmpName = replace.getOldEmpId().split(" ");
		String oldEmpName2= oldEmpName[1];
		replace.setOldEmpId(oldEmpName2);
		SimpleDateFormat sd =new SimpleDateFormat("yyyy-MM-dd");
		replace.setReplaceDate(sd.format(new Date()));
		if(loaninfoType==0){
			BorLoanInfoDao.modifyBorLoanInfo(empId, borloaninfoId);
		}else{
			ComloanInfoDao.modifyComloanInfo(empId, borloaninfoId);
		}
		System.out.println("业务移交记录"+replace.toString());
		int flag = ReplaceDao.addReplace(replace);
		if(flag>0){
			return "add success";
		}else{
			return "add error";
		}
	}
	/**
	 * 查询所有的业务移交记录
	 */
	@Override
	public PagingResult<Replace> findReplace(Integer page,Integer rows){
		List<Replace> reList= ReplaceDao.findReplace();
		Paging<Replace> paging = new Paging<Replace>();
		List<Replace> pList = paging.paging(reList, rows, page);
		PagingResult<Replace> pr = new PagingResult<Replace>();
		pr.setRows(pList);
		pr.setTotal(reList.size());
		return pr;
	}
}
