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
<style type="text/css">
.diaTab {
	border: 1px solid gray;
	margin: 10px;
	padding:10px;
}
.diaTab:hover{
  	background:white;
  	font-size:15px;
  	width:750px;
}
.paddingTd table tr td {
	padding-right: 150px;
}
</style>
</head>
<body>
	<form method="post" id="searchForm">
		<!-- 模糊查询-->
		<table style="width: 1000px;">
			<tr class="tot">
				<td>合&nbsp;&nbsp;同&nbsp;&nbsp;号&nbsp;<input name="contractId"
					type="text" class="easyui-textbox"
					data-options=" prompt:'输入合同号模糊查询'"></td>
				<td>&nbsp;&nbsp;企业名称&nbsp;&nbsp;<input name="borName"
					type="text" class="easyui-textbox"
					data-options=" prompt:'输入企业名称查询'"></td>
				<td colSpan="2">&nbsp;&nbsp;还款日期&nbsp;&nbsp;<input type="text"
					class="easyui-datebox" name="dateFrom">&nbsp;&nbsp;~&nbsp;&nbsp;<input
					type="text" class="easyui-datebox" name="dateTo">
				</td>
			</tr>
			<tr class="tot">
				<td>贷款状态&nbsp;&nbsp;<input type="text" id="loanStateSearch"
					name="loanStateId"></td>
				<td>&nbsp;&nbsp;银&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;行&nbsp;&nbsp;<input
					type="text" id="bankSearch" name="bankId"></td>
				<td>&nbsp;&nbsp;负&nbsp;&nbsp;责&nbsp;&nbsp;人&nbsp;&nbsp;<input
					type="text" class="easyui-textbox" data-options=" prompt:'输入负责人查询'"
					name="empName"></td>
				<td><a class="easyui-linkbutton"
					data-options="iconCls:'icon-search'" onclick="searchFormSubmit()">查询</a></td>
			</tr>
		</table>
		<!-- 模糊查询结束-->
	</form>
	<table id="lmrDataGrid"></table>
	<div id="detailDialog">
		<div id="borLoanDetail" class="diaTab paddingTd">
			<h4>贷款信息</h4>
			<table>
				<tr>
					<td>贷款编号：<span id="DiaBORLOANINFO_ID"></span></td>
					<td>贷款类型：<span id="DiaLOANTYPE_NAME"></span></td>
				</tr>
				<tr>
					<td>贷款日期：<span id="DiaLOANDATE"></span></td>
					<td>还款日期：<span id="DiaLOANREPAYMENTDATE"></span></td>
				</tr>
				<tr>
					<td>贷款金额：&nbsp;<span id="DiaLOAN_NUMBER"></span>&nbsp;万元
					</td>
					<td>未还金额：&nbsp;<span id="DiaunUNREPAY_NUMBER"></span>&nbsp;万元
					</td>
				</tr>
				<tr>
					<td>银行：<span id="DiaBANKINFO_NAME"></span>&nbsp;地址：<spanid-"DiaBANKINFO_ADDRESS"></span></td>
					<td>银行联系电话：<span id="DiaBANKINFO_TELEPHONE"></span></td>
				</tr>
				<tr>
					<td>贷款账户：<span id="DiaLOAN_ACCOUNT"></span></td>
					<td>贷款状态：<span id="DiaLOANSTATE_NAME"></span></td>
				</tr>
			</table>
		</div>
		<div id="cusDetail" class="diaTab paddingTd">
			<h4>贷款人信息</h4>
			<table>
				<tr>
					<td>联系电话：<span id="DiaBOR_PHONE"></span></td>
					<td>照片：<span id="BOR_PHOTO"></span></td>
				</tr>
				<tr>
					<td>信用：<span id="DiaBOR_CREDIT"></span></td>
					<td>生日：<span id="DiaBOR_BIRTHDAY"></span></td>
				</tr>
				<tr>
					<td>单位地址：<span id="DiaBOR_UNIT_ADDRESS"></span></td>
					<td>收入：<span id="DiaBOR_INCOME"></span>/年
					</td>
				</tr>
				<tr>
					<td>婚否：<span id="DiaBOR_MARRY"></span></td>
					<td>学历：<span id="DiaBOR_EDUCATION"></span></td>
				</tr>
				<tr>
					<td>民族：<span id="DiaBOR_NATION"></span></td>
					<td>姓名：<span id="Dia BOR_NAME"></span></td>
				</tr>
				<tr>
					<td>性别：<span id="DiaBOR_GENDER"></span></td>
					<td>证件号：<span id="Dia BOR_CARDNUMBER"></span></td>
				</tr>
				<tr>
					<td>单位：<span id="DiaBOR_UNIT"></span></td>
					<td>证件类型：<span id="Dia BOR_CARDTYPE"></span></td>
				</tr>
				<tr>
					<td>住址：<span id="DiaBOR_ADDRESS"></span></td>
					<td><span id="DiaBOR_POSTCODE"></span></td>
				</tr>
				<tr>
					<td>职位<span id="DiaBOR_POSITION"></span></td>
					<td>用户编号：<span id="DiaBOR_ID"></span></td>
				</tr>
				<tr>
					<td>单位电话：<span id="DiaBOR_UNIT_PHONE"></span></td>
					<td>籍贯：<span id="DiaBOR_REGISTER"></span></td>
				</tr>
			</table>
		</div>
		<div id="empDetail" class="diaTab paddingTd">
			<h4>负责人信息</h4>
			<table>
				<tr>
					<td>姓名：<span id="DiaEMP_NAME"></span></td>
					<td>邮箱：<span id="DiaEMP_EMAIL"></span></td>
				</tr>
				<tr>
					<td>联系电话：<span id="DiaEMP_TELPHONE"></span></td>
					<td><span id="DiaEMP_BANKINFO"></span></td>
				</tr>
				<tr>
					<td>员工编号：<span id="DiaEMP_ID"></span></td>
					<td>员工学历：<span id="DiaEMP_EDUCATION"></span></td>
				</tr>
				<tr>
					<td>证件号：<span id="DiaEMP_CARDNUMBER"></span></td>
					<td>家庭地址：<span id="DiaEMP_ADDRESS"></span></td>
				</tr>
				<tr>
					<td>员工状态：<span id="DiaEMP_FLAG"></span></td>
					<td>部门：<span id="DiaEMP_DEPARTMENT"></span></td>
				</tr>
				<tr>
					<td>民族：<span id="DiaEMP_NATION"></span></td>
					<td>性别：<span id="DiaEMP_GENDER"></span></td>
				</tr>
			</table>
		</div>
		<div id="repDetail"  class="diaTab">
			<h4>还款信息</h4>
			<table id="repData"></table>
		</div>
		<div id="lmrDetail"  class="diaTab">
			<h4>催收信息</h4>
			<table id="lmrData"></table>
		</div>
		<div id="guaDetail"  class="diaTab">
			<h4>担保人信息</h4>
			<table id="guaData"></table>
		</div>
		<div id="contectDetail"  class="diaTab">
			<h4>紧急联系人信息</h4>
			<table id="conData"></table>
		</div>
		<div id="pleDetail"  class="diaTab">
			<h4>抵（质）押物信息</h4>
			<table id="pleData"></table>
		</div>
	</div>
	<!-- 贷款详情弹框-->
	<div id="updateLoanDirlog">
		<!-- 修改状态弹框-->
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
		<!-- 修改状态弹框结束-->
	</div>
	<div id="applyWriteOff">
		<!-- 核销弹框结束-->
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
	<!-- 核销弹框结束-->
	<div id="addLMR">
		<!-- 回收信息登记弹框 -->
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
				<td><span>偿还方式：</span></td>
				<td><select id="repayType" class="easyui-combobox"
					style="width: 200px;">
						<option value="银行支票">银行支票</option>
						<option value="现金支付">现金支付</option>
				</select></td>
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
		<!-- 回收信息登记弹框 -->
	</div>
</body>
</html>
<script>
	function searchFormSubmit() {
		var data = $("#searchForm").serialize();
		data = decodeURIComponent(data, true);
		$('#lmrDataGrid').datagrid({
			url : '/badLoan/BorLoanInfo/findBorSearch',
			queryParams : {
				data : data
			}
		});
	}
	$("#detailDialog").dialog({
		title : '贷款详情',
		width : 800,
		height : 450,
		closed : true,
		cache : false,
		modal : true
	});
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
		$.ajax({
			url : '/badLoan/lmrController/addlmr',
			contentType : "application/json;charset:UTF-8",
			data : data,
			success : function(data1) {
				$.message.alert(data1);
			}
		});
	}

	$(function() {
		/* datagrid开始 */
		$('#lmrDataGrid').datagrid({
			url : '/badLoan/BorLoanInfo/findBorLoanDetail',
			rownumbers : true, //显示行号
			pagination : true, //显示分页
			singleSelect : true,
			pageSize : 10, //默认显示多少行
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
				title : '贷款类型',
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
			toolbar : ['-',{
						text : '查看详情',
						iconCls : 'icon-help',
						handler : function() {
							var row = $('#lmrDataGrid').datagrid("getSelected");
							if (row == null) {
								$.messager.alert("提示","请选择需要查看的信息");
							} else {
								$.ajax({
									url : "/badLoan/BorLoanInfo/findDetailById",
									type : "post",
									data : {
										borId : row.BORLOANINFO_ID
									},
									dataType : "json",
									success : function(data) {
										for (var i = 0; i < data.length; i++) {
											for ( var filedName in data[i]) {
												$("#Dia"+ filedName).html(data[i][filedName]);
											}
										}
									}
								});
								$.ajax({
									url : "/badLoan/BorLoanInfo/findRepayRecord",
									type : "post",
									data : {
										borId : row.BORLOANINFO_ID
									},
									dataType : "json",
									success : function(
											data) {
										if (data.length == 0) {
											$("#repData").empty();
											$("#repData").html("<tr><td>未查到相关信息</td></tr>");
										} else {
											$("#repData").datagrid({
												data : data,
												columns : [ [ {
													field : 'BORLOANINFO_ID',
													title : '贷款编号',
													width : 100
												} ] ]
											});
										}
									}
								});
								$.ajax({
											url : "/badLoan/BorLoanInfo/findLMR",
											type : "post",
											data : {
												borId : row.BORLOANINFO_ID
											},
											dataType : "json",
											success : function(data) {
												if (data.length == 0) {
													$("#lmrData").empty();
													$("#lmrData").html("<tr><td>未查到相关信息</td></tr>");
												} else {
													$("#lmrData").datagrid({
														data : data,
														columns : [ [
																{
																	field : 'EMP_ID',
																	title : '负责人编号',
																	width : 100
																},
																{
																	field : 'LMR_DATE',
																	title : '操作日期',
																	width : 100
																},
																{
																	field : 'LMR_NAME',
																	title : '贷款编号',
																	width : 100
																} ] ]
													});
												}
											}
										});
								$.ajax({
											url : "/badLoan/BorLoanInfo/findGuaDetailsById",
											type : "post",
											data : {
												borId : row.BORLOANINFO_ID
											},
											dataType : "json",
											success : function(data) {
												if (data.length == 0) {
													$("#guaData").empty();
													$("#guaData").html("<tr><td>未查到相关信息</td></tr>");
												} else {
													$("#guaData").datagrid({
														data : data,
														columns : [ [
																{
																	field : 'GUA_NAME',
																	title : '姓名',
																	width : 100
																},
																{
																	field : 'GUA_GENDER',
																	title : '性别',
																	width : 100
																},
																{
																	field : 'GUA_NATION',
																	title : '民族',
																	width : 100
																},
																{
																	field : 'GUA_BIRTHDAY',
																	title : '出生日期',
																	width : 100
																},
																{
																	field : 'GUA_MARRY',
																	title : '婚否',
																	width : 100
																},
																{
																	field : 'GUA_ADDRESS',
																	title : '家庭住址',
																	width : 100
																},
																{
																	field : 'GUA_CARDTYPE',
																	title : '证件类型',
																	width : 100
																},
																{
																	field : 'GUA_CARDNUMBER',
																	title : '证件号码',
																	width : 100
																},
																{
																	field : 'GUA_EDUCATION',
																	title : '学历',
																	width : 100
																},
																{
																	field : 'GUA_INCOME',
																	title : '年收入',
																	width : 100
																},
																{
																	field : 'GUA_PHONE',
																	title : '联系方式',
																	width : 100
																},
																{
																	field : 'GUA_UNIT',
																	title : '单位',
																	width : 100
																},
																{
																	field : 'GUA_POSITION',
																	title : '职位',
																	width : 100
																},
																{
																	field : 'GUA_REGISTER',
																	title : '籍贯',
																	width : 100
																} ] ]
													});
												}
											}
										});
								$.ajax({
									url : "/badLoan/BorLoanInfo/findPledge",
									type : "post",
									data : {
										borId : row.BORLOANINFO_ID
									},
									dataType : "json",
									success : function(data) {
										if (data.length == 0) {
											$("pleData").empty();
											$("pleData").html("<tr><td>未查到相关信息</td></tr>");
										} else {
											$("#pleData").datagrid({
												data : data,
												columns : [ [
														{
															field : 'PLEDGE_GENRE',
															title : '类型',
															width : 100
														},
														{
															field : 'PLEDGE_ID',
															title : '编号',
															width : 100
														},
														{
															field : 'PLEDGE_NAME',
															title : '名称',
															width : 100
														},
														{
															field : 'PLEDGE_OWNER',
															title : '物主',
															width : 100
														},
														{
															field : 'PLEDGE_PHOTO',
															title : '图片',
															width : 100
														},
														{
															field : 'PLEDGE_TYPE',
															title : '类型',
															width : 100
														},
														{
															field : 'PLEDGE_VALUE',
															title : '价值（万元）',
															width : 100
														} ] ]
											});
										}
									}
								});
								$.ajax({
											url : "/badLoan/BorLoanInfo/findContect",
											type : "post",
											data : {
												cusId : row.BOR_ID
											},
											dataType : "json",
											success : function(data) {
												if (data.length == 0) {
													$("#conData").empty();
													$("#conData").html("<tr><td>未查到相关信息</td></tr>");
												} else {
													$("#conData").datagrid({
														data : data,
														columns : [ [
																{
																	field : 'CONTECT_NAME',
																	title : '姓名',
																	width : 100
																},
																{
																	field : 'CONTECT_GENDER',
																	title : '性别',
																	width : 100
																},
																{
																	field : 'CONTECT_ADDRESS',
																	title : '家庭住址',
																	width : 100
																},
																{
																	field : 'CONTECT_BIRTHDAY',
																	title : '生日',
																	width : 100
																},
																{
																	field : 'CONTECT_TELPHONE',
																	title : '联系电话',
																	width : 100
																},
																{
																	field : 'CONTECT_CARDTYPE',
																	title : '证件类型',
																	width : 100
																},
																{
																	field : 'CONTECT_CARDNUMBER',
																	title : '证件号',
																	width : 100
																}
																 ] ]
													});
												}
											}
										});
								$("#detailDialog").dialog("open");
							}
						}
					},'-',{
						iconCls : 'icon-edit',
						text : '修改状态',
						handler : function() {
							var row = $('#lmrDataGrid').datagrid("getSelected");
							if (row == null) {
								$.message.alert("请选择需要修改的信息");
							} else if (row.LOANSTATE_NAME == '已核销') {
								$.message.alert("该贷款项已被核销");
							} else {
								$('#updateLoanDirlog').dialog("open");
								$("#borLoanId").html(row.BORLOANINFO_ID);
								$("#borTypeName").html(row.LOANTYPE_NAME);
								$("#borName").html(row.BOR_NAME);
								$("#loanNumber").html(row.LOAN_NUMBER + "万");
								$("#unrepayNumber").html(row.UNREPAY_NUMBER+ "万");
								$("#loanState").combobox('setValues',row.LOANSTATE_NAME);
								$("#empName").html(row.EMP_NAME);
								$("#empId_update").html(row.EMP_ID);
							}
						}
					},'-',{
						iconCls : 'icon-edit',
						text : '回收信息登记',
						handler : function() {
							var row = $('#lmrDataGrid').datagrid("getSelected");
							if (row == null) {
								$.message.alert("请选择需要回收的信息");
							} else if (row.LOANSTATE_NAME == '已核销') {
								$.message.alert("该贷款项已被核销");
							} else {
								$('#addLMR').dialog("open");
								$("#borLoanIdLMR").html(row.BORLOANINFO_ID);
								$("#borTypeNameLMR").html(row.LOANTYPE_NAME);
								$("#borNameLMR").html(row.BOR_NAME);
								$("#loanNumberLMR").html(row.LOAN_NUMBER + "万");
								$("#unrepayNumberLMR").html(row.UNREPAY_NUMBER+ "万");
								$("#empNameLMR").html(row.EMP_NAME);
								$("#empId_updateLMR").html(row.EMP_ID);
								$("#loanStateLMR").html(row.LOANSTATE_NAME);
							}
						}
					},'-',{
						iconCls : 'icon-edit',
						text : '申请核销 ',
						handler : function() {
							var row = $('#lmrDataGrid').datagrid("getSelected");
							if (row == null) {
								$.message.alert("请选择需要核销的信息");
							} else {
								if (row.LOANSTATE_NAME == '核销中') {
									$.message.alert("该贷款项正在核销中");
								} else if (row.LOANSTATE_NAME == '已核销') {
									$.message.alert("该贷款项已被核销");
								} else {
									$('#applyWriteOff').dialog("open");
									$("#borLoanIdAWO").html(row.BORLOANINFO_ID);
									$("#borTypeNameAWO").html(row.LOANTYPE_NAME);
									$("#borNameAWO").html(row.BOR_NAME);
									$("#loanNumberAWO").html(row.LOAN_NUMBER + "万");
									$("#unrepayNumberAWO").html(row.UNREPAY_NUMBER	+ "万");
									$("#empNameAWO").html(row.EMP_NAME);
									$("#empId_updateAWO").html(row.EMP_ID);
									$("#loanStateAWO").html(row.LOANSTATE_NAME);
								}
							}
						}
					}, '-' ]
		});/* datagrid结束 */
		/* 修改状态弹框*/
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
							$.message.alert(data);
							$('#lmrDataGrid').datagrid();
						},
						error : function() {
							$.message.alert("error");
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
		});/* 修改状态弹框结束*/
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
							buttons : [{
										iconCls : 'icon-edit',
										text : '保存',
										handler : function() {
											var data = {
												borloaninfoId : $("#borLoanIdLMR").html(),
												empId : $("#empId_updateLMR").html(),
												loanState : $("#loanStateLMR").val(),
												unrepayNumber : Integer.parseInt($(	"#loanNumberLMR").html())- Integer.parseInt($("#unrepayNumberLMR").html())- Integer.parseInt($("#repayNumberLMR").val()),
												repayType : $("#repayType").value(),
												repayNumber : $("#repayNumberLMR").val(),
												repayComment : $("#lmrCommentLMR").val()
											};
											$.ajax({
												url : '/badLoan/BorLoanInfo/updateUnrepayNumber',
												type : 'post',
												data : JSON.stringify(data),
												contentType : 'application/json;charset=UTF-8',
												success : function(data) {
													$.message.alert(data);
													$('#lmrDataGrid').datagrid();
												},
												error : function() {
													$.message.alert("error");
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
							$.message.alert(data);
							$('#lmrDataGrid').datagrid();
						},
						error : function() {
							$.message.alert("error");
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
	});
</script>