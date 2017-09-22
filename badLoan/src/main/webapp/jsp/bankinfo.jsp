<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
<!--级联  -->
<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../bootstrap-3.3.7-dist/js/distpicker.data.js"></script>
<script src="../bootstrap-3.3.7-dist/js/distpicker.js"></script>
<script src="../bootstrap-3.3.7-dist/js/main.js"></script>
<!--级联  -->
<style type="text/css">
tr td {
	padding: 5px 10px 5px 10px;
}
</style>
</head>
<body>
	<div id="toobar">
		<a id="addpersonal" class="easyui-linkbutton"
			href="javascript:void(0)" data-options="iconCls:'icon-add'">添加银行信息</a>
	</div>
	<table id="dg"></table>
	<div id="addper">
		<form id="myForm" enctype="multipart/form-data" method="post">
			<table class="formtable" id="tableAddper">
				<tr>
					<th>银行名称</th>
					<td><input class="easyui-textbox" id="bankInfoName"
						name="bankInfoName" /></td>
				</tr>
				<tr>
					<th>银行电话</th>
					<td><input class="easyui-numberbox" id="bankInfoTelePhone"
						name="bankInfoTelePhone" /></td>
				</tr>
				<tr>
					<th>银行地址</th>
					<td>
						<div class="form-inline">
							<div data-toggle="distpicker">
								<div class="form-group">
									<label class="sr-only" for="province3">Province</label> <select
										class="form-control" id="bankinfoAddress"
										name="bankinfoAddress" data-province="浙江省"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="city3">City</label> <select
										class="form-control" id="bankinfoAddress"
										name="bankinfoAddress" data-city="杭州市"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="district3">District</label> <select
										class="form-control" id="bankinfoAddress"
										name="bankinfoAddress" data-district="西湖区"></select>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	$("#bankInfoName").textbox({
		min : 0,
		width : 200,
		required : true,
	});
	$("#bankInfoTelePhone").numberbox({
		min : 0,
		width : 200,
		required : true,
		validType : 'mobile'
	});
	
	$.extend($.fn.validatebox.defaults.rules, {
		mobile : {
			validator : function(value) {
				var reg = /^1[3|4|5|8|9]\d{9}$/;
				return reg.test(value);
			},
			message : '输入手机号码格式不准确.'
		}
	});
	$('#addper').dialog({
		title : '添加银行信息',
		iconCls : 'icon-save',
		width : '40%',
		height : 300,
		closed : true,
		cache : false,
		modal : true,
		pagination : true,//开启分页功能
		pageNumber : 1,
		pageSize : 5,
		pageList : [ 5, 10, 15, 20, 25, 30 ],
		sortName : 'empno',//定义哪些列可以进行排序
		sortOrder : 'asc',//定义列的排序顺序,默认正序asc
		fitColumns : true,
		striped : true,
		loadMsg : "努力加载中......",
		buttons : [ {
			text : '保存客户信息',
			iconCls : 'icon-save',
			handler : function() {
				$.messager.progress(); // 显示进度条
				$('#myForm').form('submit', {
					url : '/badLoan/BankInfo/addBankInfo',
					onSubmit : function() {
						var isValid = $(this).form('validate');
						if (!isValid) {
							$.messager.progress('close'); // 如果表单是无效的则隐藏进度条
						}
						return isValid; // 返回false终止表单提交
					},
					success : function() {
						$.messager.progress('close'); // 如果提交成功则隐藏进度条
						window.location.href = "/badLoan/jsp/bankinfo.jsp"
					}
				});
			}
		}, {
			text : '关闭',
			handler : function() {
				alert("取消");
				$('#addper').dialog("close");
			}
		} ]
	});

	$("#addpersonal").click(function() {
		$('#addper').dialog("open");
	});

	var datagrid;
	datagrid = $('#dg').datagrid({
		url : '/badLoan/BankInfo/findBankInfo',
		rownumbers : true, //显示行号
		pagination : true, //显示分页
		pageSize : 10, //默认显示多少行
		pageList : [ 5, 10, 15, 20 ],//行号下拉列表
		sortName : 'bankInfoId',//默认员工编号
		sortOrder : 'asc',//默认升序
		remoteSort : false,//不去服务器排序
		fitColumns : true,
		cache : false,
		singleSelect : true,
		checkbox : false,
		columns : [ [ {
			field : 'bankInfoId',
			title : '银行编号',
			width : 100
		}, {
			field : 'bankInfoName',
			title : '银行名称',
			width : 100
		}, {
			field : 'bankInfoTelePhone',
			title : '银行电话',
			width : 100,
		}, {
			field : 'bankinfoAddress',
			title : '银行地址',
			width : 100
		} ] ],

	});
</script>
</html>