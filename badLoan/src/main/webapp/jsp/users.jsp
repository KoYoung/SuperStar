<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../easyui/themes/default/easyui.css"
	type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<table id="proDataGrid"></table>
	<div id="toolbar">
		<a id="addBtn" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'">增加</a>
	</div>

	<div id="handlerDialog">
		<form id="myForm" method="post">
			<table width="100%" class="formtable">
				<tr>
					<th height="25">用户编号</th>
					<td><input id="proId" name="userId"></td>

				</tr>
				<tr>
					<th height="25">用户昵称：</th>
					<td><input id="proName" name="userName"></td>
				</tr>
				<tr>
					<th height="25">用户登录名</th>
					<td><input id="proPrice" name="userUsername"></td>
				</tr>
				<tr>
					<th height="25">用户密码</th>
					<td><input id="propass" name="userPassword"></td>
				</tr>
				<tr>
					<th height="25">添加员工id</th>
					<td>
					     <input id="proemp"/>  
					</td>
				</tr>
				<tr>
					<th height="25">添加角色</th>
					<td>
						<input id="prorole"/>
						 
					</td>
				</tr>
			</table>
			<ul id="tt"></ul> 
		</form>
	</div>
</body>
<script>
	$('#prorole').combotree({    
	    url: '/badLoan/usersController/queryRole2',    
	    valueField:'roleId',
	    textField:'text'
	}); 
	$('#proemp').combobox({    
	    url:'/badLoan/usersController/queryRole1',    
	    valueField:'empId',
	    textField:'empName',
	    panelHeight:'auto'
	}); 
	 
	$("#addBtn").click(function() {
		$('#handlerDialog').dialog("open");
	});
	$('#handlerDialog').dialog({
		title : '添加系统用户',
		iconCls : 'icon-save',
		width : 400,
		height : 300,
		top : 100,
		closed : true,
		cache : false,
		modal : true,
		buttons : [ {
			text : '保存',
			iconCls : 'icon-save',
			handler : function() {
				$('#myForm').form('submit', {
					url : "/badLoan/usersController/addUsers",
					onSubmit : function() {
						//alert( $("#proId").val()+":"+ $("#proName").val());
						var isValid = $(this).form('validate');
						return isValid;
					},
					success : function(data) {
						alert(data);
						if (data == 1) {
							//更新grid
							//$('#proDataGrid').datagrid("reload");

							$('#proDataGrid').datagrid('insertRow', {
								index : 0, // 索引从0开始
								row : {
									userId : $("#proId").val(),
									userName : $("#proName").val(),
									userUsername : $("#proPrice").val(),
									userPassword : $("#propass").val(),
									empId : $("#proemp").val(),
									roleName : $("#prorole").val(),

								}
							});
							$('#handlerDialog').dialog("close");
						}
					}
				});
			}
		}, {
			text : '取消',
			handler : function() {
				$('#handlerDialog').dialog("close")
			}
		} ]
	});
	//-----------------------------
	$(function() {
		$('#proDataGrid').datagrid({
			url : '/badLoan/usersController/queryUsers',
			// data:data,
			fitColumns : true,//自动适应网格宽度
			striped : true,//显示斑马线
			idField : "userId",//设置productid为主键
			fit : true,//
			rownumbers : true,
			singleSelect : false,
			pagination : true,
			pageSize : 5,
			pageList : [ 5, 10, 20 ],
			toolbar : "#toolbar",
			
			columns : [ [ {
				field : 'userId',
				title : '用户编号',
				width : 200
			} ,{
				field : 'userName',
				title : '用户昵称',
				width : 200,
			}, {
				field : 'userUsername',
				title : '用户账号',
				width : 200,
			},{
				field : 'userPassword',
				title : '用户密码',
				width : 200,
			},{
				field : 'empId',
				title : '角色id',
				width : 200,
			}, {
				field:'operate',
				title:'操作',
				align:'center',
				width:$(this).width()*0.1,  
			    formatter:function(value, row, index){  
			        var str = '<a href="#" name="opera" class="easyui-linkbutton" ></a><a href="#" name="opera2" class="easyui-linkbutton" ></a>';  
			        return str;  
			        }
			} ] ],
			onLoadSuccess:function(data){    
	       		$("a[name='opera']").linkbutton({
	       			text:'禁用',
	       			plain:true,
	       			iconCls:'icon-cancel'
	       			
	       		});
	       		$("a[name='opera2']").linkbutton({text:'启用',plain:true,iconCls:'icon-ok'});
			},  
		});

		});
	
</script>
</html>