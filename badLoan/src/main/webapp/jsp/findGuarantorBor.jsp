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
	<input type="hidden" id="one" value="<%=request.getParameter("id") %>">
	<table id="dg"></table>
</body>
<script type="text/javascript">

$(function(){
	var a = $("#one").val();
	$.ajax({
		url : "/badLoan/find/findGuarantorBor",
		type : "post",
		data : {guaId : a},
		success : function(data){
			$("#dg").datagrid({
				data : data,
				singleSelect:true,
				rownumbers:true,
			    fitColumns:true,
				striped:true,
				loadMsg:"努力加载中......",
				columns : [[
					{field:'guaId',title:'编号',width:100},
					{field:'guaName',title:'担保人',width:100},
					{field:'borName',title:'贷款人',width:100},
					{field:'bankinfoName',title:'银行',width:100},
					{field:'loanNumber',title:'贷款金额',width:100},
					{field:'contectName',title:'紧急联系人',width:100},
					{field:'loanDate',title:'贷款日期',width:100},
					{field:'loanRepaymentdate',title:'还款日期',width:100},
					{field:'loanstateName',title:'贷款状态',width:100}
				]]
			});
		}		
	});
});
</script>
</html>