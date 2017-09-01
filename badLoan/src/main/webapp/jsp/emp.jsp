<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../easyui/themes/default/easyui.css"
	type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<table id="dg"></table>
</body>
<script>
	var datagrid;
	datagrid = $('#dg').datagrid({
		url : '/badLoan/Emp/findEmp',
		rownumbers : true, //显示行号
		pagination : true, //显示分页
		pageSize : 5, //默认显示多少行
		pageList : [ 5, 10, 15, 20 ],//行号下拉列表
		sortName : 'empId',//默认员工编号
		sortOrder : 'asc',//默认升序
		remoteSort : false,//不去服务器排序
		fitColumns : true,
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
		} ] ],
		toolbar : [ {
			text : '添加',
			iconCls : 'icon-add',
			handler : function() {
				add();
			}
		}, {
			text : '删除',
			iconCls : 'icon-remove',
			handler : function() {
				remove();
			}
		}, {
			text : '修改',
			iconCls : 'icon-edit',
			handler : function() {
				edit();
			}
		}

		]
	});
	function searchByCondition() {
		datagrid.datagrid('load', {
			ename : $("#ename").val(),
			job : $("#job").val()
		});

	}
	function resetsearchByCondition() {
		//刷新页面
		datagrid.datagrid('load', {}

		);
		//清空页面输入框的值
		$("#selectForm input").val("");
	}

	function add() {
		var p = $("#empDialog").show().dialog({
			title : '添加员工',
			width : 600,
			height : 300,
			buttons : [ {
				text : '添加',
				handler : function() {
					var f = $("#empForm");
					f.form('submit', {
						url : 'EmpServlet?chenjian=addEmp',
						success : function(data) {
							var json = $.parseJSON(data);//如果使用的是easyui自带ajax，则需要将返回数据转换成json对象
							if (json.success) {
								datagrid.datagrid("reload");
								p.dialog("close");
							}
							$.messager.show({
								msg : json.msg,
								timeout : 3000,
								title : "提示"
							}

							);
						}

					})
				}

			} ],

		})
	}

	//修改用户
	function edit() {
		var rows = datagrid.datagrid("getChecked");
		if (rows.length == 1) {
			var p = $("#empDialog")
					.show()
					.dialog(
							{
								title : '修改员工',
								width : 600,
								height : 300,
								buttons : [ {
									text : '修改',
									handler : function() {
										var f = $("#empForm");
										f
												.form(
														'submit',
														{
															url : 'EmpServlet?chenjian=updateEmp',
															success : function(
																	data) {
																var json = $
																		.parseJSON(data);//如果使用的是easyui自带ajax，则需要将返回数据转换成json对象
																if (json.success) {
																	datagrid
																			.datagrid("reload");
																	p
																			.dialog("close");
																}
																$.messager
																		.show({
																			msg : json.msg,
																			timeout : 3000,
																			title : "提示"
																		}

																		);
															}

														})
									}

								} ],
								onOpen : function() {//在修改对话框打开的时候初始化表单数据
									var f = $("#empForm");
									var deptno = f.find('input[id=deptno]');
									var deptNoCombobox = deptno
											.combobox({
												url : '${pageContext.request.contextPath}/EmpServlet?chenjian=findAllDept',
												valueField : 'deptno',
												textField : 'dname',
												multiple : false,
												editable : false,
												panelHeight : 'auto'
											});
									f.form('load', {
										empno : rows[0].empno,
										ename : rows[0].ename,
										job : rows[0].job,
										mgr : rows[0].mgr,
										hiredate : rows[0].hiredate,
										sal : rows[0].sal,
										comm : rows[0].comm,
										deptno : rows[0].deptno,

									})

								}

							})

		} else if (rows.length > 1) {

			$.messager.alert("提示", "一次只能修改一条记录", "error");
		} else {
			$.messager.alert("提示", "请选择你要修改的记录", "error");

		}

	}
	function remove() {

		//获取选中行(多行)
		var rows = datagrid.datagrid("getChecked");
		var empnos = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '你要删除当前选中行？', function(r) {
				if (r) {
					for (var i = 0; i < rows.length; i++) {
						empnos.push(rows[i].empno);
					}
					$.ajax({
						url : "EmpServlet?chenjian=deleteEmp",
						data : {
							empnos : empnos.join(',')
						},
						dataType : "json",//如果指定了json类型，返回的数据直接使用
						success : function(gg) {
							if (gg.success) {
								datagrid.datagrid("reload");
							}
							$.messager.show({
								msg : gg.msg,
								timeout : 3000,
								title : "提示"
							});

						}
					})
				}

			});
		} else {
			$.messager.alert("提示", "请选中你要删除的行", "error");
		}
	}
</script>
</html>