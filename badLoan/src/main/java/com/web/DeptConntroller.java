package com.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.entity.Dept;
import com.service.DeptService;

@Controller
@RequestMapping("/Dept")
public class DeptConntroller {
	@Autowired
	private DeptService des;
	@RequestMapping("/DeptFind")
	private void findDept(HttpServletResponse resp){
		List<Dept> DeptList = des.findDept();
		String listJSON = JSON.toJSONString(DeptList);
		try {
			resp.getWriter().write(listJSON);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	private int addDept(){
		return 0;
		
	}
}
