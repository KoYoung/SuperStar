package com.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Company;
import com.entity.ConpanyLegal;
import com.entity.Legal;
import com.service.CompanyService;
import com.util.FileUpload;
import com.util.Paging;
import com.util.PagingResult;

/**
 * 张少华 客户
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;

	@ResponseBody
	@RequestMapping("/findcompany")
	public PagingResult findCompany(HttpServletRequest request, HttpServletResponse response) {
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		List<Company> list = companyService.findCompany();
		Paging<Company> paging = new Paging<Company>();
		List<Company> list1 = paging.paging(list, rows, page);
		PagingResult<Company> pResult = new PagingResult<Company>();
		pResult.setTotal(list.size());
		pResult.setRows(list1);
		return pResult;
	}

	@RequestMapping("/mohu")
	@ResponseBody
	public PagingResult findcompanymohu(@RequestParam(value = "va") String va, HttpServletRequest request) {
		System.out.println(va);
		try {
			va = new String(va.getBytes("iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		List<Company> list = companyService.findCompanmohu(va);
		Paging<Company> paging = new Paging<Company>();
		List<Company> list1 = paging.paging(list, rows, page);
		PagingResult<Company> prResult = new PagingResult<Company>();
		prResult.setTotal(list.size());
		prResult.setRows(list1);
		return prResult;
	}

	@RequestMapping("/addcompany")
	@ResponseBody
	public String addCompany(Company company, Legal legal, ConpanyLegal conpanyLegal, MultipartFile legalphone,
			HttpServletRequest request) throws IOException {
		String filePash = FileUpload.uploadFile(legalphone, request);
		company.setConPhoto(filePash);
		int flag = companyService.addCompany(company, legal, conpanyLegal);
		if (flag > 0) {
			return "success";
		} else {
			return "error";
		}
	}
	/**
	 * 查询所有企业用户编号
	 */
	@RequestMapping("/findCompanyId")
	@ResponseBody
	public List<Company> findCompanyId(){
		List<Company> cList = companyService.findCompanyId();
		return cList;
	}
}
