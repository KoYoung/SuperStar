<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/metro-gray/easyui.css"
	type="text/css"></link>
<script src="../js/distpicker.data.js"></script>
<script src="../js/distpicker.js"></script>
<script src="../js/main.js"></script>

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
}
</style>
</head>
<body>
	<div style="padding: 0 60px 20px 60px">
		<h2>个人贷款录入</h2>
		<form id="ff" method="post">
			<table cellpadding="5" id="tab1">
				<tr>
					<td>个人姓名:</td>
					<td><input id=borId name="borId" /></td>
				</tr>
				<tr>
					<td>贷款银行:</td>
					<td><input id="bankInfoId"></td>
				</tr>
				<tr>
					<td>合同编号:</td>
					<td><input class="easyui-textbox" name="studentName"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>经手人:</td>
					<td><input id="empId" /></td>
				</tr>
				<tr>
					<td>贷款种类:</td>
					<td><input id="loantypeId" /></td>
				</tr>
				<tr>
					<td>贷款金额:</td>
					<td><input class="easyui-textbox" name="studentJg"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>贷款账号:</td>
					<td><input class="easyui-textbox" name="studentJg"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>贷款日期:</td>
					<td><input class="easyui-datebox" data-options="required:true" /></td>
				</tr>
				<tr>
					<td>还款日期:</td>
					<td><input class="easyui-datebox" data-options="required:true" /></td>
				</tr>
				<tr>
					<td>贷款利率:</td>
					<td><input class="easyui-textbox" name="studentJg"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>用户紧急联系人:</td>
					<td><input class="easyui-textbox" name="studentJg"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>贷款利率:</td>
					<td><input class="easyui-textbox" name="studentJg"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>贷款利率:</td>
					<td><input class="easyui-textbox" name="studentJg"
						data-options="required:true"></input></td>
				</tr>
			</table>
		</form>
		<div style="padding: 5px">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
				onclick="submitForm()" id="submit">添加</a> <a
				class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
				onclick="clearForm()">重置</a>
		</div>

	</div>
	<script>
		$('#tb').textbox({
			prompt : '请输入详细地址'
		});

		/* function submitForm(){
		$('#ff').form('submit');
		}  */
		function clearForm() {
			$('#ff').form('clear');
		}
		/*  $('#borId').combobox({
			url : '',
			valueField : 'borId',
			textField : 'borName',
			panelHeight : "auto",
			editable : false,
			onLoadSuccess : function() {
				var data = $("#borId").combobox('borId');
				if (data.length > 0) {
					$("#borId").combobox('setValue', data[0].borId);
				}
			},
		});  */

		$("#empId").combobox({
			url : '/badLoan/employee/findAllEmployee',
			valueField : 'empId',
			textField : 'empName',
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
			required : true,
			editable : false,
			onLoadSuccess : function() {
				var data = $("#bankInfoId").combobox('getData');
				if (data.length > 0) {
					$("#bankInfoId").combobox('setValue', data[0].bankInfoId);

				}
			},
		});
		$("#loantypeId").combobox({
			url : '/badLoan/LoanType/findLoanType',
			valueField : 'loantypeId',
			textField : 'loantypeName',
			panelHeight : "auto",
			editable : false,
			onLoadSuccess : function() {
				var data = $("#loantypeId").combobox('getData');
				if (data.length > 0) {
					$("#loantypeId").combobox('setValue', data[0].loantypeId);

				}
			},
		});
		$.extend($.fn.validatebox.defaults.rules, {
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
		$("#submit").click(function() {
			$('#ff').form('submit', {
				url : '/TheLast/student/addStudent',
				onSubmit : function() {
					var isValid = $(this).form('validate');
					if (!isValid) {
						$.messager.progress('close');// 如果表单是无效的则隐藏进度条
					}
					return isValid; // 返回false终止表单提交
				},
				success : function(data) {
					alert("添加成功");
					window.location.href = "queryStudent.jsp";
				}
			});
		});
	</script>
</body>
</html>
