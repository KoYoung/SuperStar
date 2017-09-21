<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
.easyui-textbox {
	width: 240px;
}

tr td {
	padding-bottom: 10px;
	font-size: 15px;
}

td {
	margin-left: 10px;
	font-size: 15px;
}

.form-control {
	width: 130px;
}

#one, #top, #cen {
	/* border:1px solid red; */
	width: 30%;
}

#one0, #top0 {
	width: 50%;
}

#chuli, #huishou {
	margin-top: 10px;
}

#ti1, #ti2 {
	font-size: 20px;
	font-family: 新宋体;
	color: red;
	line-height: 40px;
	margin-left: 200px;
}

#ti3 {
	line-height: 80px;
}

#tan {
	margin-top: 60px;
	margin-left: 20px;
	font-size: 20px;
	font-family: 新宋体;
}

#btn {
	text-align: center;
}
</style>
</head>
<body>
	<div id="toobar">
		<a id="xiangBtn" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'">贷款详情</a> <input
			class="easyui-textbox" id="select" type="text"
			Style="height: 25px; width: 180px" prompt='请输入贷款编号和贷款人姓名' /> <a
			id="btn" href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a>
	</div>
	<table id="dg"></table>
	<div id="aa">
		<div style="padding: 0 60px 20px 60px">
			<h1>贷款详情信息</h1>
			<form id="form" method="post">
				<table id="t_body">
					<tr>
						<td id="one0">
							<table cellpadding="5" id="tab1">
								<tr>
									<td>贷款编号:</td>
									<td><span id="loaninfoId"></span></td>
								</tr>

								<tr>
									<td>贷款人姓名:</td>
									<td><span id="borName"></span></td>
								</tr>
								<tr>
									<td>贷款银行:</td>
									<td><span id="bankinfoName"></span></td>
								</tr>
								<tr>
									<td>贷款种类:</td>
									<td><span id="loantypeName"></span></td>
								</tr>
								<tr>
									<td>经手人:</td>
									<td><span id="empName"></span></td>
								</tr>
							</table>
						</td>
						<td id="top0">
							<table cellpadding="5" id="tab2">
								<tr>
									<td>贷款金额:</td>
									<td><span id="loanNumber"></span>元</td>
								</tr>
								<tr>
									<td>贷款日期:</td>
									<td><span id="loanDate"></span></td>
								</tr>
								<tr>
									<td>还款日期:</td>
									<td><span id="loanRepaymentDate"></span></td>
								</tr>
								<tr>
									<td>核销金额:</td>
									<td><span id="unrepayNumber"></span>元</td>
								</tr>
								<tr>
									<td>申请核销原因:</td>
									<td><span id="lmrComment"></span></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<div id="ti1" style="">贷款处理记录</div>
				<table id="chuli"></table>
				<div id="ti2">贷款回收记录</div>
				<table id="huishou"></table>
				<div id="tan">

					意见：<input class="easyui-textbox" id="opinion"
						data-options="required:true" style="height: 60px; width: 550px;" />
				</div>
			</form>
		</div>
		<div id="ff"></div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('#dg').datagrid({
		url : '/badLoan/WriteoffManage/findWriteoffManage',
		striped : true, //斑马线 
		nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
		pagination : true, //底部分页
		singleSelect : true,
		pageSize : 10,
		pageNumber : 1,
		pageList : [ 5, 10, 15, 20 ],
		rownumbers : true, //如果为true，则显示一个行号列
		/* onLoadSuccess : function(data) {
			$("a[name='yes']").linkbutton({
				text : '同意核销',
				plain : true,
				iconCls : 'icon-ok'
			});
			$("a[name='no']").linkbutton({
				text : '驳回核销',
				plain : true,
				iconCls : 'icon-cancel'
			});
			$(".noBtn").click(function() {
				$("#ff").dialog("open");
			});
			$(".yesBtn").click(function() {
				$("#ff").dialog("open");
			});
		}, */
		columns : [ [ {
			field : 'loaninfoId',
			title : '贷款编号',
			width : 100
		}, {
			field : 'borId',
			title : '贷款人编号',
			width : 100,
			hidden : true
		}, {
			field : 'borName',
			title : '贷款人姓名',
			width : 100
		}, {
			field : 'bankinfoName',
			title : '贷款银行',
			width : 100
		}, {
			field : 'empId',
			title : '经手人编号',
			width : 100,
			hidden : true
		}, {
			field : 'empName',
			title : '经手人',
			width : 100
		}, {
			field : 'loantypeName',
			title : '贷款种类',
			width : 100
		}, {
			field : 'loanNumber',
			title : '贷款金额(元)',
			width : 100
		}, {
			field : 'unrepayNumber',
			title : '未还贷款金额(元)',
			width : 100
		}/* , {
					field : 'loanDate',
					title : '贷款日期',
					width : 150
				}, {
					field : 'loanRepaymentDate',
					title : '还款日期',
					width : 150
				} */, {
			field : 'loanstateName',
			title : '贷款状态',
			width : 100
		}, {
			field : 'loaninfoType',
			title : '贷款类型',
			width : 100,
			formatter : function(value) {
				if (value == 0) {
					return "个人贷款";
				} else {
					return "企业贷款";
				}
			}
		}
		/* {
			field : 'operate1',
			title : '操作',
			align : 'center',
			width : $(this).width() * 0.1,
			formatter : function(value, row, index) {
				var str = '<a href="#" name="yes" class="easyui-linkbutton yesBtn"></a>';
				return str;
			}
		},
		{
			field : 'operate2',
			title : '操作',
			align : 'center',
			width : $(this).width() * 0.1,
			formatter : function(value, row, index) {
				var str = '<a href="#" name="no" class="easyui-linkbutton noBtn"></a>';
				return str;
			}
		} */] ]

	});
	//点击详情按钮弹出模态框
	$('#aa')
			.dialog(
					{
						title : '贷款详情',
						closed : true,
						buttons : [
								{
									iconCls : 'icon-ok',
									text : '通过',
									handler : function() {
										var row = $('#dg').datagrid(
												'getSelected');
										var data = {};
										data["loaninfoId"] = row.loaninfoId;
										data["borId"] = row.borId;
										data["empId"] = row.empId;
										data["witeoffMoney"] = row.unrepayNumber;
										data["opinion"] = $("#opinion").val();
										$
												.ajax({
													url : '/badLoan/WriteoffManage/addWriteoffManage',
													type : 'post',
													contentType : "application/json;charset=utf-8",
													data : JSON.stringify(data),
													success : function(data) {
														alert(data);
														window.location.href = "/badLoan/jsp/writeOffManage.jsp";
													}
												});
									}
								},
								{
									iconCls : 'icon-cancel',
									text : '驳回',
									handler : function() {
										var row = $('#dg').datagrid(
												'getSelected');
										var data = {};
										data["loaninfoId"] = row.loaninfoId;
										data["empId"] = row.empId;
										data["lmrComment"] = $("#opinion")
												.val();
										$
												.ajax({
													url : '/badLoan/lmrController/addLoanMRBo',
													type : 'post',
													contentType : "application/json;charset=utf-8",
													data : JSON.stringify(data),
													success : function(data) {
														alert(data);
														window.location.href = "/badLoan/jsp/writeOffManage.jsp";
													}
												});
										$('#aa').dialog('close');
									}
								} ]
					});
	});
	$("#xiangBtn")
			.click(
					function() {
						var row = $('#dg').datagrid('getSelected');
						if (row != null) {
							$('#aa').dialog({
								height:"600",
								title : '贷款详情',
								top : '4%',
								closed : false,
								cache : false,
								modal : true
							});
							$("#loaninfoId").html(row.loaninfoId);
							$("#borName").html(row.borName);
							$("#bankinfoName").html(row.bankinfoName);
							$("#loantypeName").html(row.loantypeName);
							$("#empName").html(row.empName);
							$("#loanNumber").html(row.loanNumber);
							$("#loanDate").html(row.loanDate);
							$("#loanRepaymentDate").html(row.loanRepaymentDate);
							$("#lmrComment").html(row.lmrComment);
							$("#unrepayNumber").html(row.unrepayNumber);
							$(function(){
							$('#chuli')
									.datagrid(
											{
												url : '/badLoan/lmrController/findlmr?loaninfoId='
														+ row.loaninfoId,
												striped : true, //斑马线 
												nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
												rownumbers : true, //如果为true，则显示一个行号列
												columns : [ [ {
													field : 'loaninfoId',
													title : '贷款编号',
													width : 100
												}, {
													field : 'empName',
													title : '经手人',
													width : 100
												}, {
													field : 'lmrDate',
													title : '处理日期',
													width : 100
												}, {
													field : 'lmrComment',
													title : '处理说明',
													width : 200
												}, {
													field : 'loanstateName',
													title : '贷款状态',
													width : 100
												} ] ],
											});
							$("#huishou")
									.datagrid(
											{
												url : '/badLoan/WriteoffManage/findReayment?loaninfoId='
														+ row.loaninfoId,
												striped : true, //斑马线 
												nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
												//resizeHandle : 'right',
												rownumbers : true, //如果为true，则显示一个行号列
												columns : [ [ {
													field : 'empName',
													title : '经手人',
													width : 80
												}, {
													field : 'repayDate',
													title : '回收日期',
													width : 100
												}, {
													field : 'repayType',
													title : '回收类型',
													align : 'center',
													width : 100
												}, {
													field : 'repayComment',
													title : '回收说明',
													width : 200

												}, {
													field : 'repayNumber',
													title : '回收金额(元)',
													width : 100
												} ] ],
											});
							});
							$('#ff').dialog({
								title : '审核意见',
								closed : true,
								cache : false,
								modal : true,
								buttons : [ {
									iconCls : 'icon-save',
									text : '保存',
									handler : function() {

									}
								}, {
									text : '关闭',
									iconCls : 'icon-close',
									handler : function() {
										$('#ff').dialog('close');
									}
								} ]
							});
						} else {
							alert("请选中一行！");
						}
					});
	//根据贷款编号和贷款人进行模糊查询
	$("#btn").click(function() {
		var value = $("#select").val();
		$('#dg').datagrid({

			url : '/badLoan/WriteoffManage/findWriteM?loaninfoId=' + value,
			striped : true, //斑马线 
			nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
			pagination : true, //底部分页
			singleSelect : true,
			pageSize : 10,
			pageNumber : 1,
			pageList : [ 5, 10, 15, 20 ],
			rownumbers : true, //如果为true，则显示一个行号列
			columns : [ [ {
				field : 'loaninfoId',
				title : '贷款编号',
				width : 100
			}, {
				field : 'borId',
				title : '贷款人编号',
				width : 100,
				hidden : true
			}, {
				field : 'borName',
				title : '贷款人姓名',
				width : 100
			}, {
				field : 'bankinfoName',
				title : '贷款银行',
				width : 100
			}, {
				field : 'empId',
				title : '经手人编号',
				width : 100,
				hidden : true
			}, {
				field : 'empName',
				title : '经手人',
				width : 100
			}, {
				field : 'loantypeName',
				title : '贷款种类',
				width : 100
			}, {
				field : 'loanNumber',
				title : '贷款金额(元)',
				width : 100
			}, {
				field : 'unrepayNumber',
				title : '未还贷款金额(元)',
				width : 100
			}, {
				field : 'loanDate',
				title : '贷款日期',
				width : 150
			}, {
				field : 'loanRepaymentDate',
				title : '还款日期',
				width : 150
			}, {
				field : 'loanstateName',
				title : '贷款状态',
				width : 100
			}, {
				field : 'loaninfoType',
				title : '贷款类型',
				width : 100,
				formatter : function(value) {
					if (value == 0) {
						return "个人贷款";
					} else {
						return "企业贷款";
					}
				}
			} ] ],
		})
	});
</script>
</html>
