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
<link rel="stylesheet" href="../easyui/themes/pepperGrinder/easyui.css"
	type="text/css"></link>
</head>
<body>
	<table id="dg"></table>
	<div id="userDialog" style="padding: 5px; display: none;">
		<form id="userForm" method="post">
			<table>
				<tr>
					<th>用户编号</th>
					<td><input type="text" name="userId" id="userid"
						data-options="validType:'minLength[4]'" required="required"></input>

					</td>
					<th>员工姓名</th>
					<td><input id="userName_emp" name="empId"></td>
					<th>用户姓名</th>
					<td><input id="userName" name="userName"></td>
				</tr>
				<tr>
					<th>用户账号</th>
					<td><input type="text" name="userUsername"></td>
					<th>用户密码</th>
					<td><input type="text" name="userPassword"></td>
					<th>状态</th>
					<td><input id="state" name="state"></td>
				</tr>
				<tr>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	var datagrid;
	datagrid = $('#dg').datagrid({
		url : '/badLoan/User/findUser',
		rownumbers : true, //显示行号
		pagination : true, //显示分页
		pageSize : 10, //默认显示多少行
		pageList : [ 5, 10, 15, 20 ],//行号下拉列表
		sortName : 'userId',//默认员工编号
		sortOrder : 'asc',//默认升序
		remoteSort : false,//不去服务器排序
		fitColumns : true,
		cache : false,
		singleSelect : true,
		checkbox : false,
		columns : [ [ {
			field : 'userId',
			title : '用户编号',
			width : 100
		}, {
			field : 'userName',
			title : '用户姓名',
			width : 100
		}, {
			field : 'roleId',
			title : '角色编号',
			width : 100,
		}, {
			field : 'roleName',
			title : '角色名称',
			width : 100
		}, {
			field : 'state',
			title : '状态',
			width : 100
		}

		] ],
		toolbar : [ {
			text : '添加',
			iconCls : 'icon-add',
			handler : function() {
				add();
			}
		}, {
			text : '查看',
			iconCls : 'icon-edit',
			handler : function() {
				edit();
			}
		}

		]
	});
	$('#state').combobox({
		//url : '../json/state.json',
		width : 100,
		valueField : 'id',
		panelHeight : 'auto',
		textField : 'text',
		data : [ {
			"id" : 1,
			"text" : "启用"
		}, {
			"id" : 2,
			"text" : "禁用",
		} ],
		onLoadSuccess : function() {
			$("#state").combobox('setValue', 2);
		}
	});

	function add() {
		var p = $("#userDialog").show().dialog({
			title : '添加用户',
			width : 800,
			height : 300,
			buttons : [ {
				text : '添加',
				handler : function() {
					$('#userForm').form('submit', {
						url : '/badLoan/User/addUser',
						success : function(data) {
							datagrid.datagrid("reload");
							p.dialog("close");

						}
					});
				}
			} ],

		})
	}

	$("#userName").combobox({
		url : '/badLoan/Emp/findNoUserEmp',
		width : 173,
		valueField : 'empId',
		textField : 'empName',
		panelHeight : "auto",
		editable : false,
		onLoadSuccess : function() {
			var data = $("#userName").combobox('getData');
			if (data.length > 0) {
				$("#userName").combobox('setValue', data[0].empId);
			}
		}
	});
	$("#userName_emp").combobox({
		url : '/badLoan/employee/findAllEmployee',
		width : 173,
		valueField : 'empId',
		textField : 'empName',
		panelHeight : "auto",
		editable : false,
		onLoadSuccess : function() {
			var data = $("#userName_emp").combobox('getData');
			if (data.length > 0) {
				$("#userName_emp").combobox('setValue', data[0].empId);
			}
		}
	});
	//修改用户
	function edit() {
		var rows = datagrid.datagrid("getChecked");
		if (rows.length == 1) {
			var p = $("#empDialog").show().dialog({
				title : '查看员工',
				width : 600,
				height : 300,

				onOpen : function() {//在修改对话框打开的时候初始化表单数据
					var f = $("#empForm");
					var deptno = f.find('input[id=empId]');

					var deptNoCombobox = deptno.combobox({
						url : 'badLoan/Emp/findEmp',
						valueField : 'empId',
						textField : 'empName',
						multiple : false,
						editable : false,
						readonly : false,
						panelHeight : 'auto'
					});
					f.form('load', {
						empId : rows[0].empId,
						empName : rows[0].empName,
						empGender : rows[0].empGender,
						empTelphone : rows[0].empTelphone,
						empCardnumber : rows[0].empCardnumber,
						empAddress : rows[0].empAddress,
						empEducation : rows[0].empEducation,
						empDepartment : rows[0].empDepartment,
						empEmail : rows[0].empEmail,
						empNation : rows[0].empNation,
						empFlag : rows[0].empFlag
					})
				}
			})

		} else if (rows.length > 1) {

			$.messager.alert("提示", "一次只能查看一条记录", "error");
		} else {
			$.messager.alert("提示", "请选择你要查看的记录", "error");

		}

	}
</script>
</html>