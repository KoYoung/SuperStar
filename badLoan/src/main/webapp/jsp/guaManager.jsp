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
	<table id="guaDataGrid"></table>
	<div id="addGuaDirlog">
		<table>
			<tr>
				<td>担保人编号</td>
				<td><input type="text" id="guaId"></td>
			</tr>
			<tr>
				<td>担保人姓名</td>
				<td><input type="text" id="guaName"></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input type="text" id="guaGender"></td>
			</tr>
			<tr>
				<td>联系方式</td>
				<td><input type="text" id="guaPhone"></td>
			</tr>
			<tr>
				<td>出生日期</td>
				<td><input id="guaBirthday" /></td>
			</tr>
			<tr>
				<td>证件类型</td>
				<td><input type="text" id="guaCardType"></td>
			</tr>
			<tr>
				<td>证件号</td>
				<td><input type="text" id="guaCardNumber"></td>
			</tr>
			<tr>
				<td>户籍地址</td>
				<td><input type="text" id="guaRegister"></td>
			</tr>
			<tr>
				<td>住址</td>
				<td><input type="text" id="guaAddress"></td>
			</tr>
			<tr>
				<td>单位</td>
				<td><input id="guaUnit" /></td>
			</tr>
			<tr>
				<td>职位</td>
				<td><input type="text" id="guaPosition"></td>
			</tr>
			<tr>
				<td>婚否</td>
				<td><input type="text" id="guaMarry"></td>
			</tr>
			<tr>
				<td>民族</td>
				<td><input type="text" id="guaNation"></td>
			</tr>
			<tr>
				<td>学历</td>
				<td><input type="text" id="guaEducation"></td>
			</tr>
			<tr>
				<td>收入</td>
				<td><input id="guaIncome" /></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
	function myFormSubmit() {
		var data = {
			guaId : $("#guaId").val(),
			guaName : $("#guaName").val(),
			guaGender : $("#guaGender").val(),
			guaPhone : $("#guaPhone").val(),
			guaBirthday : $("#guaBirthday").val(),
			guaCardType : $("#guaCardType").val(),
			guaCardNumber : $("#guaCardNumber").val(),
			guaRegister : $("#guaRegister").val(),
			guaAddress : $("#guaAddress").val(),
			guaUnit : $("#guaUnit").val(),
			guaPosition : $("#guaPosition").val(),
			guaMarry : $("#guaMarry").val(),
			guaNation : $("#guaNation").val(),
			guaEducation : $("#guaEducation").val(),
			guaIncome : $("#guaIncome").val()
		};
		/* alert(data.guaId + " " + data.guaName + " " + data.guaGender + " "
				+ data.guaPhone + " " + data.guaBirthday + " "
				+ data.guaCardType + " " + data.guaCardNumber + " "
				+ data.guaRegister + " " + data.guaAddress + " " + data.guaUnit
				+ " " + data.guaPosition + " " + data.guaMarry + " "
				+ data.guaNation + " " + data.guaEducation + " "
				+ data.guaIncome + " "); */
		$.ajax({
			url : '/badLoan/guaController/addGua',
			contentType : "application/json;charset:UTF-8",
			data : data,
			success : function(data1) {
				alert(data1);
			}
		});
	}
	$(function() {
		$('#guaDataGrid').datagrid({
			url : '/badLoan/guaController/findGua',
			rownumbers : true, //显示行号
			pagination : true, //显示分页
			pageSize : 10, //默认显示多少行
			pageList : [ 5, 10, 15, 20 ],//行号下拉列表
			sortOrder : 'asc',//默认升序
			remoteSort : false,//不去服务器排序
			fitColumns : true,
			columns : [ [ {
				field : 'guaId',
				title : '担保人编号',
				width : 100
			}, {
				field : 'guaName',
				title : '担保人姓名',
				width : 100
			}, {
				field : 'guaGender',
				title : '担保人性别',
				width : 100
			}, {
				field : 'guaPhone',
				title : '担保人联系方式',
				width : 100
			}, {
				field : 'guaBirthday',
				title : '担保人出生年月',
				width : 100
			}, {
				field : 'guaCardType',
				title : '担保人证件类型',
				width : 100
			}, {
				field : 'guaCardNumber',
				title : '担保人证件号码',
				width : 100
			}, {
				field : 'guaRegister',
				title : '担保人户籍地址',
				width : 100
			}, {
				field : 'guaAddress',
				title : '担保人现居住地址',
				width : 100
			}, {
				field : 'guaUnit',
				title : '担保人工作单位',
				width : 100
			}, {
				field : 'guaPosition',
				title : '担保人职位',
				width : 100
			}, {
				field : 'guaMarry',
				title : '担保人婚姻状况',
				width : 100
			}, {
				field : 'guaNation',
				title : '担保人民族',
				width : 100
			}, {
				field : 'guaEducation',
				title : '担保人学历',
				width : 100
			}, {
				field : 'guaIncome',
				title : '担保人收入',
				width : 100
			} ] ],
			toolbar : [ {
				iconCls : 'icon-edit',
				handler : function() {
					$('#addGuaDirlog').dialog("open");
				}
			}, '-', {
				iconCls : 'icon-help',
				handler : function() {
					alert('帮助按钮');
				}
			} ]
		});
		$('#addGuaDirlog').dialog({
			title : '增加担保人记录',
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
					$('#addGuaDirlog').dialog("close");
				}
			}, {
				iconCls : 'icon-close',
				text : '取消',
				handler : function() {
					$('#addGuaDirlog').dialog("close");
				}
			} ]
		});
	});
</script>