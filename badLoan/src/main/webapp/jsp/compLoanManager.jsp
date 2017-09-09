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
	<form method="post" id="searchForm">
		<table style="width: 1200px;">
			<tr class="tot">
				<td>&nbsp;&nbsp;&nbsp;合同号&nbsp;&nbsp;<input name="contractId"
					type="text" class="easyui-textbox"
					data-options=" prompt:'输入合同号模糊查询'"></td>
				<td>客户姓名&nbsp;&nbsp;<input name="borName" type="text"
					class="easyui-textbox" data-options=" prompt:'输入客户姓名查询'"></td>
				<td>贷款状态&nbsp;&nbsp;<input type="text" id="loanStateSearch"
					name="loanStateId"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;银行&nbsp;&nbsp;<input type="text"
					id="bankSearch" name="bankId"></td>
			</tr>
			<tr class="tot">
				<td colSpan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;还款日期&nbsp;&nbsp;<input
					type="text" class="easyui-datebox" name="dateFrom">&nbsp;&nbsp;~&nbsp;&nbsp;<input
					type="text" class="easyui-datebox" name="dateTo">
				</td>
				<td>&nbsp;&nbsp;&nbsp;负责人&nbsp;&nbsp;<input type="text"
					class="easyui-textbox" data-options=" prompt:'输入负责人查询'"
					name="empName"></td>
				<td><a class="easyui-linkbutton"
					data-options="iconCls:'icon-search'" onclick="searchFormSubmit()">查询</a></td>
			</tr>
		</table>
	</form>
	<table id="comDataGrid"></table>
	<div id="updateLoanDirlog">
		<table>
			<tr>
				<td><span>贷款编号：</span></td>
				<td><span id="comLoanId"></span></td>
			</tr>
			<tr>
				<td><span>贷款企业：</span></td>
				<td><span id="comName"></span></td>
			</tr>
			<tr>
				<td><span>贷款类型：</span></td>
				<td><span id="comTypeName"></span></td>
			</tr>
			<tr>
				<td><span>贷款金额：</span></td>
				<td><span id="loanNumber"></span>/万元</td>
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
	function searchFormSubmit() {
		var data = $("#searchForm").serialize();
		data = decodeURIComponent(data, true);
		$.ajax({
			url : '/badLoan/ComloanInfo/findComLoan',
			type : 'POST',
			data : data,
			success : function(data) {
				$('#comDataGrid').datagrid({
					url : '',
					data : data
				});
				$('#comDataGrid').datagrid("reload");
			},
			error : function() {
				alert("error");
			}
		});
	}
	$("#loanState").combobox({
		url : '/badLoan/loanStateController/findLoanState',
		valueField : 'LOANSTATEID',
		textField : 'LOANSTATENAME',
		panelHeight : 'auto'
	});
	$("#loanStateSearch").combobox({
		url : '/badLoan/loanStateController/findLoanState',
		valueField : 'LOANSTATEID',
		textField : 'LOANSTATENAME',
		panelHeight : 'auto',
		value : '----选择状态----'
	});
	$("#bankSearch").combobox({
		url : '/badLoan/BankInfo/findBankInfo',
		valueField : 'bankInfoId',
		textField : 'bankInfoName',
		panelHeight : 'auto',
		value : '----选择银行----'
	});
	$(function() {
		$('#comDataGrid').datagrid({
			url : '/badLoan/ComloanInfo/findComLoan',
			queryParams : {
				loanStateId : '--------------------',
				bankId : '--------------------'
			},
			rownumbers : true, //显示行号
			pagination : true, //显示分页
			singleSelect : true,
			pageSize : 5, //默认显示多少行
			pageList : [ 5, 10, 15, 20 ],//行号下拉列表
			sortOrder : 'asc',//默认升序
			remoteSort : false,//不去服务器排序
			fitColumns : true,
			columns : [ [ {
				field : 'COMLOANINFO_ID',
				title : '贷款编号',
				width : 100
			}, {
				field : 'LOANTYPE_NAME',
				title : '贷款种类',
				width : 100
			}, {
				field : 'COM_NAME',
				title : '贷款企业',
				width : 100
			}, {
				field : 'LOAN_NUMBER',
				title : '贷款金额/(万元)',
				width : 100
			}, {
				field : 'LOAN_ACCOUNT',
				title : '贷款账户',
				width : 100
			}, {
				field : 'LOAN_DATE',
				title : '贷款日期',
				width : 100
			}, {
				field : 'LOAN_REPAYMENT_DATE',
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
			}, {
				field : 'BANKINFO_NAME',
				title : '银行',
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
					var row = $('#comDataGrid').datagrid("getSelected");
					alert(row.empId);
					$('#updateLoanDirlog').dialog("open");
					$("#comLoanId").html(row.COMLOANINFO_ID);
					$("#comTypeName").html(row.LOANTYPE_NAME);
					$("#comName").html(row.COM_NAME);
					$("#loanNumber").html(row.LOAN_NUMBER);
					$("#loanState").combobox('setValues', row.LOANSTATE_ID);
					$("#empName").html(row.EMP_NAME);
					$("#empId_update").html(row.EMP_ID);
				}
			} ]
		});
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
				var data = {
					comloaninfoId : $("#comLoanId").html(),
					empId : $("#empId_update").html(),
					loanState : $("#loanState").val()
				};
				alert(data.loanType + " " + data.loanState);
				$.ajax({
					url : '/badLoan/',
					type : 'post',
					data : JSON.stringify(data),
					contentType : 'application/json;charset=UTF-8',
					success : function(data) {
						alert(data);
					},
					error : function() {
						alert("error");
					}
				});
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
</script>