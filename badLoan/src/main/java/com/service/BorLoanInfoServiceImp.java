package com.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dao.BorLoanInfoDao;
import com.dao.BorguaDao;
import com.dao.ComloanInfoDao;
import com.dao.CustomerGoodsDao;
import com.dao.GuarantorDao;
import com.dao.LoanManageRecordDao;
import com.dao.LoanmanageDao;
import com.dao.PledgeDao;
import com.entity.BorLoanInfo;
import com.entity.Borgua;
import com.entity.CustomerGoods;
import com.entity.Guarantor;
import com.entity.LoanManageRecord;
import com.entity.Loanmanage;
import com.entity.Pledge;
import com.util.FileUpload;
import com.util.Paging;
import com.util.PagingResult;

@Service
public class BorLoanInfoServiceImp implements BorLoanInfoService {
	@Autowired
	private BorLoanInfoDao borLoanInfoDao;
	@Autowired
	private ComloanInfoDao ComloanInfoDao;
	@Autowired
	private PledgeDao pledgeDao;
	@Autowired
	private CustomerGoodsDao customerGoodsDao;
	@Autowired
	private GuarantorDao guarantorDao;
	@Autowired
	private BorguaDao borguaDao;
	@Autowired
	private LoanManageRecordDao loanManageRecordDao;
	@Autowired
	private LoanmanageDao loanmanageDao;

	/**
	 * 查询个人用户贷款信息
	 * 
	 * @return
	 */
	@Override
	@Transactional
	public PagingResult<BorLoanInfo> findBorLoanInfo(Integer page, Integer rows) {
		List<BorLoanInfo> comList = borLoanInfoDao.findBorLoanInfo();
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
	@Override
	public List<Map<String, String>> findBorLoanDetail() {
		return borLoanInfoDao.findBorLoanDetail();
	}

	/**
	 * 查询某用户贷款所有详情
	 * 
	 * @return
	 */
	@Override
	public List<Map<String, String>> findDetailsById(int borloaninfoId) {
		List<Map<String, String>> borList = borLoanInfoDao.findBorLoanDetailsById(borloaninfoId);
		int borId = Integer.parseInt(borList.get(0).get("BOR_ID"));
		String empId = borList.get(0).get("EMP_ID");
		System.out.println("--------------------borId" + borId + "   " + "----------------------" + empId);
		List<Map<String, String>> cusList = borLoanInfoDao.findCusDetailsById(borId);
		List<Map<String, String>> empList = borLoanInfoDao.findEmpDetailsById(empId);

		System.out.println("--------------------borList:" + borList + "----------------------");
		System.out.println("--------------------cusList:" + cusList + "----------------------");
		System.out.println("--------------------empList:" + empList + "----------------------");
		for (Map<String, String> map : cusList) {
			borList.add(map);
		}
		for (Map<String, String> map : empList) {
			borList.add(map);
		}
		return borList;
	}

	/**
	 * 添加个人用户贷款信息 马利肖 requestParam要写才知道是前台的那个数组
	 */
	@Transactional
	public String addBorLoanInfo(@RequestParam("borPhoto") MultipartFile[] borPhotos, HttpServletRequest request,
			BorLoanInfo borLoanInfo, Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor, Borgua borgua,
			LoanManageRecord lmr, Loanmanage lonm) {
		String pledgeGenre = borLoanInfo.getLoanType();
		int unrepayNumber = Integer.parseInt(borLoanInfo.getLoanNumber());
		borLoanInfo.setUnrepayNumber(unrepayNumber);
		pledge.setPledgeGenre(pledgeGenre);
		String empId = borLoanInfo.getEmpId();
		lmr.setEmpId(empId);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		lmr.setLmrDate(sd.format(new Date()));
		int loaninfoType = borLoanInfo.getLoaninfoType();
		lonm.setLoaninfoType(loaninfoType);
		// 获取页面传过来的图片路径
		List files = FileUpload.uploadFile1(borPhotos, request);
		String photoPath = "";
		for (int i = 0; i < files.size(); i++) {

			photoPath = photoPath + files.get(i).toString() + ",";
			// 保存文件
		}
		pledge.setPledgePhoto(photoPath);
		try {
			int flag = borLoanInfoDao.addBorLoanInfo(borLoanInfo);
			pledgeDao.addPledge(pledge);
			customerGoodsDao.addCustomerGoods(customerGoods);
			guarantorDao.addGuarantor(guarantor);
			borguaDao.addBorgua(borgua);
			loanManageRecordDao.addLoanManageRecord(lmr);
			loanmanageDao.addLoanmanage(lonm);
			if (flag > 0) {
				return "add success";
			} else {
				return "add error";
			}
		} catch (Exception e) {
			System.out.println("--->" + e.getMessage());
			return "异常";
		}

	}

	/**
	 * 根据贷款类型，贷款编号查询贷款信息 马利肖
	 */
	@Override
	@Transactional
	public BorLoanInfo findBorLoanInfo2(BorLoanInfo borLoanInfo, String borloaninfoId) {
		int loaninfoType = borLoanInfo.getLoaninfoType();
		System.out.println("loaninfoType--->" + loaninfoType);
		String borloaninfoId1 = borLoanInfo.getBorloaninfoId();
		List<BorLoanInfo> borList = null;
		if (loaninfoType == 0) {
			borList = borLoanInfoDao.findBorLoanInfo2(borloaninfoId1);
		} else {
			borList = ComloanInfoDao.findComloanInfo2(borloaninfoId1);
		}
		if (borList.size() > 0) {
			return borList.get(0);
		}
		return null;
	}

	@Transactional
	public void modifyLoanState(Map<String, String> datamap) {
		borLoanInfoDao.addLoanManageRecordMap(datamap);
		borLoanInfoDao.modifyLoanStateMap(datamap);
	}

	@Override
	public List<Map<String, String>> findBorSearch(Map<String, String> datamap) {
		return borLoanInfoDao.findBorSearch(datamap);
	}

	/**
	 * 合同编号唯一性验证
	 */
	@Override
	public List<BorLoanInfo> findcontractId(String contractId) {

		return borLoanInfoDao.findcontractId(contractId);
	}

	/**
	 * 申请核销
	 * 
	 * @param datamap
	 */
	@Transactional
	public void applyWriteOff(Map<String, String> datamap) {
		borLoanInfoDao.addLoanManageRecordMap(datamap);
		borLoanInfoDao.modifyLoanStateMap(datamap);
	}

	/**
	 * 登记回收信息
	 */
	@Transactional
	public void updateUnrepayNumber(Map<String, String> datamap) {
		borLoanInfoDao.addRepaymentinfo(datamap);
		borLoanInfoDao.modifyUnrepayNumber(datamap);
	}

	public List<Map<String, String>> findRepayRecord(int borloaninfoId) {
		return borLoanInfoDao.findRepayRecord(borloaninfoId);
	}

	public List<Map<String, String>> findLMR(int borloaninfoId) {
		return borLoanInfoDao.findLMR(borloaninfoId);
	}

	public List<Map<String, String>> findGuaDetailsById(int borloaninfoId) {
		return borLoanInfoDao.findGuaDetailsById(borloaninfoId);
	}

	public List<Map<String, String>> findPledge(int borloaninfoId) {
		return borLoanInfoDao.findPledge(borloaninfoId);
	}

	public List<Map<String, String>> findContect(int borId) {
		return borLoanInfoDao.findContect(borId);
	}
}