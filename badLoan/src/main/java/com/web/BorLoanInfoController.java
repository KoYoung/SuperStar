package com.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.entity.BorLoanInfo;
import com.entity.Borgua;
import com.entity.CustomerGoods;
import com.entity.Guarantor;
import com.entity.LoanManageRecord;
import com.entity.Loanmanage;
import com.entity.Pledge;
import com.service.BorLoanInfoService;
import com.service.ComloanInfoService;
import com.util.FileUpload;
import com.util.Paging;
import com.util.PagingResult;
import com.util.UrlUtil;

@Controller
@RequestMapping("/BorLoanInfo")
public class BorLoanInfoController {
	@Autowired
	private BorLoanInfoService borService;
	@Autowired
	private ComloanInfoService comService;

	/**
	 * 添加个人用户贷款信息 马利肖
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/addBorLoanInfo")
	@ResponseBody
	public String addBorLoanInfo(MultipartFile borPhoto, HttpServletRequest request, BorLoanInfo borLoanInfo,
			Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor, Borgua borgua, LoanManageRecord lmr,
			Loanmanage loanmanage) throws IOException {
		System.out.println("****************************");
		String filepath = FileUpload.uploadFile(borPhoto, request);
		pledge.setPledgePhoto(filepath);
		System.out.println("zhaopi=a==n=====" + pledge.getPledgePhoto());

		/*
		 * int bor = borService.addBorLoanInfo(BorLoanInfo,
		 * pledge,customergoods, guarantor,borgua, lmr, lonm);
		 */
		int bor = borService.addBorLoanInfo(borLoanInfo, pledge, customerGoods, guarantor, borgua, lmr, loanmanage);
		if (bor > 0) {
			return "添加个人用户贷款信息success";
		} else {
			return "添加个人用户贷款信息error";
		}

	}

	// requestParam要写才知道是前台的那个数组
	public String filesUpload(HttpServletRequest request, BorLoanInfo borLoanInfo, Pledge pledge,
			CustomerGoods customerGoods, Guarantor guarantor, Borgua borgua, LoanManageRecord lmr,
			Loanmanage loanmanage, @RequestParam("borPhoto") MultipartFile[] borPhotos) {
		List files = FileUpload.uploadFile1(borPhotos, request);
		System.out.println("-----------------------");
		String phonePath = "";
		for (int i = 0; i < files.size(); i++) {
			phonePath = phonePath + files.get(i).toString() + ",";
		}
		// 保存图片
		pledge.setPledgePhoto(phonePath);
		System.out.println("zhaopi=a==n=====" + pledge.getPledgePhoto());
		int flag = borService.addBorLoanInfo(borLoanInfo, pledge, customerGoods, guarantor, borgua, lmr, loanmanage);
		if (flag > 0) {
			return "add success";
		} else {
			return "add false";
		}
	}

	/**
	 * 查询个人用户贷款信息 马利肖
	 * 
	 * @return
	 */
	@RequestMapping("/findBorLoanInfo")
	@ResponseBody
	public PagingResult<BorLoanInfo> findBorLoanInfo(Integer page, Integer rows) {
		List<BorLoanInfo> comList = borService.findBorLoanInfo();
		Paging<BorLoanInfo> paging = new Paging<BorLoanInfo>();
		List<BorLoanInfo> borList = paging.paging(comList, rows, page);
		PagingResult<BorLoanInfo> pr = new PagingResult<BorLoanInfo>();
		pr.setRows(borList);
		pr.setTotal(comList.size());
		return pr;
	}

	/**
	 * 查询个人用户贷款详情
	 * 
	 * @return
	 */
	@RequestMapping("/findBorLoanDetail")
	@ResponseBody
	public List<Map<String, String>> findBorLoanDetail() {
		List<Map<String, String>> findBorLoanDetail = borService.findBorLoanDetail();
		System.out.println(findBorLoanDetail);
		return findBorLoanDetail;
	}

	/**
	 * 查询某个用户的详情所有资料
	 */
	@RequestMapping(value = "/findDetailById", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findDetailById(@RequestParam String data) {
		int borloaninfoId = Integer.parseInt(data);
		List<Map<String, String>> borDetails = borService.findDetailsById(borloaninfoId);
		System.out.println(borDetails);
		String borDetailsStr = JSON.toJSONString(borDetails);
		System.out.println(borDetailsStr);
		return borDetailsStr;
	}

	/**
	 * 根据贷款类型，贷款编号查询贷款信息
	 */
	@RequestMapping("/findBorLoanInfo2")
	@ResponseBody
	public BorLoanInfo findBorLoanInfo2(@RequestBody BorLoanInfo borLoanInfo) {
		System.out.println(borLoanInfo.getLoaninfoType() + " " + borLoanInfo.getBorloaninfoId());
		int loaninfoType = borLoanInfo.getLoaninfoType();
		String borloaninfoId = borLoanInfo.getBorloaninfoId();
		List<BorLoanInfo> borList = null;
		if (loaninfoType == 0) {
			borList = borService.findBorLoanInfo2(borloaninfoId);
		} else {
			borList = comService.findComloanInfo2(borloaninfoId);
		}
		if (borList.size() > 0) {
			return borList.get(0);
		}
		return null;
	}

	@RequestMapping("/updateLoanState")
	@ResponseBody
	public String updateLoanState(@RequestBody String data) {
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		borService.updateLoanState(datamap);
		return "success";
	}

	@RequestMapping(value = "/findBorSearch")
	@ResponseBody
	public List<Map<String, String>> findBorSearch(@RequestBody String data) {
		data = UrlUtil.getURLDecoderString(data);
		// 将获取到的表单序列化数据拼装成JSON字符串，并转为MAP
		data = "{" + data.replace("&", "\",").replace("=", ":\"") + "\"}";
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		System.out.println(datamap);
		List<Map<String, String>> findBorSearch = borService.findBorSearch(datamap);
		System.out.println(findBorSearch);
		return findBorSearch;
	}

	@RequestMapping(value = "/findTestDemo")
	@ResponseBody
	public List<Map<String, String>> findTestDemo() {
		return borService.findTestDemo();
	}

	/**
	 * 合同编号唯一性验证
	 */
	@RequestMapping("/findcontractId")
	@ResponseBody
	public boolean findcontractId(String contractId) {
		List<BorLoanInfo> cuList = borService.findcontractId(contractId);
		if (cuList.size() > 0) {
			return false;
		} else {
			return true;
		}

	}

}
