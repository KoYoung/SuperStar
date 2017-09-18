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
	public String addBorLoanInfo(@RequestParam("borPhoto") MultipartFile[] borPhoto, HttpServletRequest request,
			BorLoanInfo borLoanInfo, Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor, Borgua borgua,
			LoanManageRecord lmr, Loanmanage loanmanage) throws IOException {
		System.out.println("****************************");
		List filepath = FileUpload.uploadFile1(borPhoto, request);
		String path = "";
		for (int i = 0; i < borPhoto.length; i++) {
			path = path + filepath.get(i).toString() + ",";
		}
		System.out.println("path-------" + path);
		pledge.setPledgePhoto(path);
		System.out.println("zhaopi=a==n=====" + pledge.getPledgePhoto());

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
	public String findDetailById(@RequestBody String data) {
		int borloaninfoId = Integer.parseInt(data.substring(6));
		List<Map<String, String>> borDetails = borService.findDetailsById(borloaninfoId);
		String borDetailsStr = JSON.toJSONString(borDetails);
		return borDetailsStr;
	}

	/**
	 * 根据贷款编号查询还款记录
	 */
	@RequestMapping(value = "/findRepayRecord")
	@ResponseBody
	public List<Map<String, String>> findRepayRecord(@RequestBody String data) {
		int borloaninfoId = Integer.parseInt(data.substring(6));
		List<Map<String, String>> borDetails = borService.findRepayRecord(borloaninfoId);
		return borDetails;
	}

	/**
	 * 根据贷款编号查询管理记录
	 */
	@RequestMapping(value = "/findLMR")
	@ResponseBody
	public List<Map<String, String>> findLMR(@RequestBody String data) {
		int borloaninfoId = Integer.parseInt(data.substring(6));
		List<Map<String, String>> borDetails = borService.findLMR(borloaninfoId);
		return borDetails;
	}

	/**
	 * 根据贷款编号查询管理记录
	 */
	@RequestMapping(value = "/findGuaDetailsById")
	@ResponseBody
	public List<Map<String, String>> findGuaDetailsById(@RequestBody String data) {
		int borloaninfoId = Integer.parseInt(data.substring(6));
		List<Map<String, String>> borDetails = borService.findGuaDetailsById(borloaninfoId);
		return borDetails;
	}
	
	/**
	 * 根据贷款编号查询管理记录
	 */
	@RequestMapping(value = "/findPledge")
	@ResponseBody
	public List<Map<String, String>> findPledge(@RequestBody String data) {
		int borloaninfoId = Integer.parseInt(data.substring(6));
		List<Map<String, String>> borDetails = borService.findPledge(borloaninfoId);
		return borDetails;
	}
	/**
	 * 根据贷款编号查询管理记录
	 */
	@RequestMapping(value = "/findContect")
	@ResponseBody
	public List<Map<String, String>> findContect(@RequestBody String data) {
		int borId = Integer.parseInt(data.substring(6));
		List<Map<String, String>> borDetails = borService.findContect(borId);
		return borDetails;
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
		borService.modifyLoanState(datamap);
		return "success";
	}

	@RequestMapping(value = "/findBorSearch")
	@ResponseBody
	public PagingResult<Map<String, String>> findBorSearch(@RequestBody String data) {
		data = UrlUtil.getURLDecoderString(data);
		data = data.substring(5);
		// 将获取到的表单序列化数据拼装成JSON字符串，并转为MAP
		data = "{" + data.replace("&", "\",").replace("=", ":\"") + "\"}";
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		System.out.println(datamap);
		List<Map<String, String>> findBorSearch = borService.findBorSearch(datamap);
		System.out.println(findBorSearch);

		Paging<Map<String, String>> pagingMap = new Paging<Map<String, String>>();
		List<Map<String, String>> list1 = pagingMap.paging(findBorSearch, Integer.parseInt(datamap.get("rows")),
				Integer.parseInt(datamap.get("page")));
		PagingResult<Map<String, String>> pResult = new PagingResult<Map<String, String>>();
		pResult.setTotal(findBorSearch.size());
		pResult.setRows(list1);
		System.out.println(pResult);

		return pResult;
	}

	@RequestMapping("/applyWriteOff")
	@ResponseBody
	public String applyWriteOff(@RequestBody String data) {
		System.out.println(data);
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		System.out.println(datamap);
		borService.applyWriteOff(datamap);
		return "success";
	}

	@RequestMapping("/updateUnrepayNumber")
	@ResponseBody
	public String updateUnrepayNumber(@RequestBody String data) {
		System.out.println(data);
		Map<String, String> datamap = JSON.parseObject(data, Map.class);
		System.out.println(datamap);
		borService.updateUnrepayNumber(datamap);
		return "success";
	}
}
