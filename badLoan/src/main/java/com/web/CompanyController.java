package com.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Company;
import com.service.CompanyService;
@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	@ResponseBody
	@RequestMapping("/findcompany")
	public List findCompany(){
		List<Company>lCompanies=companyService.findCompany();
		System.out.println("--------------------");
		return lCompanies;
	}
	
	@RequestMapping("/addcompany")
	public void addCompany(Company company,HttpServletResponse response){
		int flag=companyService.addCompany(company);
		try {
			if (flag>0) {
				response.getWriter().write("success");
			}else{
				response.getWriter().write("error");
			}
			response.getWriter().flush();
			response.getWriter().close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
