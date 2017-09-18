package com.web;

import java.io.IOException;
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
	
	/**
	 * 查询个人用户贷款信息 马利肖
	 * 
	 * @return
	 */
	@RequestMapping("/findBorLoanInfo")
	@ResponseBody
	public PagingResult<BorLoanInfo> findBorLoanInfo(Integer page, Integer rows) {
		PagingResult<BorLoanInfo> comList = borService.findBorLoanInfo(page, rows);
		return comList;
	}
	/**
	 * 添加个人用户贷款信息 马利肖
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/addBorLoanInfo")
	@ResponseBody
	public String addBorLoanInfo(@RequestParam("borPhoto") MultipartFile[] borPhoto, HttpServletRequest request,BorLoanInfo borLoanInfo,
			Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor, Borgua borgua, LoanManageRecord lmr,
			Loanmanage loanmanage) throws IOException {
		
		return borService.addBorLoanInfo(borPhoto, request, borLoanInfo, pledge, customerGoods, guarantor, borgua, lmr, loanmanage);
	}
	/**
	 * 合同编号唯一性验证 马利肖
	 */
	@RequestMapping("/findcontractId")
	@ResponseBody
	public boolean findcontractId(String contractId) {
		List<BorLoanInfo> cuList = borService.findcontractId(contractId);
		if(cuList.size()>0){
			return false;
		}else{
			return true;
		}
	}
	/**
	 * 根据贷款类型，贷款编号查询贷款信息 马利肖
	 */
	@RequestMapping("/findBorLoanInfo2")
	@ResponseBody
	public BorLoanInfo findBorLoanInfo2(@RequestBody BorLoanInfo borLoanInfo,String borloaninfoId) {
		BorLoanInfo bList = borService.findBorLoanInfo2(borLoanInfo, borloaninfoId);
		return bList;
	}
	/**
	 * 查询个人用户贷款详情
	 * 
	 * @return
	 */
	@RequestMapping("/findBorLoanDetail")
	@ResponseBody
	public PagingResult<Map<String, String>> findBorLoanDetail(@RequestParam Integer page, Integer rows) {
		List<Map<String, String>> findBorLoanDetail = borService.findBorLoanDetail();
		Paging<Map<String, String>> pagingMap = new Paging<Map<String, String>>();
		List<Map<String, String>> list1 = pagingMap.paging(findBorLoanDetail, rows, page);
		PagingResult<Map<String, String>> pResult = new PagingResult<Map<String, String>>();
		pResult.setTotal(findBorLoanDetail.size());
		pResult.setRows(list1);
		System.out.println(pResult);
		return pResult;
	}

	/**
	 * 查询某个用户的详情所有资料
	 */
	@RequestMapping(value = "/findDetailById", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findDetailById(@RequestParam String data) {
		int borloaninfoId = Integer.parseInt(data);
		List<Map<String, String>> borDetails = borService.findDetailsById(borloaninfoId);
		String borDetailsStr = JSON.toJSONString(borDetails);
		return borDetailsStr;
	}
	@RequestMapping("/updateLoanState")
	@ResponseBody
	public String updateLoanState(@RequestBody String data) {
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		borService.modifyLoanState(datamap);
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

	@RequestMapping("/applyWriteOff")
	@ResponseBody
	public String applyWriteOff(@RequestBody String data) {
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		borService.applyWriteOff(datamap);
		return "success";
	}

	@RequestMapping("/updateUnrepayNumber")
	@ResponseBody
	public String updateUnrepayNumber(@RequestBody String data) {
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		borService.updateUnrepayNumber(datamap);
		return "success";
	}
}
