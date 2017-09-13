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
	<a id="btn1" class="easyui-linkbutton" data-options="iconCls:'icon-search'">
		查询个人贷款
	</a>
	<a id="btn2" class="easyui-linkbutton" data-options="iconCls:'icon-search'">
		查询企业贷款
	</a>
	<table id="dg"></table>
</body>
<script type="text/javascript">
	$("#dg").datagrid({
		url : "/badLoan/find/findEmp",
		pagination:true,//开启分页功能
		pageNumber:1,
		pageSize:5,
		pageList:[5,10,15,20,25,30],
		singleSelect:true,
		rownumbers:true,
	    fitColumns:true,
		striped:true,
		loadMsg:"努力加载中......",
		columns : [[
			{field:'empId',title:'编号',width:100},
			{field:'empName',title:'经手人',width:100},
			{field:'empGender',title:'性别',width:100},
			{field:'empNation',title:'民族',width:100},
			{field:'empTelphone',title:'联系方式',width:100},
			{field:'empEmail',title:'E-mail',width:100},
			{field:'empCardnumber',title:'证件号码',width:100},
			{field:'empAddress',title:'地址',width:100},
			{field:'empEducation',title:'学历',width:100},
			{field:'empDepartment',title:'部门',width:100},
			{field:'bankinfoName',title:'所属银行',width:100}
		]]
	});
	
	$("#btn1").click(function(){
		var rows = $("#dg").datagrid("getSelections");
		var a = rows[0]["empId"];
		window.location.href = "findEmpBor.jsp?id="+a+"";
	});
	
	$("#btn2").click(function(){
		var rows = $("#dg").datagrid("getSelections");
		var a = rows[0]["empId"];
		window.location.href = "findEmpCom.jsp?id="+a+"";
	});
</script>
</html>