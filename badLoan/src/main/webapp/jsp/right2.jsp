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
	<table id="proDataGrid"></table>
	<div id="toolbar">
		<a id="addBtn" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'">添加权限</a> <a id="stopBtn"
			href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-no'">禁用权限</a> <a id="startBtn"
			href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-ok'">启用权限</a>
	</div>
	<div id="handlerDialog">
		<form id="myForm" method="post">
			<table width="100%" class="formtable">
				<tr>
					<th height="25">权限名称：</th>
					<td><input id="rightName" name="rightName"></td>
				</tr>
				<tr>
					<th height="25">权限路径：</th>
					<td><input id="rightUrl" name="rightUrl"></td>
				</tr>
				<tr>
					<th height="25">父节点：</th>
					<td><input id="rightParent" name="rightParent"></td>
				</tr>
				<tr>
					<th height="25">权限状态：</th>
					<td><input id="rightFlag" name="rightFlag"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<script>
	$("#rightParent").combobox({
		url : '/badLoan/right/findParentRight',
		valueField : 'rightId',
		textField : 'rightName',
		panelHeight : 'auto',
		onLoadSuccess : function() {
			$("#rightParent").combobox("setValue", "无");
		}
	});
	$("#rightUrl").combobox({
		url : '/badLoan/right/findAllUrl',
		valueField : 'fileId',
		textField : 'fileName',
		onLoadSuccess : function() {
			$("#rightUrl").combobox("setValue", "无");
		}
	});
	$("#rightFlag").combobox({
		valueField : 'rightFlag',
		textField : 'rightFlagName',
		panelHeight : 'auto',
		data : [ {
			rightFlag : "0",
			rightFlagName : "禁用"
		}, {
			rightFlag : "1",
			rightFlagName : "启用"
		} ],
		onLoadSuccess : function() {
			$("#rightFlag").combobox("setValue", 0);
		}
	});
	$("#addBtn").click(function() {
		$('#handlerDialog').dialog("open");
	});
	$("#stopBtn").click(function() {
		var row = $('#proDataGrid').datagrid("getSelected");
		if (row == null) {
			alert("请选择想要禁用的权限");
		} else if (row.rightFlag == "0") {
			alert("已经是禁用状态了");
		} else {
			$.ajax({
				url : "/badLoan/right/stopRightById",
				type : "post",
				data : JSON.stringify(row),
				contentType : "application/JSON;charset=UTF-8",
				success : function(data) {
					alert("禁用成功");
					$('#proDataGrid').datagrid();
				}
			});
		}
	});
	$("#startBtn").click(function() {
		var row = $('#proDataGrid').datagrid("getSelected");
		if (row == null) {
			alert("请选择想要禁用的权限");
		} else if (row.rightFlag == "1") {
			alert("已经是启用状态了");
		} else {
			$.ajax({
				url : "/badLoan/right/startRightById",
				type : "post",
				data : JSON.stringify(row),
				contentType : "application/JSON;charset=UTF-8",
				success : function(data) {
					alert("启用成功");
					$('#proDataGrid').datagrid();
				}
			});
		}
	});
	$('#handlerDialog').dialog({
		title : '增加权限',
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
					url : "/badLoan/right/addRight",
					onSubmit : function() {
						var isValid = $(this).form('validate');
						return isValid;
					},
					success : function(data) {
						alert("添加成功！");
						$('#proDataGrid').datagrid();
						$('#handlerDialog').dialog("close");
					}
				});
			}
		}, {
			text : '取消',
			handler : function() {
				$('#handlerDialog').dialog("close");
			}
		} ]
	});

	//-----------------------------
	$(function() {
		$('#proDataGrid').datagrid({
			url : '/badLoan/right/findRight',
			// data:data,
			striped : true,//显示斑马线
			pageSize : 5,
			rownumbers : true, //显示行号
			pagination : true, //显示分页
			singleSelect : true,
			pageSize : 10, //默认显示多少行
			pageList : [ 5, 10, 15, 20 ],//行号下拉列表
			sortOrder : 'asc',//默认升序
			remoteSort : false,//不去服务器排序
			fitColumns : true,
			toolbar : '#toolbar',
			columns : [ [ {
				field : 'rightId',
				title : '权限编号',
				width : 100
			}, {
				field : 'rightName',
				title : '权限名称',
				width : 100
			}, {
				field : 'rightUrl',
				title : '子节点',
				width : 100
			}, {
				field : 'rightParent',
				title : '父节点',
				width : 100
			}, {
				field : 'rightFlag',
				title : '权限状态',
				width : 100
			} ] ]
		});
	});
</script>