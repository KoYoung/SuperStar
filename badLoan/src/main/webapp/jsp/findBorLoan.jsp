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

<link rel="stylesheet" href="../easyui/themes/metro-gray/easyui.css" type="text/css"></link>
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
</head>
<body>
	<form id="search" method="post">
		<table>
			<tr>
				<td>
					&nbsp;&nbsp;贷款人&nbsp;&nbsp;<input name="borName" type="text" 
					class="easyui-textbox" data-options="prompt:'请输入关键字'">
				</td>
				<td>
					&nbsp;&nbsp;贷款状态&nbsp;&nbsp;<input name="loanstateName" 
					type="text" id="loanStateSearch" >
				</td>
				<td>
					&nbsp;&nbsp;银行&nbsp;&nbsp;<input name="bankinfoName" 
					type="text" id="bankSearch" >
				</td>
			</tr>
			<tr>
				<td colspan="2">
					&nbsp;&nbsp;日期&nbsp;&nbsp;<input type="text" 
					class="easyui-datebox" name="loanDate">&nbsp;&nbsp;
					~&nbsp;&nbsp;<input type="text" class="easyui-datebox" 
					name="loanRepaymentdate">
				</td>
				<td>
					&nbsp;&nbsp;负责人&nbsp;&nbsp;<input name="empName" type="text" 
					class="easyui-textbox" data-options="prompt:'请输入关键字'">
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
		url : "/badLoan/find/searchBorLoan",
		type : "post",
		data : data,
		success : function(data){
			//alert(data);
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

$("#loanStateSearch").combobox({
	url : '/badLoan/loanStateController/findLoanState',
	valueField : 'LOANSTATENAME',
	textField : 'LOANSTATENAME',
	panelHeight : 'height',
	value : '----选择状态----'
});
$("#bankSearch").combobox({
	url : '/badLoan/BankInfo/findBankInfo',
	valueField : 'bankInfoName',
	textField : 'bankInfoName',
	panelHeight : 'auto',
	value : '----选择银行----'
});



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
	]],
	toolbar : [{
		text : '查看担保人',
		iconCls : 'icon-search',
		handler : function() {
			var row = $('#dg').datagrid("getSelected");
			if(row == null){
				alert("请先选择一行数据!");
			}else{
				var a = row.borloaninfoId;
				window.location.href = "findBorGuarantor.jsp?id="+a+"";
			}
		}
	},{
		text : '查看抵押物品',
		iconCls : 'icon-search',
		handler : function() {
			var row = $('#dg').datagrid("getSelected");
			if(row == null){
				alert("请先选择一行数据!");
			}else{
				var a = row.borloaninfoId;
				window.location.href = "findBorPledge.jsp?id="+a+"";
			}
		}
	} ]
});
</script>
</html>