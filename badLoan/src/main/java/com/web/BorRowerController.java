package com.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.entity.BorRower;
import com.entity.Contect;
import com.entity.ContectUser;
import com.service.BorRowerService;
import com.util.FileUpload;
import com.util.Paging;
import com.util.PagingResult;
/**
 * 张少华
 * 个人
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/borrower")
public class BorRowerController {
	@Autowired
	private BorRowerService borRowerService;
	@RequestMapping("/findborr")
	@ResponseBody
	public PagingResult findBor(HttpServletRequest request,HttpServletResponse response) {
		int page=Integer.parseInt(request.getParameter("page"));
		int rows=Integer.parseInt(request.getParameter("rows"));
		List<BorRower> list=borRowerService.findBorRowers();
		Paging<BorRower>paging=new Paging<BorRower>();
		List<BorRower> list1=paging.paging(list, rows, page);
		PagingResult<BorRower>pResult=new PagingResult<BorRower>();
		pResult.setTotal(list.size());
		pResult.setRows(list1);
		return pResult;
	}
	
	@RequestMapping("/findbormohu")
	@ResponseBody
	public PagingResult findbormohu(@RequestParam(value="va") String va, HttpServletRequest request){
		int page=Integer.parseInt(request.getParameter("page"));
		int rows=Integer.parseInt(request.getParameter("rows"));
		//System.out.println(request.getParameter("#mohu"));
		//String str = request.getParameter("va");
		try {
			va = new String(va.getBytes("iso-8859-1"),"UTF-8");
			System.out.println("sssssssssssssssssssssss"+va);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<BorRower>list=borRowerService.findBorRowersMohu(va);
		Paging<BorRower>paging=new Paging<BorRower>();
		List<BorRower> list1=paging.paging(list, rows, page);
		PagingResult<BorRower>pResult=new PagingResult<BorRower>();
		pResult.setTotal(list.size());
		pResult.setRows(list1);
		return pResult;
	} 
	@RequestMapping("/addbor")
	@ResponseBody
	public String  addbor(BorRower bor,Contect contect,ContectUser contectUser,MultipartFile borP,HttpServletRequest request) throws IOException{
		String  filePash= FileUpload.uploadFile(borP, request);
		bor.setBorPhoto(filePash);
		System.out.println("=====bor==="+bor.getBorPhoto());
		int flag=borRowerService.addBorrowers(bor, contect,contectUser);
		if(flag>0){
			return "success";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("/modify")
	@ResponseBody
	public String  modifyBorRower(@RequestBody String  string){
		BorRower bor=JSON.parseObject(string, BorRower.class);
		ContectUser contectUser=JSON.parseObject(string, ContectUser.class);
		Contect contect=JSON.parseObject(string, Contect.class);
		int flag=borRowerService.modifyBorRower(bor,contectUser,contect);
		if (flag>0) {
			return "success";
		}else{
			return "error";
		}
	};
	/**
	 * 查询所有个人用户编号
	 */
	@RequestMapping("/findBorId")
	@ResponseBody
	public List<BorRower> findBorId(){
		List<BorRower> bList = borRowerService.findBorId();
		return bList;
	}
}
