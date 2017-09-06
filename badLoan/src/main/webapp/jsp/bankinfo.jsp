<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../easyui/themes/default/easyui.css"
	type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<table id="dg"></table>
	
	
</body>
<script>
	
	
	var datagrid;
	datagrid = $('#dg').datagrid({
		url : '/badLoan/BankInfo/findBankInfo',
		rownumbers : true, //显示行号
		pagination : true, //显示分页
		pageSize : 10, //默认显示多少行
		pageList : [ 5, 10, 15, 20 ],//行号下拉列表
		sortName : 'bankInfoId',//默认员工编号
		sortOrder : 'asc',//默认升序
		remoteSort : false,//不去服务器排序
		fitColumns : true,
		cache : false,
		singleSelect : true,
		checkbox : false,
		columns : [ [ {
			field : 'bankInfoId',
			title : '银行编号',
			width : 100
		}, {
			field : 'bankInfoName',
			title : '银行名称',
			width : 100
		}, {
			field : 'bankInfoTelePhone',
			title : '银行电话',
			width : 100,
		}, {
			field : 'bankinfoAddress',
			title : '银行地址',
			width : 100
		} ] ],
		
	});
</script>
</html>