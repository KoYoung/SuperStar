<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
	.ti1{
	font-size: 20px;
	font-family: 新宋体;
	color: #386FD2;
	line-height: 40px;
}
.one0,.top0 {
	width: 50%;
}
#gua1,#gua2,#ple1,#ple2{
	width: 50%;
}
.ti{
	width:632px;
}
#chuli, #huishou {
	margin-top: 10px;
}
.img{
	width: 200px;
	height: 250px;
}
.img2{
    width: 293px;
    height: 150px;
}
tr td{
	font-size:14px;
}
</style>
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
					name="empName" id="empNameSearch"><a class="easyui-linkbutton"
					data-options="iconCls:'icon-search'" onclick="searchFormSubmit()" style="margin-left:140px">查询</a>
				</td>
			</tr>
		</table>
	</form>
	<table id="comDataGrid"></table>
	<!-- 贷款详情弹框-->
	<div id="detailDialog">
		<div style="padding: 0 20px 20px 20px">
			<div class="ti1">贷款信息</div>
				<table class="ti">
					<tr>
						<td class="one0">
							<table cellpadding="5">
								<tr>
									<td>贷款编号:</td>
									<td><span id="loaninfoId"></span></td>
								</tr>

								<tr>
									<td>贷款企业:</td>
									<td><span id="borName"></span></td>
								</tr>
								<tr>
									<td>贷款银行:</td>
									<td><span id="bankinfoName"></span></td>
								</tr>
								<tr>
									<td>贷款账号:</td>
									<td><span id="loanAccount"></span></td>
								</tr>
								<tr>
									<td>贷款种类:</td>
									<td><span id="loantypeName"></span></td>
								</tr>
							</table>
						</td>
						<td class="top0">
							<table cellpadding="5">
								<tr>
									<td>经手人:</td>
									<td><span id="empName"></span></td>
								</tr>
								<tr>
									<td>贷款金额:</td>
									<td><span id="loanNumber"></span>元</td>
								</tr>
								<tr>
									<td>贷款日期:</td>
									<td><span id="loanDate"></span></td>
								</tr>
								<tr>
									<td>还款日期:</td>
									<td><span id="loanRepaymentDate"></span></td>
								</tr>
								<tr>
									<td>贷款利率:</td>
									<td><span id="loanRate"></span>%</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<div class="ti1">企业法人信息</div>
				<span id="meiyou">该企业没有法人</span>
				<div id="leg">
					<table class="ti">
						<tr>
							<td class="one0">
								<table>
									<tr>
										<td>法人姓名:</td>
										<td><span id="legalName"></span></td>
									</tr>
									<tr>
										<td>性别:</td>
										<td><span id="legalGender"></span></td>
									</tr>
									<tr>
										<td>证件类型:</td>
										<td><span id="legalCardtype"></span></td>
									</tr>
									<tr>
										<td>证件号码:</td>
										<td><span id="legalCardnumber"></span></td>
									</tr>
								</table>	
							</td>
							<td id="top0">
								<table id="tab">
									<tr>
										<td>婚姻状况:</td>
										<td><span id="legalMarry"></span></td>
									</tr>
									<tr>
										<td>地址:</td>
										<td><span id="legalAddress"></span></td>
									</tr>
									<tr>
										<td>电话:</td>
										<td><span id="legalPhone"></span></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<span style="font-size:14px;margin-left:6px">法人照片：</span><div id="legalInfo"></div>
				</div>
				<div class="ti1">担保人信息</div>
				<div id="gua">
					<table class="ti">
						<tr>
							<td id="gua1"></td>
							<td id="gua2"></td>
						</tr>
					</table>
				</div>
				<div class="ti1">抵押物信息</div>
				<div id="ple">
					<table class="ti">
						<tr>
							<td id="ple1"></td>
							<td id="ple2"></td>
						</tr>
					</table>
					<span style="font-size:14px;margin-left:6px">抵押物照片：</span><div id="pledgePhoto"></div>
				</div>
				<div class="ti1">贷款处理记录</div>
				<table id="chuli"></table>
				<div class="ti1">贷款回收记录</div>
				<table id="huishou"></table>
		</div>
	</div><!-- 贷款详情弹框-->
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
		url : '/badLoan/loanStateController/findAllLoanState',
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
								width : 60
							}, {
								field : 'LOANTYPE_NAME',
								title : '贷款种类',
								width : 60
							}, {
								field : 'COM_NAME',
								title : '贷款企业',
								width : 80
							}, {
								field : 'LOAN_NUMBER',
								title : '贷款金额/(元)',
								width : 100
							}, {
								field : 'UNREPAY_NUMBER',
								title : '已还金额/(元)',
								width : 100
							}, {
								field : 'LOAN_ACCOUNT',
								title : '贷款账户',
								width : 150
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
											var row = $('#comDataGrid')
													.datagrid("getSelected");
											//console.log(row);
											if (row == null) {
												$.messager.alert("提示","请选中一行！");
											} else{
												//企业贷款信息
												$("#detailDialog").dialog("open");
												$("#loaninfoId").html(row.COMLOANINFO_ID);
												$("#borName").html(row.COM_NAME);
												$("#bankinfoName").html(row.BANKINFO_NAME);
												$("#loanAccount").html(row.LOAN_ACCOUNT);
												$("#loantypeName").html(row.LOANTYPE_NAME);
												$("#empName").html(row.EMP_NAME);
												$("#loanNumber").html(row.LOAN_NUMBER);
												$("#loanDate").html(row.LOAN_DATE);
												$("#loanRepaymentDate").html(row.LOAN_REPAYMENT_DATE);
												$("#loanRate").html(row.LOAN_RATE);
												//企业法人信息
												$.ajax({
													url : '/badLoan/legalController/findLegalCom?comId='+row.COM_ID,
													success : function(data){
														if(data==""){
															$("#meiyou").show();
															rmaa();
															$("#leg").hide();
															//$("#leg").html("该企业没有法人");
														}else{
															$("#meiyou").hide();
															$("#leg").show();
															rmaa();
															$("#legalName").html(data.legalName);
															$("#legalCardtype").html(data.legalCardtype);
															$("#legalCardnumber").html(data.legalCardnumber);
															$("#legalGender").html(data.legalGender);
															$("#legalMarry").html(data.legalMarry);
															$("#legalAddress").html(data.legalAddress);
															$("#legalPhone").html(data.legalPhone);
															$("#legalInfo").empty();
															$("#legalInfo").append("<img class='img' src='"+data.legalInfo+"'/>");
														} 
													},error:function(){
														$.messager.alert("提示","系统开了个小差，请刷新重试");
													}	
												});
												//企业贷款担保人信息
												$.ajax({
													url : '/badLoan/guaController/findGua?loaninfoId='+row.COMLOANINFO_ID,
													success : function(data){
														if(data==""){
															$("#gua").empty();
															$("#gua").html("该笔贷款没有担保人");
														}else{
															$("#gua1").empty();
															$("#gua2").empty();
															$.each(data,function(index,value){
																$("#gua1").append("<table>");
																$("#gua2").append("<table>");
																$("#gua1").append("<tr><td>"+"姓名："+"</td><td>"+value.guaName+"</td></tr>");
																$("#gua1").append("<tr><td>"+"性别："+"</td><td>"+value.guaGender+"</td></tr>");
																$("#gua1").append("<tr><td>"+"联系方式："+"</td><td>"+value.guaPhone+"</td></tr>");
																$("#gua1").append("<tr><td>"+"出生日期："+"</td><td>"+value.guaBirthday+"</td></tr>");
																$("#gua1").append("<tr><td>"+"证件类型："+"</td><td>"+value.guaCardType+"</td></tr>");
																$("#gua1").append("<tr><td>"+"证件号码："+"</td><td>"+value.guaCardNumber+"</td></tr>");
																$("#gua1").append("<tr><td>"+"户籍地址："+"</td><td>"+value.guaRegister+"</td></tr>");
																$("#gua2").append("<tr><td>"+"居住地址："+"</td><td>"+value.guaAddress+"</td></tr>");
																$("#gua2").append("<tr><td>"+"工作单位："+"</td><td>"+value.guaUnit+"</td></tr>");
																$("#gua2").append("<tr><td>"+"职位："+"</td><td>"+value.guaPosition+"</td></tr>");
																$("#gua2").append("<tr><td>"+"婚姻状况："+"</td><td>"+value.guaMarry+"</td></tr>");
																$("#gua2").append("<tr><td>"+"民族："+"</td><td>"+value.guaNation+"</td></tr>");
																$("#gua2").append("<tr><td>"+"学历："+"</td><td>"+value.guaEducation+"</td></tr>");
																$("#gua2").append("<tr><td>"+"收入："+"</td><td>"+value.guaIncome+"元"+"</td></tr>");
															});
														}
													},error:function(){
														$.messager.alert("提示","系统开了个小差，请刷新重试");
													}	
												});
												//企业贷款抵押物信息
												$.ajax({
													url : '/badLoan/pledge/findPledge?loaninfoId='+row.COMLOANINFO_ID,
													success : function(data){
														if(data==""){
															$("#ple").empty();
															$("#ple").html("该笔贷款没有抵押物");
														}else{
															$("#ple1").empty();
															$("#ple2").empty();
															$.each(data,function(index,value){
																$("#ple1").append("<table>");
																$("#ple2").append("<table>");
																$("#ple1").append("<tr><td>"+"抵（质）押物品类型："+"</td><td>"+value.pledgeType+"</td></tr>");
																$("#ple1").append("<tr><td>"+"抵（质）押物品名称："+"</td><td>"+value.pledgeName+"</td></tr>");
																$("#ple2").append("<tr><td>"+"抵（质）押物品价值："+"</td><td>"+value.pledgeValue+"万元"+"</td></tr>");
																$("#ple2").append("<tr><td>"+"抵（质）押物品所有人："+"</td><td>"+value.pledgeOwner+"</td></tr>");
																var photos=value.pledgePhoto;
													            var arr=photos.split(",");
													            $("#pledgePhoto").empty();
													            var rows=$("#ple2").children().children().length;
													           if(rows<5){
													        	   for (var i = 0; i < arr.length-1; i++) {
													               	var t= "<img class='img2' src='"+arr[i]+"'/>";
													                  $("#pledgePhoto").append("<td colspan='2'>"+t+"</td>");
													   			}
													        	   
													           } 
															});
														}
													},error:function(){
														$.messager.alert("提示","系统开了个小差，请刷新重试");
													}	
												});
												//单笔贷款处理记录
												$('#chuli')
														.datagrid(
																{
																	url : '/badLoan/lmrController/findlmr?loaninfoId='
																			+ row.COMLOANINFO_ID,
																	striped : true, //斑马线 
																	width : 632,
																	nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
																	rownumbers : true, //如果为true，则显示一个行号列
																	columns : [ [ {
																		field : 'loaninfoId',
																		title : '贷款编号',
																		width : 80
																	}, {
																		field : 'empName',
																		title : '经手人',
																		width : 100
																	}, {
																		field : 'lmrDate',
																		title : '处理日期',
																		width : 100
																	},{
																		field : 'loanstateName',
																		title : '贷款状态',
																		width : 100
																	},{
																		field : 'lmrComment',
																		title : '处理说明',
																		width : 220
																	}]],
																});
												//单笔贷款还款记录
												$("#huishou")
														.datagrid(
																{
																	url : '/badLoan/WriteoffManage/findReayment?loaninfoId='
																			+ row.COMLOANINFO_ID,
																	striped : true, //斑马线 
																	width : 632,
																	nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
																	//resizeHandle : 'right',
																	rownumbers : true, //如果为true，则显示一个行号列
																	columns : [ [  {
																		field : 'empName',
																		title : '经手人',
																		width : 80
																	}, {
																		field : 'repayDate',
																		title : '回收日期',
																		width : 100
																	}, {
																		field : 'repayType',
																		title : '回收类型',
																		align : 'center',
																		width : 100
																	},{
																		field : 'repayNumber',
																		title : '回收金额(元)',
																		width : 100
																	},{
																		field : 'repayComment',
																		title : '回收说明',
																		width : 220

																	}] ],
																});
															}
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
												$.messager.alert("提示","请选择需要修改的信息");
											} else if (row.LOANSTATE_NAME == '已核销') {
												$.messager.alert("提示","该贷款项已被核销");
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
												$.messager.alert("提示","请选择需要回收的信息");
											} else if (row.LOANSTATE_NAME == '已核销') {
												$.messager.alert("提示","该贷款项已被核销");
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
												$.messager.alert("提示","请选择需要核销的信息");
											} else {
												if (row.LOANSTATE_NAME == '核销中') {
													$.messager.alert("提示","该贷款项正在核销中");
												} else if (row.LOANSTATE_NAME == '已核销') {
													$.messager.alert("提示","该贷款项已被核销");
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
						width : '95%',
						height : '95%',
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
														$.messager.alert("提示",data);
														$('#comDataGrid')
																.datagrid();
													},
													error : function() {
														$.messager.alert("提示","系统开了个小差，请刷新重试");
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
	/* 详情弹框 */
	$("#detailDialog").dialog({
		title : '贷款详情',
		width : 750,
		height : 450,
		top : '0%',
		closed : true,
		cache : false,
		modal : true
	});	
	/* 详情弹框结束*/
	/* 核销弹框*/
	$('#applyWriteOff').dialog({
		title : '申请核销',
		top : '10%',
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
						$.messager.alert("提示",data);
						$('#comDataGrid').datagrid();
					},
					error : function() {
						$.messager.alert("提示","系统开了个小差，请刷新重试");
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
		top : '10%',
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
						$.messager.alert("提示",data);
						$('#comDataGrid').datagrid();
					},
					error : function() {
						$.messager.alert("提示","系统开了个小差，请刷新重试");
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
		}]
	});
	
	function rmaa(){
		$("#legalName").empty();
		$("#legalCardtype").empty();
		$("#legalCardnumber").empty();
		$("#legalGender").empty();
		$("#legalMarry").empty();
		$("#legalAddress").empty();
		$("#legalPhone").empty();
		$("#legalInfo").empty();
		$("#legalInfo").empty();
	}
</script>
</html>
