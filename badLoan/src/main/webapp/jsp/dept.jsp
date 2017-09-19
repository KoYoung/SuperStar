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
<link rel="stylesheet" href="../easyui/themes/metro-gray/easyui.css"
	type="text/css"></link>
</head>
<body>
	<table id="deptTab"></table>
</body>
</html>
<script>
	$("#deptTab").datagrid({
		url : '/badLoan/deptController/findDept',
		rownumbers : true, //显示行号
		pagination : true, //显示分页
		singleSelect : true,
		pageSize : 10, //默认显示多少行
		pageList : [ 5, 10, 15, 20 ],//行号下拉列表
		sortOrder : 'asc',//默认升序
		remoteSort : false,//不去服务器排序
		fitColumns : true,
		columns : [ [  {
			field : 'DEPT_ID',
			title : '部门编号',
			width : 100
		},{
			field : 'DEPT_NAME',
			title : '部门名称',
			width : 100
		},{
			field : 'DEPT_PHONE',
			title : '部门电话',
			width : 100
		},{
			field : 'BANKINFO_NAME',
			title : '所属银行',
			width : 100
		} ] ],
		toolbar : [ '-', {
			text : '查看详情',
			iconCls : 'icon-help',
			handler : function() {
			}
		}, '-', {
			text : '查看详情',
			iconCls : 'icon-help',
			handler : function() {
			}
		}, '-', {
			text : '查看详情',
			iconCls : 'icon-help',
			handler : function() {
			}
		} ]
	});
</script>