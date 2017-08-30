<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <jsp:include page="head.jsp"></jsp:include> --%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../easyui/themes/default/easyui.css" type="text/css"></link>
		<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
		<link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
		<script src="../js/jquery-3.2.1.min.js"></script>
		<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../easyui/jquery.form.js"></script>
		<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<script src="../js/distpicker.data.js"></script>
<script src="../js/distpicker.js"></script>
<script src="../js/main.js"></script>

</head>
<style>

.easyui-textbox {
	width: 240px;
}

tr td{
	padding-bottom: 15px;
}
#input{
	margin-top: -10px;
}

#tab2{
	margin-left:70px;
	margin-top: -23px;
}
</style>
</head>
<body>
	<div style="margin: 20px 0"></div>
	<div style="padding: 10px 60px 20px 60px">
		<h2>抵押不良贷款录入</h2>
		<form id="ff" method="post">
			<table>
				<tr>
					<td id="one">
						<table cellpadding="5" id="tab1">
							<tr>
								<td>贷款人姓名:</td>
								<td><input class="easyui-textbox" name="studentNo"
									data-options="required:true,validType:'studentNo'"
									style="height: 30px"></input></td>
							</tr>
							<tr>
								<td>性别:</td>
								<td><input type="radio" name="studentSex" value="男" />男&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="studentSex" value="女" />女</td>
							</tr>
							<tr>
								<td>年龄:</td>
								<td><input class="easyui-textbox" name="studentName"
									data-options="required:true" ></input></td>
							</tr>
							<tr>
								<td>身份证号码:</td>
								<td><input class="easyui-textbox" name="studentName"
									data-options="required:true" ></input></td>
							</tr>
							<tr>
								<td>手机号码:</td>
								<td><input class="easyui-textbox" name="studentJg"
									data-options="required:true" ></input></td>
							</tr>
							<tr>
								<td>电子邮箱:</td>
								<td><input class="easyui-textbox" name="studentJg"
									data-options="required:true" ></input></td>
							</tr>
							
							<tr>
								<td>婚姻状况:</td>
								<td><input type="radio" name="studentSex" value="未婚" />未婚&nbsp;&nbsp;
									<input type="radio" name="studentSex" value="已婚" />已婚&nbsp;&nbsp;
									<input type="radio" name="studentSex" value="丧偶" />丧偶&nbsp;&nbsp;
									<input type="radio" name="studentSex" value="离异" />离异</td>
							</tr>
							
							<tr>
								<td>住房情况:</td>
								<td><input type="radio" name="studentSex" value="自有" />自有&nbsp;&nbsp;
									<input type="radio" name="studentSex" value="租赁" />租赁&nbsp;&nbsp;
									<input type="radio" name="studentSex" value="按揭" />按揭&nbsp;&nbsp;
									<input type="radio" name="studentSex" value="经营场所" />经营场所&nbsp;&nbsp;
									<input type="radio" name="studentSex" value="与亲属共住" />与亲属共住&nbsp;&nbsp;
									<input type="radio" name="studentSex" value="其他" />其他</td>
							</tr>
							<tr>
								<td>居住地址:</td>
								<td>
									<div class="jq22-container form-inline">
										<div data-toggle="distpicker">
											<div class="form-group">
												<label class="sr-only" for="province3">Province</label> <select
													class="form-control" id="province3" data-province="浙江省"></select>
											</div>
											<div class="form-group">
												<label class="sr-only" for="city3">City</label> <select
													class="form-control" id="city3" data-city="杭州市"></select>
											</div>
											<div class="form-group">
												<label class="sr-only" for="district3">District</label> <select
													class="form-control" id="district3" data-district="西湖区"></select>
											</div>
										</div>
										<br>
										<input id="tb"  class="easyui-textbox" data-options="required:true"/>
									</div>
								</td>
							</tr>
							<tr>
								<td>房产证或贷款购房合同:</td>
								<td>
									<div id="box">
										<div id="test" ></div>
									</div>
									<div id="demo">
										<div id="as" ></div>
									</div>																
								</td>
							</tr>
						</table>
					</td>
					<td id="top">
						<table cellpadding="5" id="tab2">
							<tr>
								<td>贷款额度:</td>
								<td><input class="easyui-textbox" name="studentJg"/>万元</td>
							</tr>
							<tr>
								<td>贷款用途:</td>
								<td><input class="easyui-textbox" name="message" ></input></td>
							</tr>
							<tr>
								<td>贷款日期:</td>
								<td>
									<input  class="easyui-datebox"/> 
								</td>
							</tr>
							<tr>
								<td>还款日期:</td>
								<td>
									<input class="easyui-datebox" />
								</td>
							</tr>
							<tr>
								<td>贷款类型:</td>
								<td><select class="easyui-combobox" id="MajorNo" style="height:30px;width:240px">
										<option value="抵押">抵押</option>
										<option value="质押">质押</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>抵押物品:</td>
								<td><select class="easyui-combobox" id="classNo" style="height:30px;width:240px">
										<option value="土地使用权">土地使用权</option>
										<option value="农房">农房</option>
										<option value="商品房">商品房</option>
										<option value="机器设备">机器设备</option>
										<option value="林权">林权</option>
										<option value="其他">其他</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>质押:</td>
								<td><select class="easyui-combobox" id="classNo" style="height:30px;width:240px">
										<option value="存单">存单</option>
										<option value="国债">国债</option>
										<option value="土地承包经营权">土地承包经营权</option>
										<option value="保证金">保证金</option>
										<option value="林权">林权</option>
										<option value="其他">其他</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>折旧率:</td>
								<td><input class="easyui-textbox" name="studentName"
									data-options="required:true" style="height: 30px"></input></td>
							</tr>
							<tr>
								<td>升值率:</td>
								<td><input class="easyui-textbox" name="studentName"
									data-options="required:true" style="height: 30px"></input></td>
							</tr>
							<tr>
								<td>保证人:</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
		</form>
		<div style="padding: 5px">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-add'"
				onclick="submitForm()" id="submit">添加</a> <a
				class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
				onclick="clearForm()">重置</a>
		</div>

	</div>
	<script>
		
		$('#tb').textbox({
			prompt: '请输入详细地址'
		});


		
		/* function submitForm(){
			$('#ff').form('submit');
		} */
		function clearForm() {
			$('#ff').form('clear');
		}

		 $('#MajorNo').combobox({
			url : '',
			valueField : 'majorNo',
			textField : 'majorName',
			panelHeight : "auto",
			editable : false,
			onLoadSuccess : function() {
				var data = $("#MajorNo").combobox('getData');
				if (data.length > 0) {
					$("#MajorNo").combobox('setValue', data[0].majorNo);
				}
			},
		}); 

		$('#classNo').combobox({
			url : '',
			valueField : 'classNo',
			textField : 'className',
			panelHeight : "auto",
			editable : false,
			onLoadSuccess : function() {
				var data = $("#classNo").combobox('getData');
				if (data.length > 0) {
					$("#classNo").combobox('setValue', data[0].classNo);

				}
			},
		});
		$.extend($.fn.validatebox.defaults.rules, {
			//验证学号必须输入数字
			studentNo : {
				validator : function(value) {
					return /^[0-9_ ]{6,10}$/.test(value);
				},
				message : "只能输入数字,长度为6-10个数字"
			},
			//验证密码必须输入数字
			password : {
				validator : function(value) {
					return /^[a-zA-Z0-9_ ]{6}$/.test(value);
				},
				message : "请输入英文和数字，长度不少于6位"
			},
		});
		$("#submit").click(function() {
			$('#ff').form('submit', {
				url : '/TheLast/student/addStudent',
				onSubmit : function() {
					var isValid = $(this).form('validate');
					if (!isValid) {
						$.messager.progress('close');// 如果表单是无效的则隐藏进度条
					}
					return isValid; // 返回false终止表单提交
				},
				success : function(data) {
					alert("添加成功");
					window.location.href = "queryStudent.jsp";
				}
			});
		}); 
		
		

		
	</script>
</body>
</html>
