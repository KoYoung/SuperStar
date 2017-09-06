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
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/bootstrap/easyui.css"
	type="text/css"></link>
</head>
<body>
	<table id="dg"></table>
</body>
<script type="text/javascript">
	$("#dg").datagrid({
		url : "/badLoan/find/findComLoan",
		pagination:true,//开启分页功能
		pageNumber:1,
		pageSize:5,
		pageList:[5,10,15,20,25,30],
	    fitColumns:true,
		striped:true,
		loadMsg:"努力加载中......",
		columns : [[
			{field:'comName',title:'贷款人'},
			{field:'legalName',title:'法人代表'},
			{field:'loantypeName',title:'贷款类型'},
			{field:'bankinfoName',title:'银行'},
			{field:'loanNumber',title:'贷款金额'},
			{field:'empName',title:'经手人'},
			{field:'loanDate',title:'贷款日期'},
			{field:'loanRepaymentdate',title:'还款日期'},
			{field:'loanstateName',title:'贷款状态'},
			{field:'findComPledge',title:'抵押物品',
	        	formatter:function(value,row,index){
	        		var str='<a href="findComPledge.jsp" name="findComPledge" id="findComPledge" class="easyui-linkbutton" >查看详情</a>';
	        		return str;
	        	}
	        },
	        {field:'findComGuarantor',title:'担保人',
	        	formatter:function(value,row,index){
	        		var str='<a href="findComGuarantor.jsp" name="findComGuarantor" id="findComGuarantor" class="easyui-linkbutton" >查看详情</a>';
	        		return str;
	        	}
	        }
		]]
	});
</script>
</html>