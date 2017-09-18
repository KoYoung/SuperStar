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
					&nbsp;&nbsp;贷款企业&nbsp;&nbsp;<input name="comName" type="text" 
					class="easyui-textbox" data-options="prompt:'请输入关键字'">
				</td>
				<td>
					&nbsp;&nbsp;担保人&nbsp;&nbsp;<input name="guaName" type="text" 
					class="easyui-textbox" data-options="prompt:'请输入关键字'">
				</td>
				<td>
					<a class="easyui-linkbutton" 
					data-options="iconCls:'icon-search'" id="find">查询</a>
				</td>
			</tr>
		</table>
	</form>
	<input type="hidden" id="one" value="<%=request.getParameter("id") %>">
	<table id="dg"></table>
</body>
<script type="text/javascript">
$("#find").click(function(){
	var data = $("#search").serialize();
	//alert(data);
	$.ajax({
		url : "/badLoan/find/searchComGuarantor",
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








$(function(){
	var a = $("#one").val();;
	$.ajax({
		url : "/badLoan/find/findComGuarantor",
		type : "post",
		data : {comloaninfoId : a},
		success : function(data){
			$("#dg").datagrid({
				data : data,
				singleSelect:true,
				rownumbers:true,
			    fitColumns:true,
				striped:true,
				loadMsg:"努力加载中......",
				columns : [[
					{field:'comloaninfoId',title:'编号',width:100},
					{field:'comName',title:'贷款企业',width:100},
					{field:'legalName',title:'法人代表',width:100},
					{field:'guaName',title:'担保人',width:100},
					{field:'guaPhone',title:'联系电话',width:100},
					{field:'guaCardtype',title:'证件类型',width:100},
					{field:'guaCardnumber',title:'证件号码',width:100},
					{field:'guaUnit',title:'工作单位',width:100},
					{field:'guaPosition',title:'职位',width:100},
					{field:'guaEducation',title:'学历',width:100},
					{field:'guaIncome',title:'收入',width:100}
				]]
			});
		}
	});
});
	
</script>
</html>