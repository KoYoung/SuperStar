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
<link rel="stylesheet" href="../easyui/themes/metro-gray/easyui.css"
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
.aa{
	background:url("2.gif") no-repeat;
	background-size : cover;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'',split:false"
		style="height: 'auto';">
		<h4 style="float: left;">银&nbsp;行&nbsp;不&nbsp;良&nbsp;贷&nbsp;款&nbsp;信&nbsp;息&nbsp;管&nbsp;理&nbsp;系&nbsp;统</h4>
		<div style="width: 240px; float: right;">
			欢迎,<span id="userName"></span>! &nbsp;&nbsp;&nbsp; <a
				href="/badLoan/user/userLogout">注销</a><br> 现在的时间是:<span
				id="date"></span>
		</div>
	</div>
	<div data-options="region:'west',title:'系统菜单',collapsible:true"
		style="width: 13%;">
		<a id="openBtn" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'" style="width: 100%">展开</a>
		<ul id="homeTree"></ul>
	</div>
	<div data-options="region:'center',title:''">
		<div id="tabsInfo" class="easyui-tabs" data-options="fit:true">
			<div title="主页" id="zhuye" class="aa">
			
				<div id="d1"><table id="dg1"></table></div>
				<script type="text/javascript">
					function a1(title){
						$("#d1").dialog({
							title : title,
							width : 400,
							height : 500,
							closed : true,
							cache : false,
							modal : true
						});
					}
				</script>
				<div id="container1" class="pict"></div>
				<script type="text/javascript">
						$.ajax({
							url : "/badLoan/find/findBankBorColumn",
							type : "post",
							dataType : "json",
							success : function(data){
								Highcharts.chart('container1', {
								    chart: {
								        type: 'column'
								    },
								    title: {
								        text: '各银行个人不良贷款总额记录统计图'
								    },
								    credits : {
								    	enabled : false
								    },
								    xAxis: {
								    	type : "category",
								        crosshair: true
								    },
								    yAxis: {
								        min: 0,
								        title: {
								            text: '不良贷款金额 (元)'
								        }
								    },
								    legend: {
							            enabled: false
							        },
							        plotOptions: {
							            series: {
							            	cursor : "pointer",
							            	point : {
							            		events : {
							            			click : function(){
								            			//alert(this.name);
								            			var name = this.name;
								            			//alert(name);
								            			$.ajax({
								            				url : "/badLoan/find/findBankBor",
								            				type : "post",
								            				data : name,
								            				success : function(data){
								            					//alert(data[0].BANKINFO_NAME);
								            					var title = data[0].BANKINFO_NAME + "个人不良贷款金额统计情况";
								            					a1(title);
								            					$("#dg1").datagrid({
								            						data : data,
								            						singleSelect:true,
								            						rownumbers:true,
								            						striped:true,
								            						loadMsg:"努力加载中......",
								            						columns : [[
								            							{field:'LOAN_REPAYMENT_DATE',title:'日期',width:100},
								            							{field:'BANKINFO_NAME',title:'银行',width:100},
								            							{field:'UNREPAY_NUMBER',title:'未还金额',width:100}
								            						]]
								            					});
								            					$("#d1").dialog("open");
								            					
								            					
								            				}
								            			});
								            		}
							            		}
							            	},
							                borderWidth: 0,
							                dataLabels: {
							                    enabled: true,
							                    format: '{point.y}'
							                },
							            }
							        },
							        tooltip: {
							            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
							            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b><br/>'
							        },
								    series: data
								});
							}
						});
					</script>
				
				
				
				<div id="d2"><table id="dg2"></table></div>
				<script type="text/javascript">
					function a2(title){
						$("#d2").dialog({
							title : title,
							width : 400,
							height : 500,
							closed : true,
							cache : false,
							modal : true
						});
					}
				</script>
				<div id="container2" class="pict"></div>
				<script type="text/javascript">
						$.ajax({
							url : "/badLoan/find/findBankComColumn",
							type : "post",
							dataType : "json",
							success : function(data){
								Highcharts.chart('container2', {
								    chart: {
								        type: 'column'
								    },
								    title: {
								        text: '各银行企业不良贷款总额记录统计图'
								    },
								    credits : {
								    	enabled : false
								    },
								    xAxis: {
								    	type : "category",
								        crosshair: true
								    },
								    yAxis: {
								        min: 0,
								        title: {
								            text: '不良贷款金额 (元)'
								        }
								    },
								    legend: {
							            enabled: false
							        },
							        plotOptions: {
							            series: {
							            	cursor : "pointer",
							            	point : {
							            		events : {
							            			click : function(){
								            			//alert(this.name);
								            			var name = this.name;
								            			//alert(name);
								            			$.ajax({
								            				url : "/badLoan/find/findBankCom",
								            				type : "post",
								            				data : name,
								            				success : function(data){
								            					//alert(data[0].BANKINFO_NAME);
								            					var title = data[0].BANKINFO_NAME + "企业不良贷款金额统计情况";
								            					a2(title);
								            					$("#dg2").datagrid({
								            						data : data,
								            						singleSelect:true,
								            						rownumbers:true,
								            						striped:true,
								            						loadMsg:"努力加载中......",
								            						columns : [[
								            							{field:'LOAN_REPAYMENT_DATE',title:'日期',width:100},
								            							{field:'BANKINFO_NAME',title:'银行',width:100},
								            							{field:'UNREPAY_NUMBER',title:'未还金额',width:100}
								            						]]
								            					});
								            					$("#d2").dialog("open");
								            					
								            					
								            				}
								            			});
								            		}
							            		}
							            	},
							                borderWidth: 0,
							                dataLabels: {
							                    enabled: true,
							                    format: '{point.y}'
							                },
							            }
							        },
							        tooltip: {
							            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
							            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b><br/>'
							        },
								    series: data
								});
							}
						});
					</script>
					
					
					
				<div id="d3"><table id="dg3"></table></div>
				<script type="text/javascript">
					function a3(title){
						$("#d3").dialog({
							title : title,
							width : 400,
							height : 500,
							closed : true,
							cache : false,
							modal : true
						});
					}
				</script>
				<div id="container3" class="pict"></div>
				<script type="text/javascript">
						$.ajax({
							url : "/badLoan/find/findBankBorPie",
							type : "post",
							dataType : "json",
							success : function(data){
								Highcharts.chart('container3', {
								    chart: {
								        plotBackgroundColor: null,
								        plotBorderWidth: null,
								        plotShadow: false,
								        type: 'pie'
								    },
								    title: {
								        text: '各银行中个人不良贷款所占总贷款金额比例统计图'
								    },
									credits: {
										enabled: false
									},
									exporting:{
										enabled : true
									},
								    tooltip: {
								        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
								    },
								    plotOptions: {
								    	series : {
								    		point : {
							                	events : {
							                		click : function(){
								                		//alert(this.name);
								                		var name = this.name;
								                		$.ajax({
								            				url : "/badLoan/find/findBankBor",
								            				type : "post",
								            				data : name,
								            				success : function(data){
								            					//alert(data[0].BANKINFO_NAME);
								            					var title = data[0].BANKINFO_NAME + "企业不良贷款金额统计情况";
								            					a3(title);
								            					$("#dg3").datagrid({
								            						data : data,
								            						singleSelect:true,
								            						rownumbers:true,
								            						striped:true,
								            						loadMsg:"努力加载中......",
								            						columns : [[
								            							{field:'LOAN_REPAYMENT_DATE',title:'日期',width:100},
								            							{field:'BANKINFO_NAME',title:'银行',width:100},
								            							{field:'UNREPAY_NUMBER',title:'未还金额',width:100}
								            						]]
								            					});
								            					$("#d3").dialog("open");
								            				}
								            			});
								                	}
							                	}
							                }
								    	},
								        pie: {
								            allowPointSelect: true,
								            cursor: 'pointer',
								            dataLabels: {
								                enabled: true,
								                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
								                style: {
								                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
								                },
								            }
								        }
								    },
								    series: data
								});
							}
						});
					</script>
				
				
				
				<div id="d4"><table id="dg4"></table></div>
				<script type="text/javascript">
					function a4(title){
						$("#d4").dialog({
							title : title,
							width : 400,
							height : 500,
							closed : true,
							cache : false,
							modal : true
						});
					}
				</script>
				<div id="container4" class="pict"></div>
				<script type="text/javascript">
					$.ajax({
						url : "/badLoan/find/findBankComPie",
						type : "post",
						dataType : "json",
						success : function(data){
							Highcharts.chart('container4', {
							    chart: {
							        plotBackgroundColor: null,
							        plotBorderWidth: null,
							        plotShadow: false,
							        type: 'pie'
							    },
							    title: {
							        text: '各银行中企业不良贷款所占总贷款金额比例统计图'
							    },
								credits: {
									enabled: false
								},
								exporting:{
									enabled : true
								},
							    tooltip: {
							        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
							    },
							    plotOptions: {
							    	series : {
							    		point : {
						                	events : {
						                		click : function(){
							                		//alert(this.name);
							                		var name = this.name;
							                		$.ajax({
							            				url : "/badLoan/find/findBankCom",
							            				type : "post",
							            				data : name,
							            				success : function(data){
							            					//alert(data[0].BANKINFO_NAME);
							            					var title = data[0].BANKINFO_NAME + "企业不良贷款金额统计情况";
							            					a4(title);
							            					$("#dg4").datagrid({
							            						data : data,
							            						singleSelect:true,
							            						rownumbers:true,
							            						striped:true,
							            						loadMsg:"努力加载中......",
							            						columns : [[
							            							{field:'LOAN_REPAYMENT_DATE',title:'日期',width:100},
							            							{field:'BANKINFO_NAME',title:'银行',width:100},
							            							{field:'UNREPAY_NUMBER',title:'未还金额',width:100}
							            						]]
							            					});
							            					$("#d4").dialog("open");
							            					
							            				}
							            			});
							                	}
						                	}
						                }
							    	},
							        pie: {
							            allowPointSelect: true,
							            cursor: 'pointer',
							            dataLabels: {
							                enabled: true,
							                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
							                style: {
							                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
							                }
							            }
							        }
							    },
							    series: data
							});
							aa();
						}
					});
					function aa(){
						$("#zhuye").removeClass("aa");
					}
				</script>
			</div>
			
		</div>
	</div>
</body>
<script type="text/javascript">

	var flag = 0;
	$("#openBtn").click(function() {
		//console.log($("#homeTree").tree("expandAll"));
		if (flag != 1) {
			$("#homeTree").tree("expandAll");
			$("#openBtn").linkbutton({
				iconCls : 'icon-remove',
				text : '关闭'
			});
		} else {
			$("#homeTree").tree("collapseAll");
			$("#openBtn").linkbutton({
				iconCls : 'icon-add',
				text : '展开'
			});
			flag =0;
		}
	});
	$.ajax({
		url : "/badLoan/user/getUserSession",
		success : function(data) {
			if (data == "error") {
				$.messager.alert('系统提示', '请重新登录', 'info');
				window.location.href = "/badLoan/jsp/login.jsp";
			} else {
				var data = JSON.parse(data);
				//console.log(data.USER_NAME);
				$("#userName").html(data.USER_NAME);
				$("#homeTree").tree(
						{
							url : "/badLoan/right/getUserRightList",
							animate : true,
							lines : true,
							queryParams : {
								data : data.USER_ID
							},
							onClick : function(node) {
								var children = $("#homeTree").tree(
										"getChildren", node.target);
								if (children.length == 0) {
									addTab(node.text, node.attributes.url);
								}
							},
							onLoadSuccess : function() {
								$("#homeTree").tree("collapseAll");
							},
							onExpand : function() {
								flag = 1;
								$("#openBtn").linkbutton({
									iconCls : 'icon-remove',
									text : '关闭'
								});
							}
						});
			}
		}
	});

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