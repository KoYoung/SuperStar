package com.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.BorRower;
import com.service.BorRowerService;
@Controller
@RequestMapping("/borrower")
public class BorrowerController {
	@Autowired
	private  BorRowerService borrowerService;
	@RequestMapping("/findborr")
	@ResponseBody
	public List findBor(){
		List<BorRower> lBorrowers=borrowerService.findBorRowers();
		System.out.println("------------------------");
		System.out.println(lBorrowers);
		return lBorrowers;
	}
	@RequestMapping("/addbor")
	public void addbor(BorRower bor,HttpServletResponse response){
		int flag=borrowerService.updataBorrowers(bor);
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
