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
<link rel="stylesheet" href="../easyui/themes/pepperGrinder/easyui.css"
	type="text/css"></link>
</head>
<body>
	<form method="post" id="searchForm">
		<table style="width: 1000px;">
			<tr class="tot">
				<td>&nbsp;&nbsp;&nbsp;合同号&nbsp;&nbsp;<input name="contractId"
					type="text" class="easyui-textbox"
					data-options=" prompt:'输入合同号模糊查询'"></td>
				<td>企业名称&nbsp;&nbsp;<input name="borName" type="text"
					class="easyui-textbox" data-options=" prompt:'输入企业名称查询'"></td>
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
	<table id="lmrDataGrid"></table>
	<div id="detailDialog"></div>
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
				<td><span>贷款类型：</span></td>
				<td><span id="borTypeName"></span></td>
			</tr>
			<tr>
				<td><span>贷款金额：</span></td>
				<td><span id="loanNumber"></span></td>
			</tr>
			<tr>
				<td><span>已还金额：</span></td>
				<td><span id="unrepayNumber"></span></td>
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
			<tr>
				<td><span>申请原因：</span></td>
				<td><textarea id="lmrComment"></textarea></td>
			</tr>
		</table>
	</div>
	<div id="applyWriteOff">
		<table>
			<tr>
				<td><span>贷款编号：</span></td>
				<td><span id="borLoanIdAWO"></span></td>
			</tr>
			<tr>
				<td><span>贷款人：</span></td>
				<td><span id="borNameAWO"></span></td>
			</tr>
			<tr>
				<td><span>贷款类型：</span></td>
				<td><span id="borTypeNameAWO"></span></td>
			</tr>
			<tr>
				<td><span>贷款金额：</span></td>
				<td><span id="loanNumberAWO"></span></td>
			</tr>
			<tr>
				<td><span>已还金额：</span></td>
				<td><span id="unrepayNumberAWO"></span></td>
			</tr>
			<tr>
				<td><span>贷款状态：</span></td>
				<td><span id="loanStateAWO"></span></td>
			</tr>
			<tr>
				<td><span>负责人：</span></td>
				<td><span id="empId_updateAWO" style="display: none"></span><span
					id="empNameAWO"></span></td>
			</tr>
			<tr>
				<td><span>申请原因：</span></td>
				<td><textarea id="lmrCommentAWO"></textarea></td>
			</tr>
		</table>
	</div>
	<div id="addLMR">
		<table>
			<tr>
				<td><span>贷款编号：</span></td>
				<td><span id="borLoanIdLMR"></span></td>
			</tr>
			<tr>
				<td><span>贷款人：</span></td>
				<td><span id="borNameLMR"></span></td>
			</tr>
			<tr>
				<td><span>贷款类型：</span></td>
				<td><span id="borTypeNameLMR"></span></td>
			</tr>
			<tr>
				<td><span>贷款金额：</span></td>
				<td><span id="loanNumberLMR"></span></td>
			</tr>
			<tr>
				<td><span>已还金额：</span></td>
				<td><span id="unrepayNumberLMR"></span></td>
			</tr>
			<tr>
				<td><span>偿还金额：</span></td>
				<td><input id="repayNumberLMR" /></td>
			</tr>
			<tr>
				<td><span>贷款状态：</span></td>
				<td><span id="loanStateLMR"></span></td>
			</tr>
			<tr>
				<td><span>负责人：</span></td>
				<td><span id="empId_updateLMR" style="display: none"></span><span
					id="empNameLMR"></span></td>
			</tr>
			<tr>
				<td><span>回收总结：</span></td>
				<td><textarea id="lmrCommentLMR"></textarea></td>
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
			url : '/badLoan/BorLoanInfo/findBorSearch',
			type : 'POST',
			data : data,
			success : function(data) {
				$('#lmrDataGrid').datagrid({
					url : '',
					data : data
				});
			},
			error : function() {
				alert("error");
			}
		});
	}
	$("#loanStateSearch").combobox({
		url : '/badLoan/loanStateController/findLoanState',
		valueField : 'LOANSTATEID',
		textField : 'LOANSTATENAME',
		panelHeight : 'height',
		value : '----选择状态----'
	});
	$("#bankSearch").combobox({
		url : '/badLoan/BankInfo/findBankInfo',
		valueField : 'bankInfoId',
		textField : 'bankInfoName',
		panelHeight : 'auto',
		value : '----选择银行----'
	});
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
		$('#lmrDataGrid').datagrid(
				{
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
						field : 'BORLOANINFO_ID',
						title : '贷款编号',
						width : 100
					}, {
						field : 'LOANTYPE_NAME',
						title : '贷款种类',
						width : 100
					}, {
						field : 'BOR_NAME',
						title : '贷款人姓名',
						width : 100
					}, {
						field : 'LOAN_NUMBER',
						title : '贷款金额/(万元)',
						width : 100
					}, {
						field : 'UNREPAY_NUMBER',
						title : '已还金额/(万元)',
						width : 100
					}, {
						field : 'LOAN_ACCOUNT',
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
					}, {
						field : 'BANKINFO_NAME',
						title : '银行',
						width : 100
					} ] ],
					toolbar : [
							'-',
							{
								text : '查看详情',
								iconCls : 'icon-help',
								handler : function() {
									var row = $('#lmrDataGrid').datagrid(
											"getSelected");
									if (row == null) {
										$("#wormPrompt").dialog("open");
										alert("请选择需要查看的信息");
									} else {
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
								}
							},
							'-',
							{
								iconCls : 'icon-edit',
								text : '修改状态',
								handler : function() {
									var row = $('#lmrDataGrid').datagrid(
											"getSelected");
									if (row == null) {
										alert("请选择需要修改的信息");
									} else {
										$('#updateLoanDirlog').dialog("open");
										$("#borLoanId")
												.html(row.BORLOANINFO_ID);
										$("#borTypeName").html(
												row.LOANTYPE_NAME);
										$("#borName").html(row.BOR_NAME);
										$("#loanNumber").html(
												row.LOAN_NUMBER + "万");
										$("#unrepayNumber").html(
												row.UNREPAY_NUMBER + "万");
										$("#loanState").combobox('setValues',
												row.LOANSTATE_NAME);
										$("#empName").html(row.EMP_NAME);
										$("#empId_update").html(row.EMP_ID);
									}
								}
							},
							'-',
							{
								iconCls : 'icon-edit',
								text : '回收信息登记',
								handler : function() {
									var row = $('#lmrDataGrid').datagrid(
											"getSelected");
									if (row == null) {
										alert("请选择需要回收的信息");
									} else {
										$('#addLMR').dialog("open");
									}
								}
							},
							'-',
							{
								iconCls : 'icon-edit',
								text : '申请核销 ',
								handler : function() {
									var row = $('#lmrDataGrid').datagrid(
											"getSelected");
									if (row == null) {
										alert("请选择需要核销的信息");
									} else {
										alert(row.EMP_ID + " ");
										$('#applyWriteOff').dialog("open");
										$("#borLoanIdAWO").html(
												row.BORLOANINFO_ID);
										$("#borTypeNameAWO").html(
												row.LOANTYPE_NAME);
										$("#borNameAWO").html(row.BOR_NAME);
										$("#loanNumberAWO").html(
												row.LOAN_NUMBER + "万");
										$("#unrepayNumberAWO").html(
												row.UNREPAY_NUMBER + "万");
										$("#empNameAWO").html(row.EMP_NAME);
										$("#empId_updateAWO").html(row.EMP_ID);
										$("#loanStateAWO").html(
												row.LOANSTATE_NAME);
									}
								}
							}, '-' ]
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
						borloaninfoId : $("#borLoanId").html(),
						empId : $("#empId_update").html(),
						loanState : $("#loanState").val(),
						lmrComment : $("#lmrComment").val()
					};
					$.ajax({
						url : '/badLoan/BorLoanInfo/updateLoanState',
						type : 'post',
						data : JSON.stringify(data),
						contentType : 'application/json;charset=UTF-8',
						success : function(data) {
							alert(data);
							$('#lmrDataGrid').datagrid();
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
		$('#addLMR').dialog({
			title : '回收信息登记',
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
						borloaninfoId : $("#borLoanId").html(),
						empId : $("#empId_update").html(),
						loanState : $("#loanState").val(),
						
						lmrComment : $("#lmrCommentAWO").val()
					};
					$.ajax({
						url : '/badLoan/BorLoanInfo/updateUnrepayNumber',
						type : 'post',
						data : JSON.stringify(data),
						contentType : 'application/json;charset=UTF-8',
						success : function(data) {
							alert(data);
							$('#lmrDataGrid').datagrid();
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
		$('#applyWriteOff').dialog({
			title : '申请核销',
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
						borloaninfoId : $("#borLoanIdAWO").html(),
						empId : $("#empId_updateAWO").html(),
						loanState : 7,
						lmrComment : $("#lmrCommentAWO").val()
					};
					$.ajax({
						url : '/badLoan/BorLoanInfo/applyWriteOff',
						type : 'post',
						data : JSON.stringify(data),
						contentType : 'application/json;charset=UTF-8',
						success : function(data) {
							alert(data);
							$('#lmrDataGrid').datagrid();
						},
						error : function() {
							alert("error");
						}
					});
					$('#applyWriteOff').dialog("close");
				}
			}, {
				iconCls : 'icon-help',
				text : '取消',
				handler : function() {
					$('#applyWriteOff').dialog("close");
				}
			} ]
		});
	});
</script>