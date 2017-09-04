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
	<table id="legalDataGrid"></table>
	<div id="addLegalDirlog">
		<table>
			<tr>
				<td>法人编号</td>
				<td><input type="text" id="legalId"></td>
			</tr>
			<tr>
				<td>法人姓名</td>
				<td><input type="text" id="legalName"></td>
			</tr>
			<tr>
				<td>证件类型</td>
				<td><input type="text" id="legalCardtype"></td>
			</tr>
			<tr>
				<td>证件号码</td>
				<td><input type="text" id="legalCardnumber"></td>
			</tr>
			<tr>
				<td>民族</td>
				<td><input type="text" id="legalNation" /></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input type="text" id="legalGender"></td>
			</tr>
			<tr>
				<td>婚否</td>
				<td><input type="text" id="legalMarry"></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" id="legalAddress"></td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td><input type="text" id="legalPhone"></td>
			</tr>
			<tr>
				<td>资料</td>
				<td><input id="legalInfo" /></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
	function myFormSubmit() {
		var data = {
			legalId : $("#legalId").val(),
			legalName : $("#legalName").val(),
			legalCardtype : $("#legalCardtype").val(),
			legalCardnumber : $("#legalCardnumber").val(),
			legalNation : $("#legalNation").val(),
			legalGender : $("#legalGender").val(),
			legalMarry : $("#legalMarry").val(),
			legalAddress : $("#legalAddress").val(),
			legalPhone : $("#legalPhone").val(),
			legalInfo : $("#legalInfo").val()
		};
		$.ajax({
			url : '/badLoan/legalController/addLegal',
			contentType : "application/json;charset:UTF-8",
			data : data,
			success : function(data1) {
				alert(data1);
			},
			error : function() {
				alert("sorry borther");
			}
		});
	}
	$(function() {
		$('#legalDataGrid').datagrid({
			url : '/badLoan/legalController/findLegal',
			rownumbers : true, //显示行号
			pagination : true, //显示分页
			pageSize : 5, //默认显示多少行
			pageList : [ 5, 10, 15, 20 ],//行号下拉列表
			sortOrder : 'asc',//默认升序
			remoteSort : false,//不去服务器排序
			fitColumns : true,
			columns : [ [ {
				field : 'legalId',
				title : '法人编号',
				width : 100
			}, {
				field : 'legalName',
				title : '法人代表姓名',
				width : 100
			}, {
				field : 'legalCardtype',
				title : '证件类型',
				width : 100
			}, {
				field : 'legalCardnumber',
				title : '证件号码',
				width : 100
			}, {
				field : 'legalNation',
				title : '民族',
				width : 100
			}, {
				field : 'legalGender',
				title : '性别',
				width : 100
			}, {
				field : 'legalMarry',
				title : '婚否',
				width : 100
			}, {
				field : 'legalAddress',
				title : '法人户籍地址',
				width : 100
			}, {
				field : 'legalPhone',
				title : '联系电话',
				width : 100
			}, {
				field : 'legalInfo',
				title : '备注',
				width : 100
			} ] ],
			toolbar : [ {
				iconCls : 'icon-edit',
				handler : function() {
					$('#addLegalDirlog').dialog("open");
				}
			}, '-', {
				iconCls : 'icon-help',
				handler : function() {
					alert('帮助按钮');
				}
			} ]
		});
		$('#addLegalDirlog').dialog({
			title : '增加法人代表',
			width : 500,
			height : 350,
			closed : true,
			cache : false,
			modal : true,
			buttons : [ {
				iconCls : 'icon-edit',
				text : '保存',
				handler : function() {
					myFormSubmit();
					$('#addLegalDirlog').dialog("close");
				}
			}, {
				iconCls : 'icon-close',
				text : '取消',
				handler : function() {
					$('#addLegalDirlog').dialog("close");
				}
			} ]
		});
	});
</script>