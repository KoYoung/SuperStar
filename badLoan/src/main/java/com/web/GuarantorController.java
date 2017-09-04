package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Guarantor;
import com.service.GuarantorService;

/**
 * 担保人Controller
 * 
 * @author yang
 */
@Controller
@RequestMapping("/guaController")
public class GuarantorController {
	@Autowired
	private GuarantorService guaService;

	/**
	 * 查询担保人
	 * 
	 * @return 担保人集合
	 */
	@RequestMapping("/findGua")
	@ResponseBody
	public List<Guarantor> findGuarantor() {
		return guaService.findGuarantor();
	}

	/**
	 * 添加担保人
	 * 
	 * @param guarantor担保人实体
	 * @return 添加成功返回1
	 */
	@RequestMapping("/addGua")
	@ResponseBody
	public String addGuarantor(Guarantor guarantor) {
		System.out.println(guarantor);
		int flag = guaService.addGuarantor(guarantor);
		if (flag == 1)
			return "add success";
		else
			return "add false";
	}
}
