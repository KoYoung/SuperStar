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
	<div id="detailDialog">
		<table id="detailGrid"></table>
	</div>
	<div id="updateLoanDirlog">
		<table>
			<tr>
				<td><span>贷款编号：</span></td>
				<td><span id="borLoanId"></span></td>
			</tr>
			<tr>
				<td><span>贷款人：</span></td>
				<td><span id="borName"></span></td>
			</tr>
			<tr>
				<td><span>贷款金额：</span></td>
				<td><span id="loanNumber"></span></td>
			</tr>
			<tr>
				<td><span>贷款状态：</span></td>
				<td><input type="text" id="loanState"></td>
			</tr>
			<tr>
				<td><span>负责人：</span></td>
				<td><span id="empId_update" style="display: none"></span><span
					id="empName"></span></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
	$("#loanState").combobox({
		url : '/badLoan/loanStateController/findLoanState',
		valueField : 'LOANSTATEID',
		textField : 'LOANSTATENAME'
	});
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
			url : '/badLoan/BorLoanInfo/findBorLoanDetail',
			rownumbers : true, //显示行号
			pagination : true, //显示分页
			singleSelect : true,
			pageSize : 5, //默认显示多少行
			pageList : [ 5, 10, 15, 20 ],//行号下拉列表
			sortOrder : 'asc',//默认升序
			remoteSort : false,//不去服务器排序
			fitColumns : true,
			columns : [ [ {
				field : 'borloaninfoId',
				title : '贷款编号',
				width : 100
			}, {
				field : 'loantypeName',
				title : '贷款种类',
				width : 100
			}, {
				field : 'borName',
				title : '贷款人姓名',
				width : 100
			}, {
				field : 'loanNumber',
				title : '贷款金额',
				width : 100
			}, {
				field : 'loanAccount',
				title : '贷款账户',
				width : 100
			}, {
				field : 'LOANDATE',
				title : '贷款日期',
				width : 100
			}, {
				field : 'LOANREPAYMENTDATE',
				title : '还款日期',
				width : 100
			}, {
				field : 'EMP_NAME',
				title : '负责人',
				width : 100
			}, {
				field : 'LOANSTATE_NAME',
				title : '状态',
				width : 100
			} ] ],
			toolbar : [ {
				iconCls : 'icon-edit',
				handler : function() {
					alert('编辑按钮1');
					$('#addlmrDirlog').dialog("open");
				}
			}, '-', {
				text : '查看详情',
				iconCls : 'icon-help',
				handler : function() {
					alert('查看详情');
					var row = $('#lmrDataGrid').datagrid("getSelected");
					alert(row.borloaninfoId);
					$("#detailDialog").dialog({
						title : '贷款详情',
						width : 500,
						height : 300,
						closed : true,
						cache : false,
						modal : true
					});
					$("#detailDialog").dialog("open");
				}
			}, {
				iconCls : 'icon-edit',
				text : '修改状态',
				handler : function() {
					var row = $('#lmrDataGrid').datagrid("getSelected");
					alert(row.empId);
					$('#updateLoanDirlog').dialog("open");
					$("#borLoanId").html(row.borloaninfoId);
					$("#borName").html(row.borName);
					$("#loanNumber").html(row.loanNumber);
					$("#loanState").combobox('setValues', row.LOANSTATE_NAME);
					$("#empName").html(row.EMP_NAME);
					$("#empId_update").html(row.empId);
				}
			} ]
		});
		/* , {
				field : 'loanDate',
				title : '贷款日期',
				width : 100
			}, {
				field : 'loanRepaymentDate',
				title : '还款日期',
				width : 100
			}, {
				field : 'loanRate',
				title : '利率',
				width : 100
			} */
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
					$('#addlmrDirlog').dialog("close");
				}
			} ]
		});
		$('#updateLoanDirlog').dialog({
			title : '修改贷款状态',
			width : 500,
			height : 300,
			closed : true,
			cache : false,
			modal : true,
			buttons : [ {
				iconCls : 'icon-edit',
				text : '保存',
				handler : function() {
					$('#updateLoanDirlog').dialog("close");
				}
			}, {
				iconCls : 'icon-help',
				text : '取消',
				handler : function() {
					$('#updateLoanDirlog').dialog("close");
				}
			} ]
		});
	});
</script>