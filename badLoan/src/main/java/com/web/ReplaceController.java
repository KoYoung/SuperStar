package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Replace;
import com.service.ReplaceService;
import com.util.Paging;
import com.util.PagingResult;

@Controller
@RequestMapping("/replace")
public class ReplaceController {
	@Autowired
	private ReplaceService replaceService;
	
	/**
	 * 业务移交记录
	 */
	@RequestMapping("/addReplace")
	@ResponseBody
	public String addReplace(Replace replace){
		int flag=replaceService.addReplace(replace);
		if(flag>0){
			return "add success";
		}else{
			return "add error";
		}
	}
	/**
	 * 查询所有的业务移交记录
	 */
	@RequestMapping("/findReplace")
	@ResponseBody
	public PagingResult<Replace> findReplace(Integer page,Integer rows){
		List<Replace> reList= replaceService.findReplace();
		Paging<Replace> paging = new Paging<Replace>();
		List<Replace> pList = paging.paging(reList, rows, page);
		PagingResult<Replace> pr = new PagingResult<Replace>();
		pr.setRows(pList);
		pr.setTotal(reList.size());
		return pr;
		
	}
}
