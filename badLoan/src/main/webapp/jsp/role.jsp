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
	<table id="proDataGrid"></table>
	<div id="toolbar">
		<a id="addBtn" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'">增加</a>
	</div>

	<div id="handlerDialog">
		<form id="myForm" method="post">
			<table width="100%" class="formtable">
				<tr>
					<th height="25">角色编号：</th>
					<td><input id="proId" name="roleId"></td>
					<!-- <td><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">禁用</a></td>
					<td><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">启用</a></td> -->
				</tr>
				<tr>
					<th height="25">角色姓名：</th>
					<td><input id="proName" name="roleName"></td>
				</tr>
				<tr>
					<th height="25">角色说明：</th>
					<td><input id="proPrice" name="roleComment"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	$("#addBtn").click(function() {
		$('#handlerDialog').dialog("open");
	});
	$('#handlerDialog').dialog({
		title : '增加角色',
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
					url : "/badLoan/roleController/addRole",
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
									roleId : $("#proId").val(),
									roleName : $("#proName").val(),
									roleComment : $("#proPrice").val(),

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
			url : '/badLoan/roleController/queryRole',
			// data:data,
			fitColumns : true,//自动适应网格宽度
			striped : true,//显示斑马线
			idField : "roleId",//设置productid为主键
			fit : true,//
			rownumbers : true,
			singleSelect : false,
			pagination : true,
			pageSize : 5,
			pageList : [ 5, 10, 20 ],
			toolbar : "#toolbar",
			
			columns : [ [ {
				field : 'roleId',
				title : '编号',
				width : 200
			} ,{
				field : 'roleName',
				title : '名称',
				width : 200,
			}, {
				field : 'roleComment',
				title : '说明',
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