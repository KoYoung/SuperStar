<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"></jsp:include>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
<!--级联  -->
<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../bootstrap-3.3.7-dist/js/distpicker.data.js"></script>
<script src="../bootstrap-3.3.7-dist/js/distpicker.js"></script>
<script src="../bootstrap-3.3.7-dist/js/main.js"></script>
<!--级联  -->

<style type="text/css">
tr {
	line-height: 40px;
}

td {
	line-height: 20px;
}

#box {
	margin: 10px;
	height: auto;
	width: auto;
	min-height: auto;
}

.img-container {
	width: 293px;
	height: 150px;
	background: #F2F2F2;
	overflow: hidden;
}

.img-container>img {
	width: 293px;
	height: 150px;
}

.img {
	width: 293px;
	height: 150px;
}

#drivingLicence0 {
	width: 200px;
	height: 100px;
}

#tableAddper, #xiangqing {
	margin-left: 20px
}

.image {
	width: 293px;
	height: 150px;
}
</style>
</head>
<body>



	<div id="toobar">
		<a id="addpersonal" class="easyui-linkbutton"
			href="javascript:void(0)" data-options="iconCls:'icon-add'">添加个人客户信息</a>
		<!-- <a id="updatepersonal" class="easyui-linkbutton"
			data-options=" iconCls:'icon-edit'" href="javascript:void(0)"
			onclick="edituser()">修改</a> --> <input class="easyui-searchbox" id="mohu"
			data-options="searcher:ad,prompt:'请输入客户名搜索'" style="width: 150px" />

		<a id="searchpersonal" class="easyui-linkbutton"
			href="javascript:void(0)" data-options="iconCls:'icon-search'">查看</a>
	</div>



	<div id="addper">
		<form id="myForm" enctype="multipart/form-data" method="post">
			<table class="formtable" id="tableAddper">
				<tr>
					<th>姓名</th>
					<td><input class="easyui-textbox" id="borName" name="borName" /></td>
					<th>性别</th>
					<td><input type="radio" checked="checked" id="borGender"
						name="borGender" value="男" />男 <input type="radio" id="borGender"
						name="borGender" value="女" />女</td>
				</tr>
				<tr>
					<th>出生年月</th>
					<td><input id="borBirthday" name="borBirthday"
						editable="false" class="easyui-datebox" /></td>
					<th>民族</th>
					<td><input type="text" class="" id="borNation"
						name="borNation" /></td>
				</tr>
				<tr>
					<th>婚姻状况</th>
					<td><select id="borMarry" class="easyui-combobox"
						name="borMarry">
							<option value="未婚">未婚</option>
							<option value="已婚">已婚</option>
							<option value="离异">离异</option>
							<option value="丧偶">丧偶</option>
					</select></td>
					<th>证件类型</th>
					<td><select id="borCardtype" class="easyui-combobox"
						name="borCardtype">
							<option value="身份证">身份证</option>
							<option value="士兵证">士兵证</option>
							<option value="军官证">军官证</option>
							<option value="警官证">警官证</option>
							<option value="护照">护照</option>
							<option value="其他">其他</option>
					</select></td>
				</tr>
				<tr>
					<th>户籍</th>
					<td>
						<div class="form-inline">
							<div data-toggle="distpicker">
								<div class="form-group">
									<label class="sr-only" for="province3">Province</label> <select
										class="form-control" id="borRegistera" name="borRegister"
										data-province="浙江省"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="city3">City</label> <select
										class="form-control" id="borRegisterb" name="borRegister"
										data-city="杭州市"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="district3">District</label> <select
										class="form-control" id="borRegisterc" name="borRegister"
										data-district="西湖区"></select>
								</div>
							</div>
						</div>

					</td>
					<th>身份证号</th>
					<td><input class="easyui-numberbox" required="true"
						id="borCardnumber" name="borCardnumber"></td>
				</tr>
				<tr>
					<th>住址</th>
					<td>
						<div class="form-inline">
							<div data-toggle="distpicker">
								<div class="form-group">
									<label class="sr-only" for="province3">Province</label> <select
										class="form-control" id="borAddressa" name="borAddress"
										data-province="浙江省"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="city3">City</label> <select
										class="form-control" id="borAddressb" name="borAddress"
										data-city="杭州市"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="district3">District</label> <select
										class="form-control" id="borAddressc" name="borAddress"
										data-district="西湖区"></select>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>单位地址</th>
					<td>
						<div class="form-inline">
							<div data-toggle="distpicker">
								<div class="form-group">
									<label class="sr-only" for="province3">Province</label> <select
										class="form-control" id="borUnitAddressa"
										name="borUnitAddress" data-province="浙江省"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="city3">City</label> <select
										class="form-control" id="borUnitAddressb"
										name="borUnitAddress" data-city="杭州市"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="district3">District</label> <select
										class="form-control" id="borUnitAddressc"
										name="borUnitAddress" data-district="西湖区"></select>
								</div>
							</div>
						</div>
					</td>
					<th>单位名称</th>
					<td><input class="easyui-textbox" id="borUnit" required="true"
						name="borUnit"></td>
				</tr>
				<tr>
					<th>单位电话</th>
					<td><input class="easyui-numberbox"
						data-options="min:10000000000,max:99999999999" required="true"
						id="borUnitPhone" name="borUnitPhone"></td>
					<th>职务</th>
					<td><input class="easyui-textbox" id="borPosition"
						required="true" name="borPosition"></td>
				</tr>
				<tr>
					<th>收入</th>
					<td><input class="easyui-numberbox" id="borIncome"
						required="true" data-options="min:0,precision:2" name="borIncome"></td>
					<th>电话</th>
					<td><input type="text" class="easyui-numberbox" id="borPhone"
						required="true" name="borPhone"></td>
				</tr>
				<tr>
					<th>邮编</th>
					<td><input class="easyui-numberbox" required="true"
						id="borPostcode" name="borPostcode"></td>
					<th>学历</th>
					<td><select id="borEducation" class="easyui-combobox"
						required="true" name="borEducation">
							<option value="硕士以上">硕士以上</option>
							<option value="大学本科">大学本科</option>
							<option value="大专">大专</option>
							<option value="高中/中专">高中/中专</option>
							<option value="初中或以下">初中或以下</option>
					</select></td>
				</tr>
				<tr>
					<th>紧急联系人名</th>
					<td><input class="easyui-textbox" required="true"
						id="contectName" name="contectName"></td>
					<th>紧急联系人性别</th>
					<td><input type="radio" id="contectGender" checked="checked"
						name="contectGender" value="男">男 <input type="radio"
						id="contectGender" name="contectGender" value="女">女</td>
				</tr>
				<tr>
					<th>证件类型</th>
					<td><select id="contectCardtype" class="easyui-combobox"
						name="contectCardtype">
							<option value="身份证">身份证</option>
							<option value="士兵证">士兵证</option>
							<option value="军官证">军官证</option>
							<option value="警官证">警官证</option>
							<option value="护照">护照</option>
							<option value="其他">其他</option>
					</select></td>
					<th>身份证号</th>
					<td><input class="easyui-numberbox" required="true"
						id="contectCardnumber" name="contectCardnumber"></td>
				</tr>
				<tr>

					<th>紧急联系人地址</th>
					<td>
						<div class="form-inline">
							<div data-toggle="distpicker">
								<div class="form-group">
									<label class="sr-only" for="province3">Province</label> <select
										class="form-control" id="contectAddressa"
										name="contectAddress" data-province="浙江省"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="city3">City</label> <select
										class="form-control" id="contectAddressb"
										name="contectAddress" data-city="杭州市"></select>
								</div>
								<div class="form-group">
									<label class="sr-only" for="district3">District</label> <select
										class="form-control" id="contectAddressc"
										name="contectAddress" data-district="西湖区"></select>
								</div>
							</div>
						</div>
					</td>
					<th>紧急联系人生日</th>
					<td><input id="contectBirthday" name="contectBirthday"
						required="true" editable="false" class="easyui-datebox" /></td>
				</tr>
				<tr>
					<th>紧急联系人电话</th>
					<td><input class="easyui-numberbox" required="true"
						id="contectTelphone" name="contectTelphone" /></td>
					<th>信用</th>
					<td><input class="easyui-textbox" id="borCredit"
						required="true" name="borCredit" /></td>
				</tr>
				<tr>
					<th>借款人照片</th>
					<td>
						<div id="box">
							<div>
								<div class="img-container"></div>
								<input class="img-btn" type="file" required="true" id="borPhoto"
									name="borP">
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<table id="personal"></table>
	<div id="add">
		<table id="xiangqing">
			<tr>
				<th>姓名</th>
				<td><span id="borName0"></span></td>
				<th>性别</th>
				<td><span id="borGender0"></span></td>
				
			</tr>
			<tr>
				<th>出生年月</th>
				<td><span id="borBirthday0"></span></td>
				<th>民族</th>
				<td><span id="borNation0"></span></td>
			</tr>
			<tr>
				<th>婚姻状况</th>
				<td><span id="borMarry0"></span></td>
				<th>住址</th>
				<td><span id="borAddress0"></span></td>
			</tr>
			<tr>
				<th>证件类型</th>
				<td><span id="borCardtype0"></span></td>
				<th>证件号码</th>
				<td><span id="borCardnumber0"></span></td>
				
			</tr>
			<tr>
				<th>户籍</th>
				<td><span id="borRegister0"></span></td>
				<th>客户电话</th>
				<td><span id="borPhone0"></span></td>
			</tr>
			<tr>
				<th>单位名称</th>
				<td><span id="borUnit0"></span></td>
				<th>单位电话</th>
				<td><span id="borUnitPhone0"></span></td>

			</tr>
			<tr>
				<th>单位地址</th>
				<td><span id="borUnitAddress0"></span></td>
				<th>单位职务</th>
				<td><span id="borPosition0"></span></td>
				
			</tr>
			<tr>
				<th>单位收入</th>
				<td><span id="borIncome0"></span></td>
				<th>邮编</th>
				<td><span id="borPostcode0"></span></td>
			</tr>
			<tr>
				
				<th>学历</th>
				<td><span id="borEducation0"></span></td>
				<th>紧急联系人</th>
				<td><span id="contectName0"></span></td>
			</tr>
			<tr>
				<th>紧急联系人性别</th>
				<td><span id="contectGender0"></span></td>
				<th>紧急联系人证件类型</th>
				<td><span id="contectCardtype0"></span></td>
				
			</tr>
			<tr>
				<th>紧急联系人证件号</th>
				<td><span id="contectCardnumber0"></span></td>
				<th>紧急联系人生日</th>
				<td><span id="contectBirthday0"></span></td>
			</tr>
			
			<tr>
				
				<th>紧急联系人地址</th>
				<td><span id="contectAddress0"></span></td>
				<th>紧急联系人电话</th>
				<td><span id="contectTelphone0"></span></td>
			</tr>
			<tr>
				<th>信用</th>
				<td><span id="borCredit0"></span></td>
				
			</tr>
			<tr>
				<th>客户照片</th>
				<td id="drivingLicence0"></td>
			</tr>
		</table>


	</div>

	<script type="text/javascript">
		/* 客户详情  */
		$("#searchpersonal").click(
				function() {
					var row = $('#personal').datagrid('getSelected');
					if (row != null) {
						$('#add').dialog({
							title : '个人客户详情',
							width : '70%',
							height : '90%',
							closed : false,
							cache : false,
							modal : true
						});
						$("#borName0").html(row.borName);
						$("#borGender0").html(row.borGender);
						$("#borNation0").html(row.borNation);
						$("#borBirthday0").html(row.borBirthday);
						$("#borPhone0").html(row.borPhone);
						$("#borPostcode0").html(row.borPostcode);
						$("#borAddress0").html(row.borAddress);
						$("#borCardtype0").html(row.borCardtype);
						$("#borCardnumber0").html(row.borCardnumber);
						$("#borMarry0").html(row.borMarry);
						$("#borRegister0").html(row.borRegister);
						$("#borUnit0").html(row.borUnit);
						$("#borUnitPhone0").html(row.borUnitPhone);
						$("#borPosition0").html(row.borPosition);
						$("#borIncome0").html(row.borIncome);
						$("#borEducation0").html(row.borEducation);
						$("#borUnitAddress0").html(row.borUnitAddress);
						$("#contectName0").html(row.contectName);
						$("#contectTelphone0").html(row.contectTelphone);
						$("#contectGender0").html(row.contectGender);
						$("#contectBirthday0").html(row.contectBirthday);
						$("#contectCardtype0").html(row.contectCardtype);
						$("#contectCardnumber0").html(row.contectCardnumber);
						$("#contectAddress0").html(row.contectAddress);
						$("#borCredit0").html(row.borCredit);
						$("#drivingLicence0").html(
								"<img class='image' src="+row.borPhoto+"\>");
					} else {
						$.messager.alert(" 提示", "请选中一行！");
					}
				});

		$(function() {
			/*   查询函数       */
			$("#personal").datagrid({
				url : "/badLoan/borrower/findborr",
				toolbar : "#toobar",
				pagination : true,//开启分页功能
				fit : true,
				pageNumber : 1,
				pageSize : 10,
				singleSelect : true,
				pageList : [ 5, 10, 15, 20, 25, 30 ],
				sortOrder : 'asc',//定义列的排序顺序,默认正序asc
				fitColumns : true,
				striped : true,
				columns : [ [ {
					field : 'borId',
					title : '编号',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borName',
					title : '姓名',
					width : 100
				}, {
					field : 'borGender',
					title : '性别',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borBirthday',
					title : '出生年月',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borNation',
					title : '民族',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borMarry',
					title : '婚姻',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borCardtype',
					title : '证件类型',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borCardnumber',
					title : '证件号码',
					width : 100
				}, {
					field : 'borRegister',
					title : '户籍',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borAddress',
					title : '地址',
					width : 100
				}, {
					field : 'borUnit',
					title : '单位',
					width : 100
				}, {
					field : 'borUnitAddress',
					title : '单位地址',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borUnitPhone',
					title : '单位电话',
					width : 100
				}, {
					field : 'borPosition',
					title : '职务',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borIncome',
					title : '收入',
					width : 100
				}, {
					field : 'borPhone',
					title : '电话',
					width : 100
				}, {
					field : 'borPostcode',
					title : '邮编',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borEducation',
					title : '学历',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borCredit',
					title : '信用',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borPhoto',
					title : '照片',
					width : 100,
					hidden : 'true'
				}, {
					field : 'contectName',
					title : '紧急联系人姓名',
					width : 180
				}, {
					field : 'contectGender',
					title : '紧急联系人性别',
					width : 180,
					hidden : 'true'
				}, {
					field : 'contectBirthday',
					title : '紧急联系人生日',
					width : 180,
					hidden : 'true'
				}, {
					field : 'contectCardtype',
					title : '紧急联系人证件类',
					width : 180,
					hidden : 'true'
				}, {
					field : 'contectCardnumber',
					title : '紧急联系人证件号',
					width : 180
				}, {
					field : 'contectAddress',
					title : '紧急联系人地址',
					width : 180,
					hidden : 'true'
				}, {
					field : 'contectTelphone',
					title : '紧急联系人电话',
					width : 180
				}, ] ]
			});

			/*    添加客户     */
			$('#addper')
					.dialog(
							{
								title : '添加客户信息',
								iconCls : 'icon-save',
								width : '95%',
								height : '95%',
								closed : true,
								cache : false,
								modal : true,
								pagination : true,//开启分页功能
								pageNumber : 1,
								pageSize : 5,
								pageList : [ 5, 10, 15, 20, 25, 30 ],
								sortName : 'empno',//定义哪些列可以进行排序
								sortOrder : 'asc',//定义列的排序顺序,默认正序asc
								fitColumns : true,
								striped : true,
								loadMsg : "努力加载中......",
								buttons : [
										{
											text : '保存客户信息',
											iconCls : 'icon-save',
											handler : function() {
												$.messager.progress(); // 显示进度条
												$('#myForm')
														.form(
																'submit',
																{
																	url : '/badLoan/borrower/addbor',
																	onSubmit : function() {
																		var isValid = $(
																				this)
																				.form(
																						'validate');
																		if (!isValid) {
																			$.messager
																					.progress('close'); // 如果表单是无效的则隐藏进度条
																		}
																		return isValid; // 返回false终止表单提交
																	},
																	success : function() {
																		$.messager
																				.progress('close'); // 如果提交成功则隐藏进度条
																		window.location.href = "/badLoan/jsp/addpersonal.jsp"
																	}
																});
											}
										}, {
											text : '关闭',
											handler : function() {
												alert("取消");
												$('#addper').dialog("close");
											}
										} ]
							});

			$("#addpersonal").click(function() {
				$('#addper').dialog("open");
			});

			/* 民族  */
			$("#borNation").combobox({
				url : '../json/nation.json',
				width : '173',
				value : '汉族',
				valueField : 'name',
				textField : 'name',
				panelHeight : "100px",
				editable : false,
			});
		});

		$('#borName').textbox({
			prompt : '输入姓名',
			width : 172,
			panelHeight : "auto",
			required : "true"
		});

		$("#borMarry").combobox({
			width : 173,
			panelHeight : "auto",
			editable : false,
		});

		$("#borCardtype").combobox({
			width : 173,
			panelHeight : "auto",
			editable : false,
		});

		$("#borEducation").combobox({
			width : 173,
			panelHeight : "auto",
			editable : false,
		});

		$("#contectCardtype").combobox({
			width : 173,
			panelHeight : "auto",
			editable : false,
		});
		function ad(value) {
			$("#personal").datagrid({
				url : "/badLoan/borrower/findbormohu?va=" + value,
				singleSelect : true,
				pagination : true,
				pageSize : 10,
				pageList : [ 5, 10, 15, 20, 30, 50 ],
				/* 	queryParams:form2Json("searchform"), */
				columns : [ [ {
					field : 'borId',
					title : '编号',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borName',
					title : '姓名',
					width : 100
				}, {
					field : 'borGender',
					title : '性别',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borBirthday',
					title : '出生年月',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borNation',
					title : '民族',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borMarry',
					title : '婚姻',
					width : 100,

				}, {
					field : 'borCardtype',
					title : '证件类型',
					width : 100,

				}, {
					field : 'borCardnumber',
					title : '证件号码',
					width : 100
				}, {
					field : 'borRegister',
					title : '户籍',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borAddress',
					title : '地址',
					width : 100
				}, {
					field : 'borUnit',
					title : '单位',
					width : 100
				}, {
					field : 'borUnitAddress',
					title : '单位地址',
					width : 100
				}, {
					field : 'borUnitPhone',
					title : '单位电话',
					width : 100
				}, {
					field : 'borPosition',
					title : '职务',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borIncome',
					title : '收入',
					width : 100
				}, {
					field : 'borPhone',
					title : '电话',
					width : 100
				}, {
					field : 'borPostcode',
					title : '邮编',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borEducation',
					title : '学历',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borCredit',
					title : '信贷',
					width : 100,
					hidden : 'true'
				}, {
					field : 'borPhoto',
					title : '照片',
					width : 100,
					hidden : 'true'
				}, {
					field : 'contectName',
					title : '紧急联系人姓名',
					width : 180
				}, {
					field : 'contectGender',
					title : '紧急联系人性别',
					width : 180,
					hidden : 'true'
				}, {
					field : 'contectBirthday',
					title : '紧急联系人生日',
					width : 180,
					hidden : 'true'
				}, {
					field : 'contectCardtype',
					title : '紧急联系人证件类',
					width : 180,
					hidden : 'true'
				}, {
					field : 'contectCardnumber',
					title : '紧急联系人证件号',
					width : 180
				}, {
					field : 'contectAddress',
					title : '紧急联系人地址',
					width : 180
				}, {
					field : 'contectTelphone',
					title : '紧急联系人电话',
					width : 180
				}, ] ],

			});
		}

		//图片上传预览
		function previewImg(fileInput, imgDiv) {
			if (window.FileReader) {//支持FileReader的时候
				var reader = new FileReader();
				reader.readAsDataURL(fileInput.files[0]);
				reader.onload = function(evt) {
					imgDiv.innerHTML = "\<img src="+evt.target.result+"\>";
				}
			} else {//兼容ie9-
				imgDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\''
						+ fileInput.value + '\)\';"></div>';
			}
		}
		function selectImg(fileInputs, imgDivs) {
			var checkImg = new RegExp("(.jpg$)|(.png$)|(.bmp$)|(.jpeg$)", "i");
			var i = 0;
			for (; i < fileInputs.length && i < imgDivs.length; i++) {
				(function(i) {//立即执行函数；保存i
					fileInputs[i].onchange = function() {
						if (checkImg.test(fileInputs[i].value)) {
							previewImg(this, imgDivs[i]);
						} else {
							alert("只支持上传.jpg .png .bmp .jpeg;你的选择有误");
						}
					};
				})(i);
			}

		}
		var fileInputs = document.getElementsByClassName("img-btn");//文件选择按钮
		var imgDivs = document.getElementsByClassName("img-container");//图片容器
		selectImg(fileInputs, imgDivs);
	</script>
</body>
</html>