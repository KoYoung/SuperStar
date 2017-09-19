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

import com.dao.BorguaDao;
import com.dao.ComloanInfoDao;
import com.dao.CustomerGoodsDao;
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
import com.util.FileUpload;
import com.util.Paging;
import com.util.PagingResult;

@Service
public class ComloanInfoServiceImp implements ComloanInfoService {
	@Autowired
	private ComloanInfoDao comloanInfoDao;
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
	 * 查询企业贷款信息
	 */
	@Override
	@Transactional
	public PagingResult<ComloanInfo> findComloanInfo(Integer page, Integer rows) {
		List<ComloanInfo> comList = comloanInfoDao.findComloanInfo();
		Paging<ComloanInfo> paging = new Paging<ComloanInfo>();
		List<ComloanInfo> list = paging.paging(comList, rows, page);
		PagingResult<ComloanInfo> pr = new PagingResult<ComloanInfo>();
		pr.setRows(list);
		pr.setTotal(comList.size());
		return pr;
	}
	/**
	 * 添加企业贷款信息
	 */
	@Transactional
	public String addComloanInfo(@RequestParam("borPhoto") MultipartFile[] borPhotos, HttpServletRequest request,
			ComloanInfo comloanInfo, Pledge pledge, CustomerGoods customerGoods, Guarantor guarantor,
			Borgua borgua, LoanManageRecord lmr, Loanmanage lonm){
		String pledgeGenre = comloanInfo.getLoanType();
		int unrepayNumber = Integer.parseInt(comloanInfo.getLoanNumber());
		comloanInfo.setUnrepayNumber(unrepayNumber);
		pledge.setPledgeGenre(pledgeGenre);
		String empId = comloanInfo.getEmpId();
		lmr.setEmpId(empId);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		lmr.setLmrDate(sd.format(new Date()));
		int loaninfoType = comloanInfo.getLoaninfoType();
		lonm.setLoaninfoType(loaninfoType);
		//获取图片路径
		List files = FileUpload.uploadFile1(borPhotos, request);
		String phonePath = "";
		for (int i = 0; i < files.size(); i++) {

			phonePath = phonePath + files.get(i).toString() + ",";
			// 保存文件
		}
		pledge.setPledgePhoto(phonePath);
		try {
			int flag = comloanInfoDao.addComloanInfo(comloanInfo);
			System.out.println(comloanInfoDao.toString());
			pledgeDao.addPledge(pledge);
			System.out.println(pledgeDao.toString());
			customerGoodsDao.addCustomerGoods(customerGoods);
			guarantorDao.addGuarantor(guarantor);
			borguaDao.addBorgua(borgua);
			loanManageRecordDao.addLoanManageRecord(lmr);
			loanmanageDao.addLoanmanage(lonm);
			if(flag>0){
				return "add success";
			}else{
				return "add error";
			}
		} catch (Exception e) {
			System.out.println("--->" + e.getMessage());
			return "异常";
		}

	}
	/**
	 * 合同编号唯一性验证
	 * @return 
	 */
	@Override
	public List<ComloanInfo> findContractIdCom(String contractId) {

		return comloanInfoDao.findContractIdCom(contractId);
	}
	@Override
	public List<Map<String, String>> findComLoan(Map<String, String> datamap) {
		return comloanInfoDao.findComLoan(datamap);
	}

	@Transactional
	public void modifyComState(Map<String, String> datamap) {
		comloanInfoDao.addLmr(datamap);
		comloanInfoDao.modifyLoanState(datamap);
	}

	@Transactional
	public void applyWriteOff(Map<String, String> datamap) {
		comloanInfoDao.addLmr(datamap);
		comloanInfoDao.modifyLoanState(datamap);
	}

	@Transactional
	public void updateUnrepayNumber(Map<String, String> datamap) {
		comloanInfoDao.addRepaymentinfo(datamap);
		comloanInfoDao.modifyUnrepayNumber(datamap);
	}

}
