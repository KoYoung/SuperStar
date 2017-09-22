<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/metro-gray/easyui.css"
	type="text/css"></link>
</head>
<body>
	<table id="dg"></table>
	<div id="empDialog" style="padding: 5px; display: none;">
		<form id="empForm" method="post">
			<table>
				<tr>
					<th>员工姓名</th>
					<td><input type="text" name="empName"><input
						type="hidden" name="empId"></td>
					<th>员工性别</th>
					<td><input type="radio" name="empGender" value="男" checked>男&nbsp;<input
						type="radio" name="empGender" value="女">女</td>
				</tr>
				<tr>
					<th>电话</th>
					<td><input type="text" name="empTelphone"></td>
					<th>邮箱</th>
					<td><input type="text" name="empEmail"></td>
				</tr>
				<tr>
					<th>身份证号</th>
					<td width="160px"><input type="text" name="empCardnumber">
					</td>
					<th>地址</th>
					<td><input type="text" name="empAddress"></td>
				</tr>
				<tr>
					<th>学历</th>
					<td><select class="easyui-combobox" id="empEducation"
						required="required" name="empEducation">
							<option value="初中">初中</option>
							<option value="高中">高中</option>
							<option value="专科">专科</option>
							<option value="本科">本科</option>
							<option value="研究生">研究生</option>
							<option value="博士">博士</option>
					</select></td>
					<th>民族</th>
					<td><input type="text" id="empNation" name="empNation"></td>
				</tr>
				<tr>
					<th>所属银行:</th>
					<td><input id="empBank" data-options="required:true"
						name="empBank" onChange="asd()" /></td>
					<th>部门</th>
					<td><input id="empDept" data-options="required:true"
						name="empDept" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	var datagrid;
	datagrid = $('#dg').datagrid({
		url : '/badLoan/Emp/findEmp',
		rownumbers : true, //显示行号
		pagination : true, //显示分页
		pageSize : 10, //默认显示多少行
		pageList : [ 5, 10, 15, 20 ],//行号下拉列表
		sortName : 'empId',//默认员工编号
		fitColumns : true,
		striped : true,
		singleSelect : true,
		columns : [ [ {
			field : 'empId',
			title : '员工编号',
			width : 200
		}, {
			field : 'empName',
			title : '员工姓名',
			width : 100
		}, {
			field : 'empTelphone',
			title : '员工电话',
			width : 100,
		}, {
			field : 'empEmail',
			title : '员工邮箱',
			width : 100
		},{
			field : 'empFlag',
			title : '员工状态',
			width : 100,
			formatter: function (index,row) {
                if(row.empFlag==1)
                	return "<span onclick='disableEmp()'>已启用</span>";
                else
                	return "<span style='color:red' onclick='enableEmp()'>已禁用</span>";
            }
		} ] ],
		toolbar : [ '-',{
			text : '添加',
			iconCls : 'icon-add',
			handler : function() {
				add();
			}
		},'-', {
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {
				edit();
			}
		},'-', {
			text : '禁用',
			iconCls : 'icon-no',
			handler : function() {
				disableEmp();
			}
		},'-', {
			text : '启用',
			iconCls : 'icon-ok',
			handler : function() {
				enableEmp();
			}
		} ]
	});

	function add() {
		var p = $("#empDialog").show().dialog({
			title : '添加员工',
			width : 600,
			height : 300,
			buttons : [ {
				text : '添加',
				handler : function() {
					var f = $("#empForm").serialize();
					$.ajax({
						url : '/badLoan/Emp/addEmp',
						type : "post",
						data : f,
						success : function(data) {
							datagrid.datagrid("reload");
							p.dialog("close");
						}
					});
				}
			} ],
		});
	};
	$(function() {
		$('#empEducation').combobox({
			panelHeight : "auto",
			width : 174,
			height : "auto",
			editable : false
		});

		$('#empFlag').combobox({
			panelHeight : "auto",
			width : 174,
			height : "auto",
			editable : false
		});

		$('#empFlag').combobox({
			url : '../json/flag.json',
			valueField : 'id',
			textField : 'name',
			width : 174,
		});
	});
	/*
	 * 银行下拉框 
	 */
	$("#empBank").combobox({
		url : '../BankInfo/findBankInfo',
		valueField : 'bankInfoId',
		textField : 'bankInfoName',
		width : 174,
		panelHeight : "auto",
		editable : false,
		onLoadSuccess : function() {
			var data = $("#empBank").combobox('getData');
			if (data.length > 0) {
				$("#empBank").combobox('setValue', data[0].bankInfoId);
			}
		},
		onChange : function() {
			var bankId = $("#empBank").combobox('getValue');
			$("#empDept").combobox({
				url : '../deptController/findDept',
				valueField : 'DEPT_ID',
				textField : 'DEPT_NAME',
				width : 174,
				panelHeight : "auto",
				editable : false,
				queryParams : {
					bankId : bankId
				},
				onLoadSuccess : function() {
					var data = $("#empDept").combobox('getData');
					if (data.length > 0) {
						$("#empDept").combobox('setValue', data[0].DEPT_ID);
					}
				}
			});
		}
	});

	$("#empNation").combobox({
		url : '../json/nation.json',
		valueField : 'name',
		textField : 'name',
		width : 174,
		panelHeight : "80"
	});
	//修改用户
	function edit() {
		var rows = datagrid.datagrid("getChecked");
		if (rows.length == 1) {
			var p = $("#empDialog").show().dialog({
				title : '修改员工',
				width : 600,
				height : 300,
				buttons : [ {
					text : '修改',
					handler : function() {
						var f = $("#empForm");
						f.form('submit', {
							url : '../Emp/modifyEmp',
							success : function(data) {
								//var json = $.parseJSON(data);//如果使用的是easyui自带ajax，则需要将返回数据转换成json对象
								if (data == "success") {
									datagrid.datagrid("reload");
									p.dialog("close");
								}
								$.messager.show({
									msg : "修改成功",
									timeout : 2000,
									title : "提示"
								});
							}
						});
					}
				} ],
				onOpen : function() {//在修改对话框打开的时候初始化表单数据
					var f = $("#empForm");
					/* var deptno = f.find('input[id=empId]');
					var deptNoCombobox = deptno.combobox({
								url : '../Emp/findIdEmp',
								valueField : 'empId',
								textField : 'empName',
								multiple : false,
								editable : false,
								panelHeight : 'auto'
							}); */
					f.form('load', {
						empId : rows[0].empId,
						empName : rows[0].empName,
						empGender : rows[0].empGender,
						empTelphone : rows[0].empTelphone,
						empEmail : rows[0].empEmail,
						empCardnumber : rows[0].empCardnumber,
						empAddress : rows[0].empAddress,
						empEducation : rows[0].empEducation,
						empNation : rows[0].empNation,
						empBankinfo : rows[0].empBankinfo,
						empDepartment : rows[0].empDepartment,
					})
				}
			});
		} else if (rows.length > 1) {
			$.messager.alert("提示", "一次只能修改一条记录", "error");
		} else {
			$.messager.alert("提示", "请选择你要修改的记录", "error");
		}
	}

	function enableEmp() {
		var rows = datagrid.datagrid("getSelected");
		if (rows == null) {
			$.messager.alert("提示", "请选择你要修改的记录", "error");
		} else if (rows.empFlag == 1) {
			$.messager.alert("提示", "已经是启用状态", "error");
		} else {
			$.messager.confirm('提示',"是否确定要启用该员工？",function(r){
				if (r){
					$.ajax({
						url : "../Emp/enableEmp",
						type : "post",
						data : {
							empId : rows.empId,
							empFlag : 1
						},
						success : function(data1) {
							$.messager.alert("提示", "启用成功", "");
							datagrid.datagrid({});
						},
						error : function() {
							$.messager.alert("提示", "服务器开了个小差，请刷新重试", "error");
						}
					});
				}
			});
		}
	}
	function disableEmp() {
		var rows = datagrid.datagrid("getSelected");
		if (rows == null) {
			$.messager.alert("提示", "请选择你要修改的记录", "error");
		} else if (rows.empFlag == 0) {
			$.messager.alert("提示", "已经是禁用状态", "error");
		} else {
			 $.messager.confirm('提示',"是否确定要禁用该员工？",function(r){
				    if (r){   
				    	$.ajax({
							url : "../Emp/enableEmp",
							type : "post",
							data : {
								empId : rows.empId,
								empFlag : 0
							},
							success : function(data1) {
								$.messager.alert("提示", "禁用成功", "");
								datagrid.datagrid({});
							},
							error : function() {
								$.messager.alert("提示", "服务器开了个小差，请刷新重试", "error");
							}
						});
				 	}
				 });
		}
	}
</script>
</html>