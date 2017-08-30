<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="easyUI/jquery.min.js"></script>
<script src="easyUI/jquery.easyui.min.js"></script>
<script src="easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="themes/bootstrap/easyui.css"
	type="text/css"></link>
<link rel="stylesheet" href="css/icon.css" type="text/css"></link>
</head>
<body>
	<div id="cc" class="easyui-layout" style="width: 100%; height: 100%;">
		<div data-options="region:'north',title:'',split:true"
			style="height: 100px; text-align: center; font-size: 30px; line-height: 90px;">
			<span>银行不良贷款系统</span>
		</div>
		<div data-options="region:'south',title:'',split:true"
			style="height: 40px; text-align: center; font-size: 15px; line-height: 30px;">我做的</div>
		<div data-options="region:'west',title:'West',split:true"
			style="width: 200px;">
			<ul id="myTree"></ul>
		</div>
		<div data-options="region:'center',title:''" style="background: #eee;">
			<div id="tabsInfo" class="easyui-tabs" data-options="fit:true">
				<div title="主页">content</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
	$(function() {
		$('#myTree').tree({
			url : '',
			animate : true,
			lines : true,
			onClick : function(node) {
				var children = $("#myTree").tree("getChildren", node.target);
				console.info(children);
				if (children.length == 0)
					addTab(node.text, node.attributes.url);
			}
		});
		function addTab(title, url) {
			var tab = $("#tabsInfo").tabs("getTab", title);
			if (tab) {
				$("#tabsInfo").tabs("select", title);
			} else {
				$("#tabsInfo").tabs(
						"add",
						{
							title : title,
							content : "<iframe src='" + url
									+ "' width='99%' height='99%'/>",
							closable : true,
							tools : [ {
								iconCls : 'icon-mini-refresh',
								handler : function() {
									alert("refresh");
								}
							} ]
						});
			}
		}
	});
</script>