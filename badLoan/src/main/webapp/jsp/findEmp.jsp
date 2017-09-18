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
	<form id="search" method="post">
		<table>
			<tr>
				<td>
					&nbsp;&nbsp;负责人&nbsp;&nbsp;<input name="empName" type="text" 
					class="easyui-textbox" data-options="prompt:'请输入关键字'">
				</td>
				<td>
					&nbsp;&nbsp;银行&nbsp;&nbsp;<input name="bankinfoName" 
					type="text" id="bankSearch" >
				</td>
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;<a class="easyui-linkbutton" 
					data-options="iconCls:'icon-search'" id="find">查询</a>	
				</td>
			</tr>
		</table>
	</form>
	<table id="dg"></table>
</body>
<script type="text/javascript">
$("#find").click(function(){
	var data = $("#search").serialize();
	//alert(data);
	$.ajax({
		url : "/badLoan/find/searchEmp",
		type : "post",
		data : data,
		success : function(data){
			$("#dg").datagrid({
				url : "",
				data : data
			});
			//$('#dg').datagrid("reload");
		},
		error : function(){
			alert("error!");
		}
	});
});

$("#bankSearch").combobox({
	url : '/badLoan/BankInfo/findBankInfo',
	valueField : 'bankInfoName',
	textField : 'bankInfoName',
	panelHeight : 'auto',
	value : '----选择银行----'
});







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
		{field:'empId',title:'编号',width:50},
		{field:'empName',title:'经手人',width:50},
		{field:'empGender',title:'性别',width:50},
		{field:'empNation',title:'民族',width:50},
		{field:'empTelphone',title:'联系方式',width:100},
		{field:'empEmail',title:'E-mail',width:120},
		{field:'empCardnumber',title:'证件号码',width:120},
		{field:'empAddress',title:'地址',width:120},
		{field:'empEducation',title:'学历',width:80},
		{field:'empDepartment',title:'部门',width:80},
		{field:'bankinfoName',title:'所属银行',width:80}
	]],
	toolbar : [{
		text : '查看个人贷款',
		iconCls : 'icon-search',
		handler : function() {
			var row = $('#dg').datagrid("getSelected");
			if(row == null){
				alert("请先选择一行数据!");
			}else{
				var a = row.empId;
				window.location.href = "findEmpBor.jsp?id="+a+"";
			}
		}
	}, {
		text : '查看企业贷款',
		iconCls : 'icon-search',
		handler : function() {
			var row = $('#dg').datagrid("getSelected");
			if(row == null){
				alert("请先选择一行数据!");
			}else{
				var a = row.empId;
				window.location.href = "findEmpCom.jsp?id="+a+"";
			}
		}
	} ]
});
	
</script>
</html>