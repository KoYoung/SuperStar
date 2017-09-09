<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.easyui-textbox {
	width: 240px;
}

tr td {
	padding-bottom: 15px;
}

td {
	margin-left: 10px;
}
.form-control{
	width:130px;
}
#one, #top, #cen {
	/* border:1px solid red; */
	width: 30%;
}
#one0,#top0{
	width:50%;
}
#tab2 {
	margin-left: 30px;
	/* margin-top:-35px; */
}
#chuli,#huishou{
	margin-top:20px;
}

</style>
</head>
<body>
	<div id="toobar">
		<a id="xiangBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'">详情</a>
		<a id="yesBtn" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-ok'">同意核销</a> 
		<a id="noBtn" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'">驳回核销</a>
	</div>
	<table id="dg"></table>
	<div id="aa">
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
							<td><span id="loanNumber"></span>万元</td>
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
							<td><span id="unrepayNumber"></span>万元</td>
						</tr>
						<tr>
							<td>申请核销原因:</td>
							<td><span id="lmrComment"></span></td>
						</tr>
						
					</table>
				</td>
			</tr>
		</table>
		<div style="font-size:20px;font-family:新宋体;color:red">贷款处理记录</div>
		<table id="chuli"></table>
		<div style="font-size:20px;font-family:新宋体;color:red">贷款回收记录</div>
		<table id="huishou"></table>					
	</div>
	
</body>
<script type="text/javascript">
	$('#dg').datagrid({
			url : '/badLoan/WriteoffManage/findWriteoffManage',
			striped : true, //斑马线 
			nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
			pagination : true, //底部分页
			singleSelect : true,
			pageSize:10,
			pageNumber:1,
			pageList:[5,10,15,20],
			rownumbers : true, //如果为true，则显示一个行号列
			onLoadSuccess:function(data){    
	            $("a[name='opera']").linkbutton({text:'下订单',plain:true,iconCls:'icon-add'}); 
	   	 	},
			columns : [ [ {
				field : 'loaninfoId',
				title : '贷款编号',
				width : 100
			},{
				field : 'borName',
				title : '贷款人姓名',
				width : 100
			}, {
				field : 'bankinfoName',
				title : '贷款银行',
				width : 100
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
				title : '贷款金额(万元)',
				width : 100
			}, {
				field : 'loanDate',
				title : '贷款日期',
				width : 150
			},{
				field : 'loanRepaymentDate',
				title : '还款日期',
				width : 150
			},{
				field : 'loanRepaymentDate',
				title : '还款日期',
				width : 150
			},{
				field : 'loanstateName',
				title : '贷款状态',
				width : 100
			},{
				field : 'loaninfoType',
				title : '贷款类型',
				width : 100,
				formatter:function(value){
				    if(value=0){
				        return "个人贷款";
				    }else{
				        return "企业贷款";
				    }
				}
			}]]
		});
	//点击详情按钮弹出模态框
	$('#aa').dialog({    
    		    title: '贷款详情',    
    		    closed: true,
    		    top:'10%',
    		    width: '60%',    
    		    height: 500,
    });
	 $("#xiangBtn").click(function () {
        var row = $('#dg').datagrid('getSelected');
        if (row!=null) {
            $('#aa').dialog({    
    		    title: '贷款详情', 
    		    top:'10%',
    		    width: '60%',    
    		    height: 500,    
    		    closed: false,    
    		    cache: false,    
    		    modal: true   
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
            $('#chuli').datagrid({
    			url : '/badLoan/lmrController/findlmr?loaninfoId='+row.loaninfoId,
    			striped : true, //斑马线 
    			nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
    			width : 582,
    			resizeHandle : 'right',
    			rownumbers : true, //如果为true，则显示一个行号列
    			columns : [ [ {
    				field : 'loaninfoId',
    				title : '贷款编号',
    				width : 100
    			},{
    				field : 'empName',
    				title : '经手人',
    				width : 100
    			},{
    				field : 'lmrDate',
    				title : '处理日期',
    				width : 100
    			},{
    				field : 'lmrComment',
    				title : '处理说明',
    				width : 150
    			},{
    				field : 'loanstateName',
    				title : '贷款状态',
    				width : 100,
    			}]],
    		});
            $("#huishou").datagrid({
            	url : '/badLoan/WriteoffManage/findReayment?loaninfoId='+row.loaninfoId,
    			striped : true, //斑马线 
    			nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
    			width : 682,
    			resizeHandle : 'right',
    			rownumbers : true, //如果为true，则显示一个行号列
    			columns : [ [ {
    				field : 'loaninfoId',
    				title : '贷款编号',
    				width : 100
    			},{
    				field : 'empName',
    				title : '经手人',
    				width : 100
    			},{
    				field : 'repayDate',
    				title : '回收日期',
    				width : 100
    			},{
    				field : 'repayType',
    				title : '回收类型',
    				width : 150
    			},{
    				field : 'repayComment',
    				title : '回收说明',
    				width : 100,
    				
    			},{
    				field : 'repayNumber',
    				title : '回收金额',
    				width : 100,
    			}]],	
            });
        }  else {
           alert("请选中一行！");
        } 
    });
	//点击添加按钮弹出模态框
	$("#yesBtn").click(function(){
		$('#dd').dialog("open");
	});
		$('#dd').dialog({    
		    title: '添加客户信息', 
		    iconCls:'icon-add',
		    closed: true
		});
</script>
</html>