<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../easyui/themes/default/easyui.css"
	type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/demo.css" type="text/css"></link>
<script type="text/javascript" src="../easyui/jquery.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>

<script src="../js/highcharts.js"></script>
<script src="../js/highcharts-more.js"></script>
<script src="../js/exporting.js"></script>
<style>
	#gridOrRadar{
		float:left;
		width:100px;
		height:30px;
	}
	#findRadar{
		position:absolute;
		left:0;
		top:0;
		float:left;
	}
	#container{
		position:absolute;
		left:50%;
		top:0;
		margin-left:30px;
		min-width: 45%;
		max-width: 50%;
		height: 400px;
	}
</style>
</head>
<body>
<div id="offbar">
	<input id="gridOrRadar" class="easyui-switchbutton" checked style=""></div>
	<table id="findRadar"></table>
	<div id="container"></div>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$('#gridOrRadar').switchbutton({  
	        checked: false,  
	        onChange: function(checked){  
		            if (checked == true){
		            	$("#container").show();
		            }else if (checked == false){
		            	$("#container").hide();
		            }
	            }
	    });
		$.ajax({
			url : "/badLoan/find/findRadar",
			success : function(data) {
				radar(data);
				grid(data);
				$("#container").hide();
			},
			error : function() {
				$.messager.alert("error");
			}
		});
		function radar(data) {
			$('#container').highcharts({
				chart : {
					polar : true,
					type : 'line'
				},
				title : {
					text : '银行不良贷款',
					x : -80
				},
				pane : {
					size : '60%'
				},
				xAxis : {
					categories : data.bankNameList,
					tickmarkPlacement : 'on',
					lineWidth : 0
				},
				yAxis : {
					gridLineInterpolation : 'polygon',
					lineWidth : 0,
					min : 0
				},
				tooltip : {
					shared : true,
					pointFormat : '<span style="color:{series.color}">{series.name}:<b>{point.y}元</b><br/>',
					style : {
						padding : 0,
						fontSize : "15px"
					}
				},
				legend : {
					align : 'right',
					verticalAlign : 'top',
					y : 50,
					layout : 'vertical'
				},
				series : [ {
					name : '个人贷款',
					data : data.borMoneyList,
					pointPlacement : 'on'
				}, {
					name : '企业贷款',
					data : data.comMoneyList,
					pointPlacement : 'on'
				}, {
					name : '贷款总和',
					data : data.sumMoneyList,
					pointPlacement : 'on'
				} ]
			});
		}
		function grid(data) {
			var haha = [];
			for (var i = 0; i < data.bankNameList.length; i++) {
				var str = {
					"bankName" : data.bankNameList[i],
					"borMoney" : data.borMoneyList[i],
					"comMoney" : data.comMoneyList[i],
					"sumMoney" : data.sumMoneyList[i]
				};
				haha[i] = str;
			}
			$('#findRadar').datagrid({
				data : haha,
				width:'50%',
				rownumbers : true, //显示行号
				pagination : true, //显示分页
				singleSelect : true,
				pageSize : 10, //默认显示多少行
				pageList : [ 5, 10, 15, 20 ],//行号下拉列表
				fitColumns : true,
				columns : [ [ {
					field : 'bankName',
					title : '银行名称',
					width : 60
				}, {
					field : 'borMoney',
					title : '个人贷款',
					width : 60
				}, {
					field : 'comMoney',
					title : '企业贷款',
					width : 60
				}, {
					field : 'sumMoney',
					title : '贷款总和',
					width : 60
				} ] ],
				toolbar:"#offbar"
			});
		}
	});
</script>