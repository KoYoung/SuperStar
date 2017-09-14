<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../easyui/themes/metro-gray/easyui.css"
	type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<table id="proDataGrid"></table>
	<div id="toolbar">
		<a id="addBtn" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'">增加</a>
	</div>

	<div id="handlerDialog">
		<form id="myForm" method="post">
			<table width="100%" class="formtable">
				<!-- <tr>
					<th height="25">用户编号</th>
					<td><input id="proId" name="userId"></td>
				</tr> -->
				<tr>
					<th height="25">用户昵称：</th>
					<td><input id="proName" name="userName"></td>
				</tr>
				<tr>
					<th height="25">用户登录名</th>
					<td><input id="proPrice" name="userUsername"></td>
				</tr>
				<tr>
					<th height="25">用户密码</th>
					<td><input type="password" id="propass" name="userPassword"></td>
				</tr>
				<tr>
					<th height="25">添加员工id</th>
					<td><input id="proemp" name="empId" /></td>
				</tr>
				<tr>
					<th height="25">添加角色</th>
					<td><input id="prorole" name="roleIds" /></td>
				</tr>
			</table>
			<ul id="tt"></ul>
		</form>
	</div>
</body>
<script>
	$('#prorole').combotree(
			{
				valueField : "roleId", //Value字段
				textField : "text", //Text字段
				multiple : true,
				url : '/badLoan/usersController/queryRole2',
				onCheck : function(node, checked) {
					//让全选不显示
					$("#prorole").combotree(
							"setText",
							$("#prorole").combobox("getText").toString()
									.replace("全选,", ""));
				},
				onClick : function(node, checked) {
					//让全选不显示
					$("#prorole").combotree(
							"setText",
							$("#prorole").combobox("getText").toString()
									.replace("全选,", ""));
				}
			});
	$('#proemp').combobox({
		url : '/badLoan/usersController/queryRole1',
		valueField : 'empId',
		textField : 'empName',
		panelHeight : 'auto'
	});
	$("#addBtn").click(function() {
		$('#handlerDialog').dialog("open");
	});
	$('#handlerDialog').dialog({
		title : '添加系统用户',
		iconCls : 'icon-save',
		width : 400,
		height : 300,
		top : 100,
		closed : true,
		cache : false,
		modal : true,
		buttons : [ {
			text : '保存',
			iconCls : 'icon-save',
			handler : function() {
				$('#myForm').form('submit', {
					url : "/badLoan/usersController/addUsers",
					onSubmit : function() {
						var isValid = $(this).form('validate');
						return isValid;
					},
					success : function(data) {
						alert(data);
						$('#proDataGrid').datagrid();
						$('#handlerDialog').dialog("close");
					}
				});
			}
		}, {
			text : '取消',
			handler : function() {
				$('#handlerDialog').dialog("close")
			}
		} ]
	});
	//-----------------------------
	$(function() {
		$('#proDataGrid').datagrid({
			url : '/badLoan/usersController/queryUsers',
			// data:data,
			fitColumns : true,//自动适应网格宽度
			striped : true,//显示斑马线
			idField : "userId",//设置productid为主键
			fit : true,//
			rownumbers : true,
			singleSelect : true,
			pagination : true,
			pageSize : 5,
			pageList : [ 5, 10, 20 ],
			toolbar : "#toolbar",
			columns : [ [ {
				field : 'userId',
				title : '用户编号',
				width : 200
			}, {
				field : 'empName',
				title : '员工姓名',
				width : 200
			}, {
				field : 'userName',
				title : '用户昵称',
				width : 200
			}, {
				field : 'userUsername',
				title : '用户账号',
				width : 200
			}, {
				field : 'roleName',
				title : '角色',
				width : 200
			} ] ]
		});
	});
</script>
</html>