package com.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Emp;
import com.entity.Users;
import com.service.EmpService;
import com.util.Paging;
import com.util.PagingResult;

/**
 * 
 *
 */
@Controller
@RequestMapping("/Emp")
public class EmpController {
	@Autowired
	private EmpService es;

	@RequestMapping("/findEmp")
	@ResponseBody
	/*public List<Emp> findDept() {
		List<Emp> deptList = es.findEmp();
		return deptList;
	}*/
	public PagingResult<Emp> findEmp(@RequestParam Integer rows, Integer page){
		List<Emp> empList = es.findEmp();
		Paging<Emp> pagingMap = new Paging<Emp>();
		List<Emp> list1 = pagingMap.paging(empList, rows, page);
		PagingResult<Emp> pResult = new PagingResult<Emp>();
		pResult.setTotal(empList.size());
		pResult.setRows(list1);
		System.out.println(pResult);
		return pResult;
	
	}

	@RequestMapping(value="/addEmp", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String addEmp(Emp emp) {
		System.out.println(emp);
		int flag = es.addEmp(emp);
		if (flag > 0)
			return "success";
		else
			return "error";
	}
	@RequestMapping("/modifyEmp")
	@ResponseBody
	public String modifyEmp(Emp empId){
		System.out.println("++++++++++++"+empId);
		int flag = es.modifyEmp(empId);
		if(flag==1)
			return "success";
		else
			return "error";
	}

	@RequestMapping("/findIdEmp")
	@ResponseBody
	public List<Emp> findIdEmp(Emp empId){
		List<Emp> elist = es.findIdEmp(empId);
		return elist;
		
	}
}
