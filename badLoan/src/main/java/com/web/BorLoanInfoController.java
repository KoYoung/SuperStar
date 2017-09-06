package com.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
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
import com.service.BorLoanInfoService;
import com.service.ComloanInfoService;
import com.service.ReplaceService;
import com.util.FileUpload;
import com.util.Paging;
import com.util.PagingResult;


@Controller
@RequestMapping("/BorLoanInfo")

public class BorLoanInfoController {
	@Autowired
	private BorLoanInfoService borService;
	@Autowired
	private ComloanInfoService comService;
	/**
	 * 添加个人用户贷款信息
	 * 马利肖
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/addBorLoanInfo")
	@ResponseBody
	public String addBorLoanInfo(MultipartFile borPhoto,HttpServletRequest request,BorLoanInfo borLoanInfo,Pledge pledge,CustomerGoods customerGoods,Guarantor guarantor,Borgua borgua,LoanManageRecord lmr,Loanmanage loanmanage) throws IOException{
		System.out.println("****************************");
		String filepath = FileUpload.uploadFile(borPhoto, request);
		pledge.setPledgePhoto(filepath);
		System.out.println("zhaopi=a==n====="+pledge.getPledgePhoto());
	
		/*int bor = borService.addBorLoanInfo(BorLoanInfo, pledge,customergoods, guarantor,borgua, lmr, lonm);*/
		int bor=borService.addBorLoanInfo(borLoanInfo, pledge, customerGoods, guarantor, borgua, lmr, loanmanage);
		if(bor>0){
		
			return "添加个人用户贷款信息success";
		}else{
				return "添加个人用户贷款信息error";
		}
		
			
	}
	/**
	 * 查询个人用户贷款信息
	 * 马利肖
	 * @return
	 */
	@RequestMapping("/findBorLoanInfo")
	@ResponseBody
	public PagingResult<BorLoanInfo> findBorLoanInfo(Integer page,Integer rows){
		List<BorLoanInfo> comList = borService.findBorLoanInfo();
		Paging<BorLoanInfo> paging=new Paging<BorLoanInfo>();
		List<BorLoanInfo> borList=paging.paging(comList, rows ,page);
		PagingResult<BorLoanInfo> pr=new PagingResult<BorLoanInfo>();
		pr.setRows(borList);
		pr.setTotal(comList.size());
		return pr;
	}
	/**
	 * 根据贷款类型，贷款编号查询贷款信息
	 */
	@RequestMapping("/findBorLoanInfo2")
	@ResponseBody
	public BorLoanInfo findBorLoanInfo2(@RequestBody BorLoanInfo borLoanInfo) {
		System.out.println(borLoanInfo.getLoaninfoType()+" "+borLoanInfo.getBorloaninfoId());
		int loaninfoType = borLoanInfo.getLoaninfoType();
		String borloaninfoId = borLoanInfo.getBorloaninfoId();
		List<BorLoanInfo> borList=null;
		if(loaninfoType==0){
			borList=borService.findBorLoanInfo2(borloaninfoId);
		}else{
			borList=comService.findComloanInfo2(borloaninfoId);
		}
		if(borList.size()>0){
			return borList.get(0);
		}
		return null;
	}
	/**
	 * 根据贷款编号修改业务移交相关信息(贷款经手人)
	 * @return 
	 */
	
	
}
