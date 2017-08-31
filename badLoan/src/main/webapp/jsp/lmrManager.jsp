<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/bootstrap/easyui.css"
	type="text/css"></link>
</head>
<body>
	<table id="lmrDataGrid"></table>
</body>
</html>
<script>
	$(function() {
		$('#lmrDataGrid').datagrid({
			url : '/badLoan/lmrController/findlmr',
			rownumbers : true, //显示行号
			pagination : true, //显示分页
			pageSize : 5, //默认显示多少行
			pageList : [ 5, 10, 15, 20 ],//行号下拉列表
			sortOrder : 'asc',//默认升序
			remoteSort : false,//不去服务器排序
			fitColumns : true,
			columns : [ [ {
				field : 'lmrId',
				title : '贷款处理编号',
				width : 100
			}, {
				field : 'empId',
				title : '处理员工编号',
				width : 100
			}, {
				field : 'lmrDate',
				title : '处理日期',
				width : 100
			}, {
				field : 'lmrName',
				title : '处理方式',
				width : 100
			}, {
				field : 'lmrComment',
				title : '备注说明',
				width : 100
			} ] ]
		});
	});
</script>