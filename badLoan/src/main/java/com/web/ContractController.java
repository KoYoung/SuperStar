package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Contract;
import com.service.ContractService;
/**
 * 紧急联系人controller
 * @author yang
 *
 */
@Controller
@RequestMapping("/contractController")
public class ContractController {
	@Autowired
	private ContractService contractService;

	@RequestMapping("/findContract")
	@ResponseBody
	public List<Contract> findContract() {
		return contractService.findContract();
	}

	@RequestMapping("/addContract")
	@ResponseBody
	public String addContract(Contract contract) {
		int flag = contractService.addContract(contract);
		if (flag == 1)
			return "add success";
		else
			return "add false";
	}
}