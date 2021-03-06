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
	<form id="search" method="post">
		<table>
			<tr>
				<td>
					&nbsp;&nbsp;担保人&nbsp;&nbsp;<input name="guaName" type="text" 
					class="easyui-textbox" data-options="prompt:'请输入关键字'">
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
		url : "/badLoan/find/searchGuarantor",
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

$("#dg").datagrid({
	url : "/badLoan/find/findGuarantor",
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
		{field:'guaId',title:'编号',width:50},
		{field:'guaName',title:'担保人',width:50},
		{field:'guaGender',title:'性别',width:40},
		{field:'guaNation',title:'民族',width:50},
		{field:'guaPhone',title:'联系方式',width:100},
		{field:'guaCardtype',title:'证件类型',width:70},
		{field:'guaCardnumber',title:'证件号码',width:120},
		{field:'guaUnit',title:'工作单位',width:150},
		{field:'guaPosition',title:'职位',width:100},
		{field:'guaEducation',title:'学历',width:70},
		{field:'guaIncome',title:'收入',width:70}
	]],
	toolbar : [{
		text : '查看个人贷款',
		iconCls : 'icon-search',
		handler : function() {
			var row = $('#dg').datagrid("getSelected");
			if(row == null){
				alert("请先选择一行数据!");
			}else{
				var a = row.guaId;
				window.location.href = "findGuarantorBor.jsp?id="+a+"";
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
				var a = row.guaId;
				window.location.href = "findGuarantorCom.jsp?id="+a+"";
			}
		}
	} ]
});
</script>
</html>