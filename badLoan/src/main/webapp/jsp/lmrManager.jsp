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
<link rel="stylesheet" href="../easyui/themes/bootstrap/easyui.css"
	type="text/css"></link>
</head>
<body>
	<table id="lmrDataGrid"></table>
	<div id="addlmrDirlog">
		<table>
			<tr>
				<td>贷款处理编号</td>
				<td><input type="text" id="lmrId"></td>
			</tr>
			<tr>
				<td>处理员工编号</td>
				<td><input type="text" id="empId"></td>
			</tr>
			<tr>
				<td>处理日期</td>
				<td><input type="text" id="lmrDate"></td>
			</tr>
			<tr>
				<td>处理方式</td>
				<td><input type="text" id="lmrName"></td>
			</tr>
			<tr>
				<td>备注说明</td>
				<td><textarea id="lmrComment"></textarea></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
	function myFormSubmit() {
		var data = {
			lmrId : $("#lmrId").val(),
			empId : $("#empId").val(),
			lmrDate : $("#lmrDate").val(),
			lmrName : $("#lmrName").val(),
			lmrComment : $("#lmrComment").val(),
		};
		alert(data.lmrId + " " + data.empId + " " + data.lmrDate + " "
				+ data.lmrName + " " + data.lmrComment + " ");
		$.ajax({
			url : '/badLoan/lmrController/addlmr',
			contentType : "application/json;charset:UTF-8",
			data : data,
			success : function(data1) {
				alert(data1);
			}
		});
	}
	$(function() {
		$('#lmrDataGrid').datagrid({
			url : '/badLoan/lmrController/findlmr',
			rownumbers : true, //显示行号
			pagination : true, //显示分页
			pageSize : 5, //默认显示多少行
			pageList : [ 5, 10, 15, 20 ],//行号下拉列表
			sortOrder : 'asc',//默认升序
			remoteSort : false,//不去服务器排序
			fitColumns : true,
			columns : [ [ {
				field : 'lmrId',
				title : '贷款处理编号',
				width : 100
			}, {
				field : 'empId',
				title : '处理员工编号',
				width : 100
			}, {
				field : 'lmrDate',
				title : '处理日期',
				width : 100
			}, {
				field : 'lmrName',
				title : '处理方式',
				width : 100
			}, {
				field : 'lmrComment',
				title : '备注说明',
				width : 100
			} ] ],
			toolbar : [ {
				iconCls : 'icon-edit',
				handler : function() {
					alert('编辑按钮');
					$('#addlmrDirlog').dialog("open");
				}
			}, '-', {
				iconCls : 'icon-help',
				handler : function() {
					alert('帮助按钮');
				}
			} ]
		});
		$('#addlmrDirlog').dialog({
			title : '增加催收记录',
			width : 500,
			height : 300,
			closed : true,
			cache : false,
			modal : true,
			buttons : [ {
				iconCls : 'icon-edit',
				text : '保存',
				handler : function() {
					myFormSubmit();
					$('#addlmrDirlog').dialog("close");
				}
			}, {
				iconCls : 'icon-help',
				text : '取消',
				handler : function() {
					alert('帮助按钮');
					$('#addlmrDirlog').dialog("close");
				}
			} ]
		});
	});
</script>