<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/pepperGrinder/easyui.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
</head>
<body>
	<input type="hidden" id="one" value="<%=request.getParameter("id") %>">
	<table id="dg"></table>
</body>
<script type="text/javascript">

$(function(){
	var a = $("#one").val();
	$.ajax({
		url : "/badLoan/find/findEmpCom",
		type : "post",
		data : {empId : a},
		success : function(data){
			$("#dg").datagrid({
				data : data,
				singleSelect:true,
				rownumbers:true,
			    fitColumns:true,
				striped:true,
				loadMsg:"努力加载中......",
				columns : [[
					{field:'empId',title:'编号',width:100},
					{field:'empName',title:'经手人',width:100},
					{field:'deptName',title:'所属部门',width:100},
					{field:'comName',title:'贷款企业',width:100},
					{field:'legalName',title:'法人代表',width:100},
					{field:'bankinfoName',title:'银行',width:100},
					{field:'guaName',title:'担保人',width:100},
					{field:'loanNumber',title:'贷款金额',width:100},
					{field:'loanstateName',title:'贷款状态',width:100}
				]]
			});
		}		
	});
});
</script>
</html>