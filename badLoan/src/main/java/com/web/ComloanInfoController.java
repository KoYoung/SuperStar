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
import com.entity.Borgua;
import com.entity.ComloanInfo;
import com.entity.CustomerGoods;
import com.entity.Guarantor;
import com.entity.LoanManageRecord;
import com.entity.Loanmanage;
import com.entity.Pledge;
import com.service.ComloanInfoService;
import com.util.FileUpload;
import com.util.Paging;
import com.util.PagingResult;
import com.util.FormUtil;

@Controller
@RequestMapping("/ComloanInfo")
public class ComloanInfoController {
	@Autowired
	private ComloanInfoService comloanInfoService;
	
	/**
	 * 查询企业贷款信息
	 */
	@RequestMapping("/findComloanInfo")
	@ResponseBody
	public PagingResult<ComloanInfo> findComloanInfo(Integer page, Integer rows) {
		PagingResult<ComloanInfo> comList = comloanInfoService.findComloanInfo(page, rows);
		return  comList;
	}
	/**
	 * 添加企业贷款信息
	 * 
	 * @throws IOException
	 */
	@RequestMapping("/addComloanInfo")
	@ResponseBody
	public String addComloanInfo(@RequestParam("borPhoto") MultipartFile[] borPhotos, HttpServletRequest request,
			ComloanInfo comloanInfo, Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor, Borgua borgua,
			LoanManageRecord lmr, Loanmanage lonm){
		
		return comloanInfoService.addComloanInfo(borPhotos, request, comloanInfo, pledge, customerGoods, guarantor, borgua, lmr, lonm);
	}
	/**
	 * 合同编号唯一性验证
	 */
	@RequestMapping("/findContractIdCom")
	@ResponseBody
	public boolean findContractIdCom(String contractId) {
		List<ComloanInfo> comList = comloanInfoService.findContractIdCom(contractId);
		if (comList.size() > 0) {
			return false;
		} else {
			return true;
		}
	}

	@RequestMapping("/findComLoan")
	@ResponseBody
	public PagingResult<Map<String, String>> findComLoan(@RequestBody String data, @RequestParam Integer page,
			Integer rows) {
		data = FormUtil.getURLDecoderString(data);
		System.out.println(data);
		// 将获取到的表单序列化数据拼装成JSON字符串，并转为MAP
		data = "{" + data.replace("&", "\",").replace("=", ":\"") + "\"}";
		System.out.println(data);
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		System.out.println(datamap);
		List<Map<String, String>> findBorSearch = comloanInfoService.findComLoan(datamap);

		Paging<Map<String, String>> pagingMap = new Paging<Map<String, String>>();
		List<Map<String, String>> list1 = pagingMap.paging(findBorSearch, rows, page);
		PagingResult<Map<String, String>> pResult = new PagingResult<Map<String, String>>();
		pResult.setTotal(findBorSearch.size());
		pResult.setRows(list1);
		System.out.println(pResult);
		System.out.println(findBorSearch);
		return pResult;
	}

	@RequestMapping("/modifyComState")
	@ResponseBody
	public String modifyComState(@RequestBody String data) {
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		comloanInfoService.modifyComState(datamap);
		return "success";
	}

	@RequestMapping("/applyWriteOff")
	@ResponseBody
	public String applyWriteOff(@RequestBody String data) {
		System.out.println(data);
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		System.out.println(datamap);
		comloanInfoService.applyWriteOff(datamap);
		return "success";
	}

	@RequestMapping("/updateUnrepayNumber")
	@ResponseBody
	public String updateUnrepayNumber(@RequestBody String data) {
		System.out.println(data);
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		System.out.println(datamap);
		comloanInfoService.updateUnrepayNumber(datamap);
		return "success";
	}
}
