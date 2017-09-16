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
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
</head>
<body>
	<a id="btn1" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'"> 查询个人贷款 </a>
	<a id="btn2" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'"> 查询企业贷款 </a>
	<table id="dg"></table>
</body>
<script type="text/javascript">
	$("#dg").datagrid({
		url : "/badLoan/find/findGuarantor",
		pagination : true,//开启分页功能
		pageNumber : 1,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20, 25, 30 ],
		singleSelect : true,
		rownumbers : true,
		fitColumns : true,
		striped : true,
		loadMsg : "努力加载中......",
		columns : [ [ {
			field : 'guaId',
			title : '编号',
			width : 100
		}, {
			field : 'guaName',
			title : '担保人',
			width : 100
		}, {
			field : 'guaGender',
			title : '性别',
			width : 100
		}, {
			field : 'guaNation',
			title : '民族',
			width : 100
		}, {
			field : 'guaPhone',
			title : '联系方式',
			width : 100
		}, {
			field : 'guaCardtype',
			title : '证件类型',
			width : 100
		}, {
			field : 'guaCardnumber',
			title : '证件号码',
			width : 100
		}, {
			field : 'guaRegister',
			title : '户籍地址',
			width : 100
		}, {
			field : 'guaAddress',
			title : '居住地址',
			width : 100
		}, {
			field : 'guaUnit',
			title : '工作单位',
			width : 100
		}, {
			field : 'guaPosition',
			title : '职位',
			width : 100
		}, {
			field : 'guaEducation',
			title : '学历',
			width : 100
		}, {
			field : 'guaIncome',
			title : '收入',
			width : 100
		} ] ]
	});

	$("#btn1").click(function() {
		var rows = $("#dg").datagrid("getSelections");
		var a = rows[0]["guaId"];
		window.location.href = "findGuarantorBor.jsp?id=" + a + "";
	});

	$("#btn2").click(function() {
		var rows = $("#dg").datagrid("getSelections");
		var a = rows[0]["guaId"];
		window.location.href = "findGuarantorCom.jsp?id=" + a + "";
	});
</script>
</html>