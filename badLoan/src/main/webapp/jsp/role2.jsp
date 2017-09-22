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
<body class="easyui-layout">
	<div data-options="region:'west',title:'',collapsible:true"
		style="width: 15%;">
		<a id="addRoleBtn">添加角色</a>
		<ul id="roleTree"></ul>
	</div>
	<div data-options="region:'center',title:''">
		<table id="rightDataGrid"></table>
		<div id="addRightDialog">
			<ul id="rightTree"></ul>
		</div>
	</div>
	<div id="addRoleDialog">
		<table>
			<tr>
				<td>角色名称：</td>
				<td><input type="text" id="roleName"></td>
			</tr>
			<tr>
				<td>角色说明：</td>
				<td><textarea id="roleComment"></textarea></td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#addRoleBtn").click(function(){
			$("#addRoleDialog").dialog("open");
		});
		$("#addRoleDialog").dialog({
			title : '添加角色',
			width : 300,
			height : 150,
			top:100,
			closed : true,
			model : true,
			buttons:[{
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					 var data = {
						 roleName : $("#roleName").val(),
						 roleComment : $("#roleComment").val()
					};
					$.ajax({
						url:"/badLoan/roleController/addRoleByAJAX",
						type : 'post',
						data : JSON.stringify(data),
						contentType:"application/JSON;charset=UTF-8",
						success : function(data) {
							$.messager.alert("", data,"");
							$("#roleTree").tree();
							$("#addRoleDialog").dialog("close");
						},
						error : function() {
							$.messager.alert("", "服务器忙，请稍候。。。","");
							$("#addRoleDialog").dialog("close");
						}
					});
				}
			},{
				text : '取消',
				iconCls : 'icon-remove',
				handler : function() {
					$("#addRoleDialog").dialog("close");
				}
			}
			]
		});
		function stopRoleBtn(){
			var rolecheck = $("#roleTree").tree("getSelected");
			var roleId = rolecheck.id;
			$.ajax({
				url:"/badLoan/roleController/stopRole",
				type : 'post',
				data : roleId,
				success : function(data) {
					$.messager.alert("", data,"");
					$("#roleTree").tree();
					$("#addRightDialog").dialog("close");
				},
				error : function() {
					$.messager.alert("", "服务器忙，请稍候。。。","");
					$("#addRightDialog").dialog("close");
				}
			});
		}
		$('#addRoleBtn').linkbutton({    
		    iconCls: 'icon-add'   
		});  
		$('#remRoleBtn').linkbutton({    
		    iconCls: 'icon-remove'   
		});
		$('#stopRoleBtn').linkbutton({    
		    iconCls: 'icon-no'   
		});
		$("#addRightDialog").dialog({
			width : 500,
			height : 300,
			title:"修改权限",
			closeable : true,
			closed : true,
			buttons : [  {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var checkeds = $("#rightTree").tree("getChecked");
					var identerCheck = $("#rightTree").tree("getChecked","indeterminate");
					var rolecheck = $("#roleTree").tree("getSelected");
					
					var rightids = ""; 
					for(var i=0;i<checkeds.length;i++){
						rightids+=checkeds[i].id+",";
					}
					for(var i=0;i<identerCheck.length;i++){
						rightids+=identerCheck[i].id+",";
					}
					var data = {
							roleId : rolecheck.id+"",
							rightIds :rightids
					}
					$.ajax({
						url:"/badLoan/roleController/updateRoleRightById",
						type : 'post',
						data : JSON.stringify(data),
						contentType:"application/JSON;charset=UTF-8",
						success : function(data) {
							$.messager.alert("",data,"");
							$('#rightDataGrid').datagrid();
							$("#addRightDialog").dialog("close");
						},
						error : function() {
							$.messager.alert("", "服务器忙，请稍候。。。","");
							$("#addRightDialog").dialog("close");
						}
					});
				}
			},{
				text : '取消',
				iconCls : 'icon-save',
				handler : function() {
					$("#addRightDialog").dialog("close");
				}
			}]
		});
		$("#roleTree").tree({
			url : '/badLoan/roleController/queryRole',
			animate : true,
			lines : true,
			onClick : function(node) {
				var children = $("#roleTree").tree("getChildren", node.target);
				if (children.length == 0) {
					var roleId = node.id;
					$("#rightDataGrid").datagrid({
						url : "/badLoan/roleController/queryRightByRoleId",
						width : "auto",
						rownumbers : true, //显示行号
						pagination : true, //显示分页
						singleSelect : true,
						pageSize : 10, //默认显示多少行
						pageList : [ 5, 10, 15, 20 ],//行号下拉列表
						sortOrder : 'asc',//默认升序
						remoteSort : false,//不去服务器排序
						fitColumns : true,
						singleSelect : false,
						queryParams : {
							roleId : roleId,
						},
						columns : [ [ {
							field : 'RIGHT_ID',
							title : '权限编号',
							width : 100
						}, {
							field : 'RIGHT_NAME',
							title : '权限名称',
							width : 100
						}, {
							field : 'RIGHT_URL',
							title : '权限路径',
							width : 150
						}, {
							field : 'RIGHT_FLAG',
							title : '权限状态',
							width : 100
						}, {
							field : 'RIGHT_PARENT',
							title : '父节点',
							width : 100
						} ] ],
						toolbar : [ '-', {
							text : '删除权限',
							iconCls : 'icon-remove',
							handler : function() {
								var selections = $("#rightDataGrid").datagrid("getSelections");
								if(roleId==1){
									$.messager.alert('',"超级管理员权限不可删除",'');
								}else{
									if(selections.length==0){
										$.messager.alert('',"请选择需要删除的权限",'');
									}else{
										var str = "";
										$(selections).each(function(){
											str += this.RIGHT_ID+",";
										});
										var data = {
												roleId : roleId+"",
												rightIds :str
										};
										$.ajax({
											url:"/badLoan/roleController/deleteRoleRightById",
											type : 'post',
											data : JSON.stringify(data),
											contentType:"application/JSON;charset=UTF-8",
											success : function(data) {
												$.messager.alert('',data,'');
												$('#rightDataGrid').datagrid();
											},
											error : function() {
												$.messager.alert("", "服务器忙，请稍候。。。","");
											}
										});
									}
								}
							}
						}, '-', {
							text : '修改权限',
							iconCls : 'icon-add',
							handler : function() {
								if(roleId==1){
									$.messager.alert('',"超级管理员权限不可删改",'');
								}else{
									$("#addRightDialog").dialog("open");
									$("#rightTree").tree({
										url : '/badLoan/right/queryRight',
										animate : true,
										lines : true,
										checkbox:true,
										onLoadSuccess:function(){
											//var row = $("#rightDataGrid").datagrid("getRows");
									 		var roleChecked = $("#roleTree").tree("getSelected");
									 		$.ajax({
									 			url:"/badLoan/roleController/querySonRightByRoleId",
									 			type:"post",
									 			data:{
									 				roleId :roleChecked.id
									 			},
									 			success:function(data){
									 				for(var i=0;i<data.length;i++){
														var mm = $("#rightTree").tree("find" ,data[i].RIGHT_ID);
														if(mm!=null){
															$("#rightTree").tree("check",mm.target);
														}
													}
									 			}
									 		});
										}
									});
								}
							}
						},"-" ]
					});
				}
			}
		})
	});
</script>
</html>