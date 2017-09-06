<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			data-options="iconCls:'icon-save'">添加</a>
	</div>

	<div id="handlerDialog">
		<form id="myForm" method="post">
			<table width="100%" class="formtable">
				<tr>
					<th height="25">权限编号：</th>
					<td><input id="rightId" name="rightId"></td>
				</tr>
				<tr>
					<th height="25">权限名称：</th>
					<td><input id="rightName" name="rightName"></td>
				</tr>
				<tr>
					<th height="25">子节点：</th>
					<td><input id="rightUrl" name="rightUrl"></td>
				</tr>
				<tr>
					<th height="25">父节点：</th>
					<td><input id="rightParent" name="rightParent"></td>
				</tr>
				<tr>
					<th height="25">权限状态：</th>
					<td><input id="rightFlag" name="rightFlag"></td>
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
		title : '增加权限',
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
					url : "/badLoan/right/add",
					onSubmit : function() {
						var isValid = $(this).form('validate');
						return isValid;
					},
					success : function(data) {
							alert("添加成功！");
							$('#proDataGrid').datagrid('insertRow', {
								index : 0, // 索引从0开始
								row : {
									rightId : $("#rightId").val(),
									rightName : $("#rightName").val(),
									rightUrl : $("#rightUrl").val(),
									rightParent : $("#rightParent").val(),
									rightFlag : $("#rightFlag").val()
								}
							});
							$('#handlerDialog').dialog("close");

					}
				});
			}
		}, {
			text : '取消',
			handler : function() {
				$('#handlerDialog').dialog("close");
			}
		} ]
	});
	
	
	
	//-----------------------------
	$(function() {
		$('#proDataGrid').datagrid({
			url : '/badLoan/right/find',
			// data:data,
			fitColumns : true,//自动适应网格宽度
			striped : true,//显示斑马线
			idField : "rightId",//设置productid为主键
			fit : true,//
			rownumbers : true,
			singleSelect : false,
			pagination : true,
			pageSize : 5,
			pageList : [ 10, 20, 30 ],
			toolbar : "#toolbar",
			
			columns : [ [ {
				field : 'rightId',
				title : '权限编号',
				width : 100,
			} ,{
				field : 'rightName',
				title : '权限名称',
				width : 100,
			},{
				field : 'rightUrl',
				title : '子节点',
				width : 100,
			},{
				field : 'rightParent',
				title : '父节点',
				width : 100,
			},{
				field : 'rightFlag',
				title : '权限状态',
				width : 100,
			},{
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