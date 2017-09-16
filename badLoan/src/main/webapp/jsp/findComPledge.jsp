<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- js文件 -->
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
	<input type="hidden" id="one" value="<%=request.getParameter("id")%>">
	<table id="dg"></table>
</body>
<script type="text/javascript">
	$(function() {
		var a = $("#one").val();
		$.ajax({
			url : "/badLoan/find/findComPledge",
			type : "post",
			data : {
				comloaninfoId : a
			},
			success : function(data) {
				$("#dg").datagrid({
					url : data,
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
						field : 'comloaninfoId',
						title : '编号',
						width : 100
					}, {
						field : 'comName',
						title : '贷款企业',
						width : 100
					}, {
						field : 'legalName',
						title : '法人代表',
						width : 100
					}, {
						field : 'pledgeGenre',
						title : '抵押或质押',
						width : 100
					}, {
						field : 'pledgeName',
						title : '抵押物品',
						width : 100
					}, {
						field : 'pledgeValue',
						title : '价值',
						width : 100
					}, {
						field : 'pledgePhoto',
						title : '照片',
						width : 100
					} ] ]
				});
			}
		});

	});
</script>
</html>