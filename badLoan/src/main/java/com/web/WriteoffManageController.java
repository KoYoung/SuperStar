package com.web;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * @author Administrator
	 *
	 */
	@RequestMapping("/findWriteoffManage")
	@ResponseBody
	public PagingResult<WriteoffManage> findWriteoffManage(Integer rows,Integer page){
		List<WriteoffManage> weList = writeService.findWriteoffManage();
		Paging<WriteoffManage> paging=new Paging<WriteoffManage>();
		System.out.println("rows---"+rows);
		System.out.println("page---"+page);
		System.out.println(weList.size());
		List<WriteoffManage> row=paging.paging(weList, rows, page);
		PagingResult<WriteoffManage> pr=new PagingResult<WriteoffManage>();
		pr.setRows(row);
		pr.setTotal(weList.size());
		return pr;
		
		
	}
	
}
