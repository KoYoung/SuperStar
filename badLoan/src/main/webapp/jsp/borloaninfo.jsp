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
	width: 200px;
}

tr td {
	padding-bottom: 10px;
}

#tab2 {
	margin-left: 50px;
	
}

#tab3 {
	margin-left: 50px;
}
.form-control{
	width:200px;
	height:30px;
	border-radius:5px;
}
#loanDate,#loanRepaymentDate,#pledgeStartdate,#pledgeEnddate,#guaBirthday{
	width:150px;
	
}
#borName{
	width:200px;
	height:21px;
	border:1px solid #95B8E7;
	border-radius:5px;
}
.img-container{
            width: 293px;
            height: 150px;
            background:#F2F2F2;
            overflow: hidden;
            border: 1px solid #000;
        }
        .img-container>img{
            width: 293px;
            height: 150px;
        }
        .img{
            width: 293px;
            height: 150px;
        }
</style>
<body>
	<div>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
			 id="addBtn">个人贷款信息录入</a>
	</div>
	<table id="dg"></table>
	<div id="dd">
		<div style="padding: 0 25px 20px 25px">
			<h1>个人贷款信息录入</h1>
			<form id="ff" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td>
							<table cellpadding="5" id="tab1">
								<tr>
									<td><input type="hidden" value="0" id="loaninfoType" name="loaninfoType"/></td>
								</tr>
								<tr>
									<td>个人用户编号:</td>
									<td><input id="borId" name="borId" /></td>
								</tr>
								<tr>
									<td>个人用户姓名:</td>
									<td><input id="borName"/></td>
								</tr>
								<tr>
									<td>贷款银行:</td>
									<td><input id="bankInfoId" name="bankinfoId" /></td>
								</tr>
								<tr>
									<td>合同编号:</td>
									<td><input type="text" id="contractId" data-options="validType:'contractId'" name="contractId"/></td>
								</tr>
								<tr>
									<td>经手人:</td>
									<td><input id="empId" name="empId" /></td>
								</tr>
								<tr>
									<td>贷款种类:</td>
									<td><input id="loantypeId" name="loanType"/></td>
								</tr>
								<tr>
									<td>贷款金额:</td>
									<td><input type="text" id="loanNumber" name="loanNumber"></input>元</td>
								</tr>
								<tr>
									<td>贷款账号:</td>
									<td><input type="text" id="loanAccount" name="loanAccount" data-options="validType:'loanAccount'"  value="637800369963225989"></input></td>
								</tr>
								<tr>
									<td>贷款日期:</td>
									<td><input class="easyui-datebox"
										data-options="required:true,validType:'loanDate'" 
										id="loanDate" name="loanDate" style="width:200px"/></td>
								</tr>
								<tr>
									<td>还款日期:</td>
									<td><input class="easyui-datebox"
										data-options="required:true,validType:'loanRepaymentDate'"
										id="loanRepaymentDate" name="loanRepaymentDate" style="width:200px"/></td>
								</tr>
								<tr>
									<td>贷款利率:</td>
									<td><input type="text" id="loanRate" name="loanRate"
										data-options="required:true" value="4.9"/>%</td>
								</tr>
								<tr>
									<td>抵(质)押物品类型:</td>
									<td>
										<select id="pledgeType" name="pledgeType" class="easyui-combobox">   
									    <option value="不动产" selected="selected">不动产</option>   
									    <option value="动产">动产</option>   
									    <option value="权利">权利</option>   
									</select>  	
									</td>
								</tr>
								<tr>
									<td>抵(质)押物品名称:</td>
									<td><input class="easyui-textbox" id="pledgeName" name="pledgeName"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>抵（质）押物品价值:</td>
									<td><input type="text" id="pledgeValue" name="pledgeValue">万元</input></td>
								</tr>
								<tr>
									<td>抵（质）押物所属人:</td>
									<td><input class="easyui-textbox" id="pledgeOwner" name="pledgeOwner"
										data-options="required:true"></input></td>
								</tr>
							</table>
						</td>
						<td>
							<table cellpadding="5" id="tab2">
								<!-- <tr>
									<td>抵（质）押物品起始日期:</td>
									<td><input class="easyui-datebox"
										data-options="required:true,validType:'pledgeStartdate'" 
										id="pledgeStartdate" name="pledgeStartdate" style="width:200px"/></td>
								</tr>
								<tr>
									<td>抵（质）押物品到期日:</td>
									<td><input class="easyui-datebox"
										data-options="required:true,validType:'pledgeEnddate'" 
										id="pledgeEnddate" name="pledgeEnddate" style="width:200px"/></td>
								</tr> -->
								<tr>
									<td>抵（质）押物品照片:</td>
									<td>
							            <div class="img-container">
							         	</div>
							            <input class="img-btn" type="file" id="drivingLicence" name="borPhoto"/>
								</tr>
								<tr>
									<td>抵（质）押物品照片:</td>
									<td>
							            <div class="img-container">
							         	</div>
							            <input class="img-btn" type="file" id="drivingLicence" name="borPhoto"/>
								</tr>
								<tr>
									<td>担保人姓名:</td>
									<td><input class="easyui-textbox" id="guaName" name="guaName"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人性别:</td>
									<td><input id="guaGender" type="radio" value="男" name="guaGender" checked="checked"/>男&nbsp;&nbsp;
										<input id="guaGender" type="radio" value="女" name="guaGender"/>女
									</td>
								</tr>
								<tr>
									<td>担保人联系方式:</td>
									<td><input class="easyui-textbox" data-options="required:true,validType:'mobile'" name="guaPhone" id="guaPhone"></input></td>
								</tr>
								<tr>
									<td>担保人出生年月:</td>
									<td><input class="easyui-datebox"
										data-options="required:true,validType:'guaBirthday'" 
										id="guaBirthday" name="guaBirthday" style="width:200px"/></td>
								</tr>
								<tr>
									<td>担保人证件类型:</td>
									<td><select id="guaCardType" name="guaCardType" class="easyui-combobox">   
										    <option value="身份证" selected="selected">身份证</option>   
										    <option value="工作证">工作证</option> 
										    <option value="护照">护照</option>   
										    <option value="军官证">军官证</option>   
										    <option value="士兵证">士兵证</option>
										    <option value="户口本">户口本</option>     
										</select>  	
									</td>
								</tr>
								<tr>
									<td>担保人证件号码:</td>
									<td><input class="easyui-textbox" id="guaCardNumber" name="guaCardNumber"
										data-options="required:true,validType:'guaCardNumber'" value="410223198711222586"></input></td>
								</tr>
							</table>
						</td>
						<td>
							<table id="tab3">
								<tr>
									<td>担保人户籍地址:</td>
									<td>
										<div class="jq22-container form-inline">
											<div data-toggle="distpicker">
												<div class="form-group">
													<select
														class="form-control" data-province="河南省" id="province"
														name="guaRegister">
													</select>
												</div>
												<div class="form-group">
													<select
														class="form-control" data-city="郑州市" id="city"
														name="guaRegister">
													</select>
												</div>
												<div class="form-group">
													<select
														class="form-control" data-district="中原区" id="district"
														name="guaRegister">
													</select>
												</div>
											</div>
											<br> <input class="easyui-textbox tb" name="guaRegister"
												id="guaRegister" />
										</div>

									</td>
								</tr>

								<tr>
									<td>担保人现居住地址:</td>
									<td>
										<div class="jq22-container form-inline">
											<div data-toggle="distpicker">
												<div class="form-group">
													<select
														class="form-control" data-province="河南省" id="province"
														name="guaAddress">
													</select>
												</div>
												<div class="form-group">
													<select
														class="form-control" data-city="郑州市" id="city"
														name="guaAddress">
													</select>
												</div>
												<div class="form-group">
													<select
														class="form-control" data-district="中原区" id="district"
														name="guaAddress">
													</select>
												</div>
											</div>
											<br> <input class="easyui-textbox tb" name="guaAddress"
												id="guaAddress" />
										</div>

									</td>
								</tr>
								<tr>
									<td>担保人工作单位:</td>
									<td><input class="easyui-textbox" id="guaUnit" name="guaUnit"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人职业:</td>
									<td><input class="easyui-textbox" id="guaPosition" name="guaPosition"
										data-options="required:true"></input></td>
								</tr>
								<tr>
									<td>担保人婚姻状况:</td>
									<td><input type="radio" id="guaMarry" value="已婚" name="guaMarry" checked="checked"/>已婚&nbsp;&nbsp;
										<input type="radio" id="guaMarry" value="未婚" name="guaMarry" />未婚
								</tr>
								<tr>
									<td>担保人民族:</td>
									<td><input class="easyui-textbox" id="guaNation" name="guaNation"></input></td>
								</tr>
								<tr>
									<td>担保人学历:</td>
									<td><select id="guaEducation" name="guaEducation" class="easyui-combobox">
										<option value="高中及以下">高中及以下</option>   
									    <option value="大专">大专</option>   
									    <option value="本科" selected="selected">本科</option>   
									    <option value="研究生">研究生</option>   
									    <option value="博士">博士</option>   
									</select>  
									</td>
								</tr>
								<tr>
									<td>担保人月收入:</td>
									<td><input type="text" id="guaIncome" name="guaIncome"/>元</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<script>
$(function(){
$('#dd')
		.dialog(
				{
					title : '不良贷款信息录入',
					width : '95%',
					height : '95%',
					closed : true,
					cache : false,
					modal : true,
					buttons : [
							{
								iconCls : 'icon-save',
								text : '保存',
								handler : function() {
									$('#ff').form('submit',{
										url : '/badLoan/BorLoanInfo/addBorLoanInfo',
										onSubmit : function() {
											var isValid = $(this).form('validate');
											if (!isValid) {
													$.messager.progress('close');// 如果表单是无效的则隐藏进度条
												}
													return isValid; // 返回false终止表单提交
										},
										success : function(data) {
											alert(data);
											window.location.href = "/badLoan/jsp/borloaninfo.jsp";
										},
										error : function(data) {
											alert(data);
											window.location.href = "/badLoan/jsp/borloaninfo.jsp";
										}
									}); 
								}
							}, {
								text : '关闭',
								iconCls : 'icon-close',
								handler : function() {
									$('#dd').dialog('close');
								}
							} ]
				});
});

		$("#addBtn").click(function() {
			$('#dd').dialog("open");
			//查询所有银行
			$("#bankInfoId").combobox({
				url : '/badLoan/BankInfo/findBankInfo',
				valueField : 'bankInfoId',
				textField : 'bankInfoName',
				panelHeight : "auto",
				editable : false,
				required : true,
				width : 200,
				onLoadSuccess : function() {
					var data = $("#bankInfoId").combobox('getData');
					if (data.length > 0) {
						$("#bankInfoId").combobox('setValue', data[0].bankInfoId);
					}
				},
				onSelect : function(rec){
						var url = '/badLoan/employee/findAllEmployee?bankInfoId='+rec.bankInfoId;
						$("#empId").combobox({
							valueField : 'empId',
							textField : 'empName',
							panelHeight : "auto",
							editable : false,
							required : true,
							url : url,
							width : 200,
							onLoadSuccess : function() {
								var data = $("#empId").combobox('getData');
								if (data.length > 0) {
									$("#empId").combobox('setValue', data[0].empId);
								}
							}, 
							onselect : function(rec){
									$("#bankInfoId").val(rec.empId);
							}
						});
					}
			
			});
		});
		//查询所有个人用户
		$('#borId').combobox({
			url : '/badLoan/borrower/findBorId',
			valueField : 'borId',
			textField : 'borId',
			width : 200,
			panelHeight : "auto",
			editable : false,
			required : true,
			onLoadSuccess : function() {
				var data = $("#borId").combobox('getData');
				if (data.length > 0) {
					$("#borId").combobox('setValue', data[0].borId);
					$("#borName").val(data[0].borName);	
				}
			},
			onSelect : function(rec){
				$("#borName").val(rec.borName);
			}
		});
		//查询所有个人贷款种类
		$('#loantypeId').combobox({
			url : '/badLoan/LoanType/findLoanType',
			valueField : 'loantypeId',
			textField : 'loanTypeName',
			width : 200,
			panelHeight : "auto", 
			 editable : false,
			onLoadSuccess : function() {
				var data = $("#loantypeId").combobox('getData');
				if (data.length > 0) {
					$("#loantypeId").combobox('setValue', data[0].loantypeId);
				}
			},
		});
		//民族
		$('#guaNation').combobox({
			url : '/badLoan/json/nation.json',
			valueField : 'name',
			textField : 'name',
			required : true,
			width : 200,
			panelHeight : 120, 
			 editable : false,
			onLoadSuccess : function() {
				var data = $("#guaNation").combobox('getData');
				if (data.length > 0) {
					$("#guaNation").combobox('setValue', data[0].name);
				}
			},
		});
		$("#pledgeType").combobox({
			panelHeight : "auto",
			editable : false,
			required : true,
			width : 200,
		});
		$("#guaEducation").combobox({
			panelHeight : "auto",
			editable : false,
			required : true,
			width : 200,
		});
		$("#guaCardType").combobox({
			panelHeight : "auto",
			editable : false,
			required : true,
			width : 200,
		});
		//利率（数值输入框）
		$('#loanRate').numberbox({    
		    min:0,    
		    precision:4,//精度4
		    required : true,
		    width:200,
		});  
		$("#loanNumber").numberbox({    
		    min:0,    
		    width:200,
		    required : true,
		});  
		$("#pledgeValue").numberbox({    
		    min:0,    
		    width:200,
		    required : true,
		});  
		$("#guaIncome").numberbox({    
		    min:0,    
		    width:200,
		    required : true,
		});  
		$('#contractId').numberbox({    
		    min:0,    
		    width:200,
		    required : true,
		});  
		$('#loanAccount').numberbox({    
		    min:0,    
		    width:200,
		    required : true,
		});  
		$('#guaRegister').textbox({
			prompt : '请输入详细地址',
			
		});
		$('#guaAddress').textbox({
			prompt : '请输入详细地址',
			
		});
		$('#guaPhone').textbox({
			validType:'mobile',
			width : 200,
		});
		//日期输入框禁止输入
		$(function(){
			$(".datebox :text").attr("readonly","readonly");
		})
		//日期验证（截止日期不能大于当前日期）
	    $("#loanDate").datebox({  
	        onSelect : function(beginDate){  
	            $('#loanRepaymentDate').datebox().datebox('calendar').calendar({  
	                validator: function(date){  
	                    return beginDate<date;  
	                }, 
	            });  
	        }  
	    });  
		/* $("#pledgeStartdate").datebox({  
	        onSelect : function(beginDate){  
	            $('#pledgeEnddate').datebox().datebox('calendar').calendar({  
	                validator: function(date){  
	                    return beginDate<date;  
	                }, 
	            });  
	        }  
	    });   */
		$.extend($.fn.validatebox.defaults.rules, {
			
			mobile: {
		          validator: function (value, param) {
		            return /^1[3-8]+\d{9}$/.test(value);
		          },
		          message: '手机号码格式不正确'
		        },
		   /*  idCode:{
		            validator:function(value,param){
		              return /^[0-9]+.?[0-9]*$/.test(value);;
		            },
		            message: '请输入正确的身份证号'
		          }, */
		        loanDate: {  
			          validator: function(value,param){  
			               if(value)  
			               {  
			                   if(value.length > 10)  
			                   {  
			                       value = value.substring(0,10);  
			                   }  
			                   var ed_arr = value.split('-');  
			                   var selectedDate = new Date(ed_arr[0],ed_arr[1]-1,ed_arr[2]);  
			                   var currentDate = new Date();  
			                   if((currentDate.getTime() - selectedDate.getTime()) >= 0)  
			                   {  
			                       return true;  
			                   }  
			               }  
			           return false;  
			       },  
			       message:"日期必须小于等于当前日期"  
			 },
			 loanRepaymentDate: {  
		          validator: function(value,param){  
		               if(value)  
		               {  
		                   if(value.length > 10)  
		                   {  
		                       value = value.substring(0,10);  
		                   }  
		                   var ed_arr = value.split('-');  
		                   var selectedDate = new Date(ed_arr[0],ed_arr[1]-1,ed_arr[2]);  
		                   var currentDate = new Date();  
		                   if((currentDate.getTime() - selectedDate.getTime()) >= 0)  
		                   {  
		                       return true;  
		                   }  
		               }  
		           return false;  
		       },  
		       message:"日期必须小于等于当前日期"  
		 	},
		 	guaBirthday: {  
		          validator: function(value,param){  
		                   var time=$.fn.datebox.defaults.parser(value).getTime();
		                   var currentTime = new Date().getTime()-25*365*24*3600*1000;  
		                   if(time < currentTime)  
		                   {  
		                       return true;  
		                   }  
		           return false;  
		       },  
		       message:"担保人必须年满25岁"  
		 	},
		 	contractId:{
		 	 	validator: function(value){ 
            		var data = {"contractId":value};
            		var url = '/badLoan/BorLoanInfo/findcontractId';
            		var st =false;
            		 $.ajax({  
                         type: "POST", 
                         url:url,  
                         dataType:"json",  
                         data:data,  
                         async:false,  
                         success: function(data){
                         	if(data==false){
                         		$.fn.validatebox.defaults.rules.contractId.message ="合同编号已存在";
                         		st = false;
                         	}else{
                         		st=true;
                         	}
                         }  
                     });  
                    return st; 
            		
            	}
		 	 }, 
		 	guaCardNumber:{
		 		validator: function (value, param) {
		 			  return /^[a-zA-Z0-9]+$/.test(value);
		 			 },
		 			message : "只能包括英文字母、数字"
		   },
		   loanAccount:{
			   validator: function(value,param){
				   return /^[^0][0-9]{17,20}$/.test(value);
			   },
			   message : "银行卡号应为18-21位"
		   },
		  
		});
		/* //先禁止验证，失焦时提示验证
		$('.validatebox-text').bind('blur', function(){
			$(this).validatebox('enableValidation').validatebox('validate');
		});
	
	 	$(this).form('enableValidation').form('validate');//启用校验 */
	 	
		$('#dg').datagrid({
			url : '/badLoan/BorLoanInfo/findBorLoanInfo',
			striped : true, //斑马线 
			nowrap : true, //如果为true，则在同一行中显示数据。设置为true可以提高加载性能
			pagination : true, //底部分页
			pageSize:10,
			pageNumber:1,
			pageList:[5,10,15,20],
			rownumbers : true, //如果为true，则显示一个行号列
			onLoadSuccess:function(data){    
	            $("a[name='opera']").linkbutton({text:'下订单',plain:true,iconCls:'icon-add'}); 
	            
	   	 	},
			columns : [ [ {
				field : 'borloaninfoId',
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
				field : 'contractId',
				title : '合同编号',
				width : 100
			}, {
				field : 'empName',
				title : '经手人',
				width : 100
			}, {
				field : 'loanTypeName',
				title : '贷款种类',
				width : 100
			}, {
				field : 'loanNumber',
				title : '贷款金额(元)',
				width : 100
			}, {
				field : 'loanAccount',
				title : '贷款账号',
				width : 150
			}, {
				field : 'loanDate',
				title : '贷款日期',
				width : 150
			}, {
				field : 'loanRepaymentDate',
				title : '还款日期',
				width : 150
			}, {
				field : 'loanRate',
				title : '贷款利率(%)',
				width : 70
			},{
				field : 'lmrName',
				title : '贷款状态',
				width : 100,
				formatter:function(value){
				    if(value=='0'){
				        return "待处理";
				    }else{
				        return "处理中";
				    }
				}
			},    /* {field:'operate',title:'操作',align:'center',width:$(this).width()*0.1,  
		        formatter:function(value, row, index){  
		            var str = '<a href="#" name="opera" class="easyui-linkbutton" >同意</a>';  
		            return str;  
		    }}*/ ]]
		});
	    
	</script>
</body>
</html>