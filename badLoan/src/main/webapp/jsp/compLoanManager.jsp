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
	<form method="post" id="searchForm">
		<table style="width: 95%;">
			<tr class="tot">
				<td>合&nbsp;&nbsp;同&nbsp;&nbsp;号&nbsp;<input name="contractId"
					id="contractIdSearch" type="text" class="easyui-textbox"
					data-options=" prompt:'输入合同号模糊查询'"></td>
				<td>&nbsp;&nbsp;客户姓名&nbsp;&nbsp;<input name="borName" type="text"
					id="borNameSearch" class="easyui-textbox"
					data-options=" prompt:'输入客户姓名查询'"></td>
				<td colSpan="2">&nbsp;&nbsp;还款日期&nbsp;&nbsp;<input
					type="text" class="easyui-datebox" name="dateFrom" id="dateFrom">&nbsp;&nbsp;~&nbsp;&nbsp;<input
					type="text" class="easyui-datebox" name="dateTo" id="dateTo">
				</td>
			</tr>
			<tr class="tot">
				<td>贷款状态&nbsp;&nbsp;<input type="text" id="loanStateSearch"
					name="loanStateId"></td>
				<td>&nbsp;&nbsp;银&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;行&nbsp;&nbsp;
				<input type="text" id="bankSearch" name="bankId"></td>
				<td>&nbsp;&nbsp;负&nbsp;&nbsp;责&nbsp;&nbsp;人&nbsp;&nbsp;<input type="text"
					class="easyui-textbox" data-options=" prompt:'输入负责人查询'"
					name="empName" id="empNameSearch"></td>
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
				<td><span id="loanNumber"></span>万</td>
			</tr>
			<tr>
				<td><span>已还金额：</span></td>
				<td><span id="unrepayNumber"></span>万</td>
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
		<!-- 核销弹框结束-->
		<table>
			<tr>
				<td><span>贷款编号：</span></td>
				<td><span id="comLoanIdAWO"></span></td>
			</tr>
			<tr>
				<td><span>贷款人：</span></td>
				<td><span id="comNameAWO"></span></td>
			</tr>
			<tr>
				<td><span>贷款类型：</span></td>
				<td><span id="comTypeNameAWO"></span></td>
			</tr>
			<tr>
				<td><span>贷款金额：</span></td>
				<td><span id="loanNumberAWO"></span>万</td>
			</tr>
			<tr>
				<td><span>已还金额：</span></td>
				<td><span id="unrepayNumberAWO"></span>万</td>
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
	<!-- 核销弹框结束-->
	<div id="addLMR">
		<!-- 回收信息登记弹框 -->
		<table>
			<tr>
				<td><span>贷款编号：</span></td>
				<td><span id="comLoanIdLMR"></span></td>
			</tr>
			<tr>
				<td><span>贷款企业：</span></td>
				<td><span id="comNameLMR"></span></td>
			</tr>
			<tr>
				<td><span>贷款类型：</span></td>
				<td><span id="comTypeNameLMR"></span></td>
			</tr>
			<tr>
				<td><span>贷款金额：</span></td>
				<td><span id="loanNumberLMR"></span>万</td>
			</tr>
			<tr>
				<td><span>已还金额：</span></td>
				<td><span id="unrepayNumberLMR"></span>万</td>
			</tr>
			<tr>
				<td><span>偿还方式：</span></td>
				<td><select id="repayType" class="easyui-combobox"
					style="width: 170px;" data-options="penalheight:'auto'">
						<option value="银行支票">银行支票</option>
						<option value="现金支付">现金支付</option>
				</select></td>
			</tr>
			<tr>
				<td><span>偿还金额：</span></td>
				<td><input id="repayNumberLMR" />万</td>
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
		<!-- 回收信息登记弹框 -->
	</div>
</body>
</html>
<script>
	function searchFormSubmit() {
		$('#comDataGrid').datagrid({
			queryParams : {
				contractId : $("#contractIdSearch").val(),
				borName : $("#borNameSearch").val(),
				loanStateId : $("#loanStateSearch").val(),
				bankId : $("#bankSearch").val(),
				dateFrom : $("#dateFrom").val(),
				dateTo : $("#dateTo").val(),
				empName : $("#empNameSearch").val()
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
		$('#comDataGrid')
				.datagrid(
						{
							url : '/badLoan/ComloanInfo/findComLoan',
							queryParams : {
								loanStateId : '--------------------',
								bankId : '--------------------'
							},
							rownumbers : true, //显示行号
							pagination : true, //显示分页
							singleSelect : true,
							pageSize : 10, //默认显示多少行
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
								field : 'UNREPAY_NUMBER',
								title : '已还金额/(万元)',
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
							toolbar : [
									'-',
									{
										text : '查看详情',
										iconCls : 'icon-help',
										handler : function() {
											var row = $('#lmrDataGrid')
													.datagrid("getSelected");
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
									},
									'-',
									{
										iconCls : 'icon-edit',
										text : '修改状态',
										handler : function() {
											var row = $('#comDataGrid')
													.datagrid("getSelected");
											if (row == null) {
												alert("请选择需要修改的信息");
											} else if (row.LOANSTATE_NAME == '已核销') {
												alert("该贷款项已被核销");
											} else {
												$('#updateLoanDirlog').dialog(
														"open");
												$("#comLoanId").html(
														row.COMLOANINFO_ID);
												$("#comTypeName").html(
														row.LOANTYPE_NAME);
												$("#comName")
														.html(row.COM_NAME);
												$("#loanNumber").html(
														row.LOAN_NUMBER);
												$("#unrepayNumber").html(
														row.UNREPAY_NUMBER);
												$("#loanState").combobox(
														'setValues',
														row.LOANSTATE_ID);
												$("#empName")
														.html(row.EMP_NAME);
												$("#empId_update").html(
														row.EMP_ID);
											}
										}
									},
									'-',
									{
										iconCls : 'icon-edit',
										text : '回收信息登记',
										handler : function() {
											var row = $('#comDataGrid')
													.datagrid("getSelected");
											if (row == null) {
												alert("请选择需要回收的信息");
											} else if (row.LOANSTATE_NAME == '已核销') {
												alert("该贷款项已被核销");
											} else {
												$('#addLMR').dialog("open");
												$("#comLoanIdLMR").html(
														row.COMLOANINFO_ID);
												$("#comTypeNameLMR").html(
														row.LOANTYPE_NAME);
												$("#comNameLMR").html(
														row.COM_NAME);
												$("#loanNumberLMR").html(
														row.LOAN_NUMBER);
												$("#unrepayNumberLMR").html(
														row.UNREPAY_NUMBER);
												$("#empNameLMR").html(
														row.EMP_NAME);
												$("#empId_updateLMR").html(
														row.EMP_ID);
												$("#loanStateLMR").html(
														row.LOANSTATE_NAME);
											}
										}
									},
									'-',
									{
										iconCls : 'icon-edit',
										text : '申请核销 ',
										handler : function() {
											var row = $('#comDataGrid')
													.datagrid("getSelected");
											if (row == null) {
												alert("请选择需要核销的信息");
											} else {
												if (row.LOANSTATE_NAME == '核销中') {
													alert("该贷款项正在核销中");
												} else if (row.LOANSTATE_NAME == '已核销') {
													alert("该贷款项已被核销");
												} else {
													$('#applyWriteOff').dialog(
															"open");
													$("#comLoanIdAWO").html(
															row.COMLOANINFO_ID);
													$("#comTypeNameAWO").html(
															row.LOANTYPE_NAME);
													$("#comNameAWO").html(
															row.COM_NAME);
													$("#loanNumberAWO").html(
															row.LOAN_NUMBER);
													$("#unrepayNumberAWO")
															.html(
																	row.UNREPAY_NUMBER);
													$("#empNameAWO").html(
															row.EMP_NAME);
													$("#empId_updateAWO").html(
															row.EMP_ID);
													$("#loanStateAWO").html(
															row.LOANSTATE_NAME);
												}
											}
										}
									}, '-' ]
						});
	});
	/* 回收信息登记弹框*/
	$('#addLMR')
			.dialog(
					{
						title : '回收信息登记',
						width : 500,
						height : 300,
						closed : true,
						cache : false,
						modal : true,
						buttons : [
								{
									iconCls : 'icon-edit',
									text : '保存',
									handler : function() {
										var data = {
											comloaninfoId : $("#comLoanIdLMR")
													.html(),
											empId : $("#empId_updateLMR")
													.html(),
											loanState : $("#loanStateLMR")
													.val(),
											unrepayNumber : parseInt($(
													"#loanNumberLMR").html())
													- parseInt($(
															"#unrepayNumberLMR")
															.html())
													- parseInt($(
															"#repayNumberLMR")
															.val()),
											repayType : $("#repayType").val(),
											repayNumber : $("#repayNumberLMR")
													.val(),
											repayComment : $("#lmrCommentLMR")
													.val()
										};
										$
												.ajax({
													url : '/badLoan/ComloanInfo/updateUnrepayNumber',
													type : 'post',
													data : JSON.stringify(data),
													contentType : 'application/json;charset=UTF-8',
													success : function(data) {
														alert(data);
														$('#comDataGrid')
																.datagrid();
													},
													error : function() {
														alert("error");
													}
												});
										$('#addLMR').dialog("close");
									}
								}, {
									iconCls : 'icon-help',
									text : '取消',
									handler : function() {
										$('#addLMR').dialog("close");
									}
								} ]
					});/* 回收信息登记弹框结束*/
	/* 核销弹框*/
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
					comloaninfoId : $("#comLoanIdAWO").html(),
					empId : $("#empId_updateAWO").html(),
					loanState : 7,
					lmrComment : $("#lmrCommentAWO").val()
				};
				$.ajax({
					url : '/badLoan/ComloanInfo/applyWriteOff',
					type : 'post',
					data : JSON.stringify(data),
					contentType : 'application/json;charset=UTF-8',
					success : function(data) {
						alert(data);
						$('#comDataGrid').datagrid();
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
	});/* 核销弹框结束*/
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
					loanState : $("#loanState").val(),
					lmrComment : $("#lmrComment").val()
				};
				$.ajax({
					url : '/badLoan/ComloanInfo/modifyComState',
					type : 'post',
					data : JSON.stringify(data),
					contentType : 'application/json;charset=UTF-8',
					success : function(data) {
						alert(data);
						$('#comDataGrid').datagrid();
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
		}, '-', '-' ]
	});
</script>