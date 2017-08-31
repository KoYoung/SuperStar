package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.BorRower;
import com.service.BorRowerService;

@Controller
@RequestMapping("/BorRower")
public class BorRowerController {
	@Autowired
	private BorRowerService borService;
	
	/**
	 * ��ѯ���еĸ����û�
	 * ����Ф
	 * @return
	 */
	@RequestMapping("/findBorRower")
	@ResponseBody
	public List<BorRower> findBorRower() {
		List<BorRower> bList = borService.findBorRowers();
		return bList;
	}
}
