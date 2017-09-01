<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/bootstrap/easyui.css"
	type="text/css"></link>
<script src="https://cdn.hcharts.cn/highcharts/5.0.10/highcharts.js"></script>
<script
	src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/exporting.js"></script>
<script src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/data.js"></script>
<script
	src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/drilldown.js"></script>
</head>
<body>
	<div><h1>个人客户信息</h1></div>
	<div id="toobar">
		<a id="addpersonal" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'">添加个人客户信息</a>
		 <a id="selpersonal"
			href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a>
	</div>
	<table id="personal"></table>
<!-- 	<div id="fenye" style="background:#efefef;border:1px solid #ccc;"></div>-->	
	<script type="text/javascript">
		$(function(){
			alert("1");
			$("#personal").datagrid({
				
				url:"/badLoan/borrower/findborr",
				 	pagination:true,//开启分页功能
					pageNumber:1,
					pageSize:5,
					pageList:[5,10,15,20,25,30],
					sortName:'empno',//定义哪些列可以进行排序
					sortOrder:'desc',//定义列的排序顺序,默认正序asc
				    fitColumns:true,
					striped:true,
					loadMsg:"努力加载中......", 
				frozenColumns:[[{field : 'borId',title : '编号',width : 100},
				         	    {field : 'borName',title : '姓名',width : 100},
						 	  ]],
			    columns:[[
				         {field : 'borGender',title : '性别',width : 100},
				         {field : 'borBirthday',title : '出生年月',width : 100},
				         {field : 'borNation',title : '民族',width : 100},
				         {field : 'borMarry',title : '婚姻',width : 100},
				         {field : 'borCardtype',title : '证件类型',width : 100},
				         {field : 'borCardnumber',title : '证件号码',width : 100},
				         {field : 'borRegister',title : '户籍',width : 100},
				         {field : 'borAddress',title : '地址',width : 100},
				         {field : 'borUnit',title : '单位',width : 100},
				         {field : 'borUnitAddress',title : '单位地址',width : 100},
				         {field : 'borUnitPhone',title : '单位电话',width : 100},
				         {field : 'borPosition',title : '职务',width : 100},
				         {field : 'borIncome',title : '收入',width : 100},
				         {field : 'borPhone',title : '电话',width : 100},
				         {field : 'borPostcode',title : '邮编',width : 100},
				         {field : 'borEducation',title : '学历',width : 100},
				         {field : 'borCredit',title : '信贷',width : 100},
				         {field : 'borPhoto',title : '照片',width : 100},
				         ]]
			});
			alert("2");
			$("addpersonal").click(function(){
				url:"/badLoan/jsp/addpersonal.jsp"
			});
			$("selpersonal").click(function(){
				url:"/badLoan/jsp/personal.jsp"
			});
		/*  分页     */
		/* 	$('#fenye').pagination({ 
				total:100, 
				pageSize:10 
				});  */
		});
	</script>
</body>
</html>