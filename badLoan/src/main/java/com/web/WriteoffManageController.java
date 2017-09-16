package com.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
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
		PagingResult<WriteoffManage> weList = writeService.findWriteoffManage(rows, page);
		return weList;
	}
	/**
	 * 根据贷款编号查询这笔贷款的所有回收记录
	 */
	@RequestMapping("/findReayment")
	@ResponseBody
	public List<Repaymentinfo> findReayment(String loaninfoId) {
		List<Repaymentinfo> reList = writeService.findReayment(loaninfoId);
		return reList;
	}
	/**
	 * 添加核销信息
	 */
	@RequestMapping("/addWriteoffManage")
	@ResponseBody
	public String addWriteoffManage(@RequestBody String data,HttpSession session) {
		WriteoffManage wm = JSON.parseObject(data, WriteoffManage.class);
		return writeService.addWriteoffManage(wm, session);
	}
	/**
	 * 根据贷款编号和贷款人姓名进行模糊查询
	 */
	@RequestMapping("/findWriteM")
	@ResponseBody
	public PagingResult<WriteoffManage> findWriteM(String loaninfoId, Integer rows, Integer page) {
		PagingResult<WriteoffManage> wrList = writeService.findWriteM(loaninfoId, rows, page);
		return wrList;
	}
}
