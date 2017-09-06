package com.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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

@Controller
@RequestMapping("/ComloanInfo")
public class ComloanInfoController {
	@Autowired
	private ComloanInfoService comloanInfoService;
	/**
	 * 添加企业贷款信息
	 * @throws IOException 
	 */
	@RequestMapping("/addComloanInfo")
	@ResponseBody
	public String addComloanInfo(MultipartFile borPhoto,HttpServletRequest request,ComloanInfo comloanInfo,Pledge pledge,CustomerGoods customerGoods,Guarantor guarantor,Borgua borgua
			,LoanManageRecord lmr,Loanmanage lonm) throws IOException{
		String filepath = FileUpload.uploadFile(borPhoto, request);
		pledge.setPledgePhoto(filepath);
		System.out.println("zhaopi=a==n====="+pledge.getPledgePhoto());
		int flag = comloanInfoService.addComloanInfo(comloanInfo, pledge, customerGoods, guarantor, borgua, lmr, lonm);
		if(flag>0){
			return "add Success";
		}else{
			return "add error";
		}
		
	}
	/**
	 * 查询企业贷款信息
	 */
	@RequestMapping("/findComloanInfo")
	@ResponseBody
	public PagingResult<ComloanInfo> findComloanInfo(Integer page,Integer rows) {
		List<ComloanInfo> comList = comloanInfoService.findComloanInfo();
		Paging<ComloanInfo> paging=new Paging<ComloanInfo>();
		List<ComloanInfo> list=paging.paging(comList, rows ,page);
		PagingResult<ComloanInfo> pr=new PagingResult<ComloanInfo>();
		pr.setRows(list);
		pr.setTotal(comList.size());
		return pr;
	}
}
