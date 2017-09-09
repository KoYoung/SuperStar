<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/pepperGrinder/easyui.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
<script src="https://cdn.hcharts.cn/highcharts/5.0.10/highcharts.js"></script>
<script
	src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/exporting.js"></script>
<script src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/data.js"></script>
<script
	src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/drilldown.js"></script>
<style>
.pict {
	width: 45%;
	height: 200px;
	float: left;
	margin: 5px;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'',split:false"
		style="height: 10%;">
		<h3 align="center">银&nbsp;行&nbsp;不&nbsp;良&nbsp;贷&nbsp;款&nbsp;信&nbsp;息&nbsp;管&nbsp;理&nbsp;系&nbsp;统</h3>
		<div style="width: 250px; margin-left: 80%; padding-top: 10px;">
			欢迎,<%=session.getAttribute("username")%>!&nbsp;&nbsp;&nbsp; <a
				href="login.jsp">注销</a><br> 现在的时间是:<span id="date"></span>
		</div>
	</div>
	<div data-options="region:'west',title:'系统菜单',collapsible:false"
		style="width: 140px;">
		<ul id="homeTree"></ul>
	</div>
	<div data-options="region:'center',title:''" style="background: #eee;">
		<div id="tabsInfo" class="easyui-tabs" data-options="fit:true">
			<div title="主页">
				<div id="container1" class="pict"></div>
				<script src="../js/Basic column.js" type="text/javascript"></script>
				<div id="container2" class="pict"></div>
				<script src="../js/Pie chart.js" type="text/javascript"></script>
				<div id="container3" class="pict"></div>
				<script src="../js/Scatter plot.js" type="text/javascript"></script>
				<div id="container4" class="pict"></div>
				<script src="../js/With data labels.js" type="text/javascript"></script>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function showData() {
		var date = new Date();
		var str = "" + date.getFullYear() + "年";
		str += (date.getMonth() + 1) + "月";
		str += date.getDate() + "日";
		str += date.getHours() + "时";
		str += date.getMinutes() + "分";
		str += date.getSeconds() + "秒";
		$("#date").html(str);
	}
	setInterval("showData()", 1000);

	$(function() {
		$("#homeTree").tree({
			url : "../json/tree_data.json",
			animate : true,
			lines : true,
			onClick : function(node) {
				var children = $("#homeTree").tree("getChildren", node.target);
				if (children.length == 0) {
					addTab(node.text, node.attributes.url);
				}
			}
		});
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
						content : "<iframe src=" + url
								+ " width='99%' height='99%' frameborder=0>",
						closable : true
					});
		}
	}
</script>
</html>