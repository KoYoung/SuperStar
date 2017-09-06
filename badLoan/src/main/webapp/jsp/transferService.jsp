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
tr td {
	padding-bottom: 15px;
}

.text1 {
	height: 25px;
	border: 0px;
	border-radius: 5px;
	text-align:center;
	background-color: rgba(146, 152, 162, 0.1);
	box-shadow: 2px 2px 2px 2px rgba(146, 152, 162, 0.8) inset;
}

</style>
<body>
	<div>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			onclick="submitForm()" id="addBtn">业务移交</a>
	</div>
	<table id="dg"></table>
	<div id="dd">

		<div style="padding: 0 30px 20px 30px">
			<h1>业务移交</h1>
			<form id="ff" method="post">
				<table cellpadding="10" cellspacing="10">
					<tr>
						<td><select id="loaninfoType" name="loaninfoType" class="easyui-combobox">
								<option value="0" selected="selected">个人贷款</option>
								<option value="1">企业贷款</option>
						</select></td>
					</tr>
					<tr>
						<td>贷款编号：<input class="text1" id="borloaninfoId" name="loaninfoId"/></td>
						<!-- style="text-align:center" -->
						<td>贷款人：<input id="borId" class="text1" name="borId"  readonly="readonly"/></td>
					</tr>
					<tr>
						<td>贷款银行：<input class="text1" id="bankinfoName" readonly="readonly"/></td>
						<td>经手人：&nbsp;&nbsp;<input class="text1" id="empName" name="oldEmpId" readonly="readonly"/></td>	
					</tr>
					<tr><td style="font-size:18px;font-family:微软雅黑;color:red">移交贷款经手人</td></tr>
					<tr>
						<td>贷款银行：<input id="bankInfoId" name="bankInfoId" /></td>
						<td>经&nbsp;手&nbsp;人：<input id="empId"  name="newEmpId"/></td>
					</tr>
				</table>
				<div style="margin-left:30px">说明：&nbsp;<input class="easyui-textbox" name="replaceComment" data-options="required:true" style="height:70px;width:240px"/></div>
			</form>
		</div>
	</div>

	<script>
		$('#dd').dialog(
						{
							title : '不良贷款信息录入',
							width : '35%',
							height : 600,
							closed : true,
							cache : false,
							modal : true,
							buttons : [{
										iconCls : 'icon-save',
										text : '保存',
										handler : function() {
											$('#ff').form('submit',{
												url : '/badLoan/replace/addReplace',
												onSubmit : function() {
													var isValid = $(this).form('validate');
													if (!isValid) {
															$.messager.progress('close');// 如果表单是无效的则隐藏进度条
														}
															return isValid; // 返回false终止表单提交
												},
												success : function(data) {
													alert("添加成功");
													window.location.href = "/badLoan/jsp/transferService.jsp";
												}
											}); 
										}
									}, {
										text : '关闭',
										iconCls : 'icon-close',
										handler : function() {
											$('#dd').dialog('close');
										}
									} ]
						});
		$("#borloaninfoId").blur(
			function() {
				$("#borId").val("");
				$("#empName").val("");
				$("#bankinfoName").val("");
				var data={};
				data["loaninfoType"] = $("#loaninfoType").val();
				data["borloaninfoId"] = $("#borloaninfoId").val();
				//alert(JSON.stringify(data));
				$.ajax({
					type : "post",
					url : '/badLoan/BorLoanInfo/findBorLoanInfo2',
					//async : false,
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					//dataType : "text",
					success : function(data) {
						/* alert(data.borName);
						alert(data.empName);
						alert(data.bankinfoName); */
						$("#borId").val(data.borName);
						$("#empName").val(data.empName+" "+data.empId);
						$("#bankinfoName").val(data.bankinfoName);
					}
				});
			}
		);
		$("#addBtn").click(function() {
			$('#dd').dialog("open");
			//查询所有银行
			$("#bankInfoId").combobox({
				url : '/badLoan/BankInfo/findBankInfo',
				valueField : 'bankInfoId',
				textField : 'bankInfoName',
				panelHeight : "auto",
				editable : false,
				required : true,
				width : 170,
				onLoadSuccess : function() {
					var data = $("#bankInfoId").combobox('getData');
					if (data.length > 0) {
						$("#bankInfoId").combobox('setValue', data[0].bankInfoId);
					}
				},
				onSelect : function(rec){
						var url = '/badLoan/employee/findAllEmployee?bankInfoId='+rec.bankInfoId;
						$("#empId").combobox({
							valueField : 'empId',
							textField : 'empName',
							panelHeight : "auto",
							editable : false,
							required : true,
							url : url,
							width : 170,
							onLoadSuccess : function() {
								var data = $("#empId").combobox('getData');
								if (data.length > 0) {
									$("#empId").combobox('setValue', data[0].empId);
								}
							}, 
							onselect : function(rec){
									$("#bankInfoId").val(rec.empId);
							}
						});
					}
			
			});
		});
		
		

		$("#loaninfoType").combobox({
			panelHeight : "auto",
			editable : false,
			required : true,
			width : 170,
		});
		$('#dg').datagrid({
			url : '/badLoan/replace/findReplace',
			striped : true, //斑马线 
			nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
			pagination : true, //底部分页
			pageSize:5,
			pageNumber:1,
			pageList:[5,10,15,20],
			rownumbers : true, //如果为true，则显示一个行号列
			columns : [ [ {
				field : 'loaninfoId',
				title : '贷款编号',
				width : 100
			},  {
				field : 'borName',
				title : '贷款人',
				width : 100
			},{
				field : 'oldEmpName',
				title : '原经手人',
				width : 100
			}, {
				field : 'newEmpName',
				title : '现经手人',
				width : 100
			}, {
				field : 'replaceDate',
				title : '移交时间',
				width : 200
			}, {
				field : 'loaninfoType',
				title : '贷款种类',
				width : 100,
				formatter:function(value){
				    if(value=0){
				        return "个人贷款";
				    }else{
				        return "企业贷款";
				    }
				}
			}] ]
		});
	</script>
</body>
</html>