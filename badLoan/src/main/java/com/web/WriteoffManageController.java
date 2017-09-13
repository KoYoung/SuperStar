package com.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dao.LoanManageRecordDao;
import com.entity.Repaymentinfo;
import com.entity.WriteoffManage;
import com.service.WriteoffManageService;
import com.util.Paging;
import com.util.PagingResult;

@Controller
@RequestMapping("/WriteoffManage")
public class WriteoffManageController {
	@Autowired
	private WriteoffManageService writeService;

	/**
	 * 查询所有申请核销的贷款信息
	 * 
	 * @author Administrator
	 *
	 */
	@RequestMapping("/findWriteoffManage")
	@ResponseBody
	public PagingResult<WriteoffManage> findWriteoffManage(Integer rows, Integer page) {
		List<WriteoffManage> weList = writeService.findWriteoffManage();
		Paging<WriteoffManage> paging = new Paging<WriteoffManage>();
		System.out.println("rows---" + rows);
		System.out.println("page---" + page);
		System.out.println(weList.size());
		List<WriteoffManage> row = paging.paging(weList, rows, page);
		PagingResult<WriteoffManage> pr = new PagingResult<WriteoffManage>();
		pr.setRows(row);
		pr.setTotal(weList.size());
		return pr;

	}

	/**
	 * 根据贷款编号查询这笔贷款的所有回收记录
	 */
	@RequestMapping("/findReayment")
	@ResponseBody
	public List<Repaymentinfo> findReayment(String loaninfoId) {
		List<Repaymentinfo> reList = writeService.findReayment(loaninfoId);
		System.out.println("贷款编号---》" + loaninfoId);
		return reList;
	}

	/**
	 * 添加核销信息
	 */
	@RequestMapping("/addWriteoffManage")
	@ResponseBody
	public String addWriteoffManage(@RequestBody String data) {

		// System.out.println("========================"+data);
		WriteoffManage wm = JSON.parseObject(data, WriteoffManage.class);
		int flag = writeService.addWriteoffManage(wm);
		if (flag == 1) {
			return "add success";
		} else {
			return "add error";
		}

	}

}
