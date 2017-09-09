<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- js文件 -->
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/bootstrap/easyui.css"
	type="text/css"></link>
	<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
</head>
<body>
	<a id="btn1" class="easyui-linkbutton" data-options="iconCls:'icon-search'">
		查询担保人
	</a>
	<a id="btn2" class="easyui-linkbutton" data-options="iconCls:'icon-search'">
		查询抵押物品
	</a>
	<table id="dg"></table>
</body>
<script type="text/javascript">
	$("#dg").datagrid({
		url : "/badLoan/find/findBorLoan",
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
			{field:'borloaninfoId',title:'编号',width:100},
			{field:'borName',title:'贷款人',width:100},
			{field:'loantypeName',title:'贷款类型',width:100},
			{field:'bankinfoName',title:'银行',width:100},
			{field:'loanNumber',title:'贷款金额',width:100},
			{field:'empName',title:'经手人',width:100},
			{field:'loanDate',title:'贷款日期',width:150},
			{field:'loanRepaymentdate',title:'还款日期',width:150},
			{field:'loanstateName',title:'贷款状态',width:100}
		]]
	});

	$("#btn1").click(function(){
		var rows = $("#dg").datagrid("getSelections");
		var a = rows[0]["borloaninfoId"];
		window.location.href = "findBorGuarantor.jsp?id="+a+"";
	});
	
	$("#btn2").click(function(){
		var rows = $("#dg").datagrid("getSelections");
		var a = rows[0]["borloaninfoId"];
		window.location.href = "findBorPledge.jsp?id="+a+"";
	});
	
	
	
</script>
</html>