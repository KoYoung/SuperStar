package com.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Replace;
import com.service.ReplaceService;
import com.util.PagingResult;

@Controller
@RequestMapping("/replace")
public class ReplaceController {
	@Autowired
	private ReplaceService replaceService;
	
	/**
	 * 添加业务移交记录
	 */
	@RequestMapping("/addReplace")
	@ResponseBody
	public String addReplace(Replace replace){
		return replaceService.addReplace(replace);
		
	}
	/**
	 * 查询所有的业务移交记录
	 */
	@RequestMapping("/findReplace")
	@ResponseBody
	public PagingResult<Replace> findReplace(Integer page,Integer rows){
		PagingResult<Replace> reList= replaceService.findReplace(page, rows);
		return reList;
	}
}
