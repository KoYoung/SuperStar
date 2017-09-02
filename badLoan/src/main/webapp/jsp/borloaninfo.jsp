<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.easyui-textbox {
	width: 200px;
}

tr td {
	padding-bottom: 15px;
}

#tab2 {
	margin-left: 70px;
	margin-top: -23px;
	/* border:1px solid red; */
}

#tab3 {
	margin-left: 100px;
	margin-top: -23px;
	/* border:1px solid red; */
}
</style>
<body>
	<div style="padding: 5px">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="submitForm()" id="addBtn">添加</a>
	</div>
	<table id="dg"></table>
	<div id="dd">
		<div style="padding: 0 60px 20px 60px">
			<h2>个人贷款录入</h2>
			<form id="ff" method="post">
				<table>
					<tr>
						<td>
							<table cellpadding="5" id="tab1">
								<tr>
									<td>个人姓名:</td>
									<td><input id="borId" name="borId" /></td>
								</tr>
								<tr>
									<td>贷款银行:</td>
									<td><input id="bankInfoId" name="bankInfoId" /></td>
								</tr>
								<tr>
									<td>合同编号:</td>
									<td><input class="easyui-textbox" id="contractId"
										data-options="required:true,validType:'contractId'"></input></td>
								</tr>
								<tr>
									<td>经手人:</td>
									<td><input id="empId" name="empId" /></td>
								</tr>
								<tr>
									<td>贷款种类:</td>
									<td><input id="loanTypeId" name="loanType" /></td>
								</tr>
								<tr>
									<td>贷款金额:</td>
									<td><input class="easyui-textbox" id="loanNumber"
										data-options="required:true"></input>元</td>
								</tr>
								<tr>
									<td>贷款账号:</td>
									<td><input class="easyui-textbox" id="loanAccount"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>贷款日期:</td>
									<td><input class="easyui-datebox"
										data-options="required:true" id="loanDate" /></td>
								</tr>
								<tr>
									<td>还款日期:</td>
									<td><input class="easyui-datebox"
										data-options="required:true" id="loanRepaymentDate" /></td>
								</tr>
								<tr>
									<td>贷款利率:</td>
									<td><input class="easyui-textbox" id="loanRate"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>贷款类型:</td>
									<td><input type="radio" id="pledgeGenre" value="抵押" />抵押&nbsp;&nbsp;
										<input type="radio" id="pledgeGenre" value="质押" />质押</td>
								</tr>
								<tr>
									<td>抵(质)押物品类型:</td>
									<td><input class="easyui-textbox" id="pledgeType"
										data-options="required:true"></input></td>
								</tr>
							</table>
						</td>
						<td>
							<table cellpadding="5" id="tab2">
								<tr>
									<td>抵(质)押物品名称:</td>
									<td><input class="easyui-textbox" id="pledgeName"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>抵（质）押物品价值:</td>
									<td><input class="easyui-textbox" id="pledgeValue"
										data-options="required:true">元</input></td>
								</tr>
								<tr>
									<td>抵（质）押物所有人:</td>
									<td><input class="easyui-textbox" id="pledgeOwner"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>抵（质）押物品起始日期:</td>
									<td><input class="easyui-datebox"
										data-options="required:true" id="pledgeStartdate" /></td>
								</tr>
								<tr>
									<td>抵（质）押物品到期日:</td>
									<td><input class="easyui-datebox"
										data-options="required:true" id="pledgeEnddate" /></td>
								</tr>
								<tr>
									<td>抵（质）押物品照片:</td>
									<td><input class="easyui-textbox" id="pledgePhoto"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人姓名:</td>
									<td><input class="easyui-textbox" id="guaName"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人性别:</td>
									<td><input id="guaGender" type="radio" value="男"/>男&nbsp;&nbsp;
										<input id="guaGender" type="radio" value="女"/>女
									</td>
								</tr>
								<tr>
									<td>担保人联系方式:</td>
									<td><input class="easyui-textbox" id="guaPhone"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人出生年月:</td>
									<td><input class="easyui-datebox"
										data-options="required:true" id="guaBirthday" /></td>
								</tr>
								<tr>
									<td>担保人证件类型:</td>
									<td><input class="easyui-textbox" id="guaCardType"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人证件号码:</td>
									<td><input class="easyui-textbox" id="guaCardNumber"
										data-options="required:true"></input></td>
								</tr>
							</table>
						</td>
						<td>
							<table id="tab3">
								<tr>
									<td>担保人户籍地址:</td>
									<td>
										<div class="jq22-container form-inline">
											<div data-toggle="distpicker">
												<div class="form-group">
													<label class="sr-only" for="province3">Province</label> <select
														class="form-control" data-province="北京市" id="province"
														name="guaRegister">
													</select>
												</div>
												<div class="form-group">
													<label class="sr-only" for="city3">City</label> <select
														class="form-control" data-city="北京市市辖区" id="city"
														name="guaRegister">
													</select>
												</div>
												<div class="form-group">
													<label class="sr-only" for="district3">District</label> <select
														class="form-control" data-district="东城区" id="district"
														name="guaRegister">
													</select>
												</div>
											</div>
											<br> <input class="easyui-textbox tb" name="guaRegister"
												id="guaRegister" />
										</div>

									</td>
								</tr>

								<tr>
									<td>担保人现居住地址:</td>
									<td>
										<div class="jq22-container form-inline">
											<div data-toggle="distpicker">
												<div class="form-group">
													<label class="sr-only" for="province3">Province</label> <select
														class="form-control" data-province="北京市" id="province"
														name="guaAddress">
													</select>
												</div>
												<div class="form-group">
													<label class="sr-only" for="city3">City</label> <select
														class="form-control" data-city="北京市市辖区" id="city"
														name="guaAddress">
													</select>
												</div>
												<div class="form-group">
													<label class="sr-only" for="district3">District</label> <select
														class="form-control" data-district="东城区" id="district"
														name="guaAddress">
													</select>
												</div>
											</div>
											<br> <input class="easyui-textbox tb" name="guaAddress"
												id="guaAddress" />
										</div>

									</td>
								</tr>
								<tr>
									<td>担保人工作单位:</td>
									<td><input class="easyui-textbox" id="guaUnit"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人职业:</td>
									<td><input class="easyui-textbox" id="guaPosition"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人婚姻状况:</td>
									<td><input type="radio" id="guaMarry" value="已婚" />已婚&nbsp;&nbsp;
										<input type="radio" id="guaMarry" value="未婚" />未婚
								</tr>
								<tr>
									<td>担保人民族:</td>
									<td><input class="easyui-textbox" id="guaNation"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人学历:</td>
									<td><select id="guaEducation" class="easyui-combobox" style="width:200px;">   
									    <option value="大专">大专</option>   
									    <option value="本科" selected="selected">本科</option>   
									    <option value="研究生">研究生</option>   
									    <option value="博士">博士</option>   
									</select>  
									</td>
								</tr>
								<tr>
									<td>担保人收入:</td>
									<td><input class="easyui-textbox" id="guaIncome"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>贷款处理状态:</td>
									<td><input class="easyui-textbox" id="lmrName"
										data-options="required:true"></input></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
			<!-- <div style="padding: 5px">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
					onclick="submitForm()" id="submit">添加</a> <a
					class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
					onclick="clearForm()">重置</a>
			</div> -->

		</div>
	</div>

	<script>
		$('#dd')
				.dialog(
						{
							title : '不良贷款信息录入',
							width : '100%',
							closed : true,
							cache : false,
							modal : true,
							buttons : [
									{
										iconCls : 'icon-save',
										text : '保存',
										handler : function() {
											var data = {};
											data["borId"] = $("#borId").val();
											data["bankInfoId"] = $("#bankInfoId").val();
											data["contractId"] = $("#contractId").val();
											data["empId"] = $("#empId").val();
											data["loanType"] = $("#loanTypeId").val();
											data["loanNumber"] = $("#loanNumber").val();
											data["loanAccount"] = $("#loanAccount").val();
											data["loanDate"] = $("#loanDate").val();
											data["loanRepaymentDate"] = $("#loanRepaymentDate").val();
											data["loanRate"] = $("#loanRate").val();
											data["pledgeGenre"] = $("#pledgeGenre").val();
											data["pledgeType"] = $("#pledgeType").val();
											data["pledgeName"] = $("#pledgeName").val();
											data["pledgeValue"] = $("#pledgeValue").val();
											data["pledgeOwner"] = $("#pledgeOwner").val();
											data["pledgeStartdate"] = $("#pledgeStartdate").val();
											data["pledgeEnddate"] = $("#pledgeEnddate").val();
											data["pledgePhoto"] = $("#pledgePhoto").val();
											data["guaName"] = $("#guaName").val();
											data["guaGender"] = $("#guaGender").val();
											data["guaPhone"] = $("#guaPhone").val();
											data["guaBirthday"] = $("#guaBirthday").val();
											data["guaCardType"] = $("#guaCardType").val();
											data["guaCardNumber"] = $("#guaCardNumber").val();
											data["guaRegister"] = $("#province").val()+$("#city").val()+$("#district").val()+$("#guaRegister").val();//担保人地址
											data["guaAddress"] = $("#province").val()+$("#city").val()+$("#district").val()+$("#guaAddress").val();//担保人地址
											data["guaUnit"] = $("#guaUnit").val();
											data["guaPosition"] = $("#guaPosition").val();
											data["guaMarry"] = $("#guaMarry").val();
											data["guaNation"] = $("#guaNation").val();
											data["guaEducation"] = $("#guaEducation").val();
											data["guaIncome"] = $("#guaIncome").val();
											data["lmrName"] = $("#lmrName").val();
											alert(JSON.stringify(data));
											$.ajax({
														type : "post",
														url : '/badLoan/BorLoanInfo/addBorLoanInfo',
														async : false,
														contentType : "application/json;charset=utf-8",
														data : JSON.stringify(data),
														// dataType : "text",
														success : function(data1) {
															alert(JSON.stringify(data1));
															window.location.href = "/badLoan/jsp/borloaninfo.jsp";
														}
													});
											/* $('#ff').form('submit',{
											url : '/badLoan/BorLoanInfo/addBorLoanInfo',
											onSubmit : function() {
												var isValid = $(this).form('validate');
												if (!isValid) {
														$.messager.progress('close');// 如果表单是无效的则隐藏进度条
													}
														return isValid; // 返回false终止表单提交
												},
													success : function(data) {
															alert("添加成功");
															window.location.href = "/badLoan/jsp/borloaninfo.jsp";
														}
												}); */

										}
									}, {
										text : '关闭',
										iconCls : 'icon-close',
										handler : function() {
											$('#dd').dialog('close');
										}
									} ]
						});

		$("#addBtn").click(function() {
			$('#dd').dialog("open");
		});
		$('#borId').combobox({
			url : '/badLoan/borrower/findborr',
			valueField : 'borId',
			textField : 'borName',
			width : 200,
			panelHeight : "auto",
			editable : false,
			onLoadSuccess : function() {
				var data = $("#borId").combobox('getData');
				if (data.length > 0) {
					$("#borId").combobox('setValue', data[0].borId);
				}
			},
		});

		$("#empId").combobox({
			url : '/badLoan/employee/findAllEmployee',
			valueField : 'empId',
			textField : 'empName',
			width : 200,
			panelHeight : "auto",
			required : true,
			editable : false,
			onLoadSuccess : function() {
				var data = $("#empId").combobox('getData');
				if (data.length > 0) {
					$("#empId").combobox('setValue', data[0].empId);

				}
			},
		});
		$("#bankInfoId").combobox({
			url : '/badLoan/BankInfo/findBankInfo',
			valueField : 'bankInfoId',
			textField : 'bankInfoName',
			panelHeight : "auto",
			editable : false,
			width : 200,
			onLoadSuccess : function() {
				var data = $("#bankInfoId").combobox('getData');
				if (data.length > 0) {
					$("#bankInfoId").combobox('setValue', data[0].bankInfoId);

				}
			},
		});
		$("#loanTypeId").combobox({
			url : '/badLoan/LoanType/findLoanType',
			valueField : 'loanTypeId',
			textField : 'loanTypeName',
			panelHeight : "auto",
			editable : false,
			width : 200,
			onLoadSuccess : function() {
				var data = $("#loanTypeId").combobox('getData');
				if (data.length > 0) {
					$("#loanTypeId").combobox('setValue', data[0].loanTypeId);

				}
			},
		});
		
		$('#guaRegister').textbox({
			prompt : '请输入详细地址',
			required:true,
		});
		$('#guaAddress').textbox({
			prompt : '请输入详细地址',
			required:true,
		});
		//日期输入框禁止输入
		$(function(){
			$(".datebox :text").attr("readonly","readonly");
			})
		$.extend($.fn.validatebox.defaults.rules, {
			//合同编号只能输入数字
			contractId :{
				 validator: function (value, param) {
			            return /^[0-9]+.?[0-9]*$/.test(value);
			          },
			          message: '请输入数字'
			},
			//验证学号必须输入数字
			studentNo : {
				validator : function(value) {
					return /^[0-9_ ]{6,10}$/.test(value);
				},
				message : "只能输入数字,长度为6-10个数字"
			},
			//验证密码必须输入数字
			password : {
				validator : function(value) {
					return /^[a-zA-Z0-9_ ]{6}$/.test(value);
				},
				message : "请输入英文和数字，长度不少于6位"
			},
		});
		$('#dg').datagrid({
			url : '/badLoan/BorLoanInfo/findBorLoanInfo',
			striped : true, //斑马线 
			nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
			pagination : true, //底部分页
			rownumbers : true, //如果为true，则显示一个行号列
			columns : [ [ {
				field : 'borName',
				title : '个人用户编号',
				width : 100
			}, {
				field : 'bankinfoName',
				title : '贷款银行编号',
				width : 100
			}, {
				field : 'contractId',
				title : '合同编号',
				width : 100
			}, {
				field : 'empName',
				title : '经手人编号',
				width : 100
			}, {
				field : 'loanTypeName',
				title : '贷款种类编号',
				width : 100
			}, {
				field : 'loanNumber',
				title : '贷款金额(元)',
				width : 100
			}, {
				field : 'loanAccount',
				title : '贷款账号',
				width : 100
			}, {
				field : 'loanDate',
				title : '贷款日期',
				width : 150
			}, {
				field : 'loanRepaymentDate',
				title : '还款日期',
				width : 150
			}, {
				field : 'loanRate',
				title : '贷款利率',
				width : 100
			},{
				field : 'pledgeType',
				title : '抵押物品类型',
				width : 100
			},{
				field : 'pledgeName',
				title : '抵押物品名称',
				width : 100
			},{
				field : 'pledgeValue',
				title : '抵押物品价值',
				width : 100
			},{
				field : 'pledgeOwner',
				title : '抵押物品所属人',
				width : 100
			},{
				field : 'guaName',
				title : '担保人',
				width : 100
			},{
				field : 'lmrName',
				title : '贷款状态',
				width : 100
			}] ]
		});
	</script>
</body>
</html>