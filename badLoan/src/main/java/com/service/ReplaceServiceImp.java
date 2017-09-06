package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BorLoanInfoDao;
import com.dao.ComloanInfoDao;
import com.dao.ReplaceDao;
import com.entity.Replace;
@Service
public class ReplaceServiceImp implements ReplaceService{
	@Autowired
	private ReplaceDao ReplaceDao;
	@Autowired
	private BorLoanInfoDao BorLoanInfoDao;
	@Autowired
	private ComloanInfoDao ComloanInfoDao;
	/**
	 * 业务移交记录
	 */
	@Override
	public int addReplace(Replace replace) {
		int loaninfoType = replace.getLoaninfoType();
		System.out.println("loaninfoType"+" "+loaninfoType);
		String borloaninfoId=replace.getLoaninfoId();
		String empId=replace.getNewEmpId();
		System.out.println("newempId-----"+" "+empId);
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
		return ReplaceDao.addReplace(replace);
	}
	/**
	 * 查询所有的业务移交记录
	 */
	@Override
	public List<Replace> findReplace() {
		
		return ReplaceDao.findReplace();
	}
}
