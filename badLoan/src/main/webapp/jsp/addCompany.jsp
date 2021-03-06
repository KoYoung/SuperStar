<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>

<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../bootstrap-3.3.7-dist/js/distpicker.data.js"></script>
<script src="../bootstrap-3.3.7-dist/js/distpicker.js"></script>
<script src="../bootstrap-3.3.7-dist/js/main.js"></script>
<!--级联  -->
<!-- 传图 -->
<link rel="stylesheet" type="text/css"
	href="../diyUpload/css/webuploader.css">
<link rel="stylesheet" type="text/css"
	href="../diyUpload/css/diyUpload.css">
<script type="text/javascript"
	src="../diyUpload/js/webuploader.html5only.min.js"></script>
<script type="text/javascript" src="../diyUpload/js/diyUpload.js"></script>
<!-- 传图 -->

<style type="text/css">
tr {
	line-height: 40px;
}

td {
	line-height: 20px;
}

.img-container {
	width: 293px;
	height: 150px;
	background: #F2F2F2;
	overflow: hidden;
	border: 1px solid #000;
}

tr {
	margin: 2px;
}

.img-container>img {
	width: 293px;
	height: 150px;
}

.img {
	width: 293px;
	height: 150px;
}

#tablr, #xiangqing {
	margin-left: 20px
}

#tabsearch {
	margin-left: 10px;
}

.image {
	width: 293px;
	height: 150px;
}
</style>
</head>
<body>
	<div id="toobar">
		<a id="addcompany" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add'">添加企业信息</a> <input
			class="easyui-searchbox" id="mohu"
			data-options="searcher:ad,prompt:'请输入企业名字搜索'" style="width: 150px" />
		<a id="searchpersonal" class="easyui-linkbutton"
			href="javascript:void(0)" data-options="iconCls:'icon-search'">查看</a>
	</div>
	<table id="company"></table>
	<div id="comp">
		<div>
			<form id="compfrom" enctype="multipart/form-data" method="post">
				<table cellpadding="5" id="tab1">
					<tr>
						<th>公司名字</th>
						<td><input class="easyui-textbox" id="comName" name="comName" /></td>
						<th>组织机构号</th>
						<td><input class="easyui-numberbox" id="comCode" name="comCode" /></td>
					</tr>
					<tr>
						<th>工商登记号码</th>
						<td><input class="easyui-numberbox"id="comLicense"name="comLicense" /></td>
						<th>公司类型</th>
						<td><select id="comType" class="easyui-combobox"
							name="comType">
								<option value="国有企业">国有企业</option>
								<option value="集体所有制企业">集体所有制企业</option>
								<option value="私营企业">私营企业</option>
								<option value="股份制企业">股份制企业</option>
								<option value="联营企业">联营企业</option>
								<option value="外商投资企业">外商投资企业</option>
								<option value="港、澳、台企业">港、澳、台企业</option>
								<option value="股份合作企业">股份合作企业</option>
						</select></td>
					</tr>
					<tr>
						<th>隶属关系</th>
						<td><select id="comParent" class="easyui-combobox"
							name="comParent">
								<option value="中央">中央</option>
								<option value="省级">省级</option>
								<option value="市级">市级</option>
								<option value="县级">县级</option>
								<option value="乡镇">乡镇</option>

						</select></td>
						<th>公司地址</th>
						<td>
							<div class="form-inline">
								<div data-toggle="distpicker">
									<div class="form-group">
										<label class="sr-only" for="province3">Province</label> <select
											class="form-control" id="comAddressa" name="comAddress"
											data-province="浙江省"></select>
									</div>
									<div class="form-group">
										<label class="sr-only" for="city3">City</label> <select
											class="form-control" id="comAddressb" name="comAddress"
											data-city="杭州市"></select>
									</div>
									<div class="form-group">
										<label class="sr-only" for="district3">District</label> <select
											class="form-control" id="comAddressc" name="comAddress"
											data-district="西湖区"></select>
									</div>
								</div>
							</div>
						</td>

					</tr>
					<tr>

						<th>企业信誉度</th>
						<td><input class="easyui-numberbox" id="comCredit"
							name="comCredit" /></td>
						<th>经济性质</th>
						<td><select id="comProperty" class="easyui-combobox"
							name="comProperty">
								<option value="有限责任公司">有限责任公司</option>
								<option value="股份有限责任公司">股份有限责任公司</option>
								<option value="个体工商户">个体工商户</option>
								<option value="私营独资企业">私营独资企业</option>
								<option value="私营合伙企业">私营合伙企业</option>

						</select></td>
					</tr>
					<tr>
						<th>邮政编码</th>
						<td><input class="easyui-numberbox" id="comPostcode"
							onblur="checkcomPostcode('comPostcode');" name="comPostcode" /></td>
						<th>联系人</th>
						<td><input class="esayui-textbox" id="comLinkman"
							name="comLinkman" /></td>
					</tr>
					<tr>
						<th>联系电话</th>
						<td><input class="easyui-numberbox" id="comLinphone" 
							onblur="checkMobile('comLinphone');" name="comLinphone" /></td>
						<th>注册资金</th>
						<td><input class="easyui-numberbox" id="comFund" name="comFund" /></td>
					</tr>

					<tr>
						<th>法人姓名</th>
						<td><input class="esayui-textbox" id="legalName"
							name="legalName" /></td>
						<th>法人性别</th>
						<td><input type="radio" id="legalGender" checked="checked"
							name="legalGender" value="男" />男 <input type="radio"
							id="legalGender" name="legalGender" value="女" />女</td>
					</tr>
					<tr>
						<th>法人联系方式</th>
						<td><input class="easyui-numberbox" id="legalPhone" 
							onblur="checklegalPhone('legalPhone');" name="legalPhone" /></td>
						<th>法人民族</th>
						<td><input class="easyui-combobox" id="legalNation"
							name="legalNation" /></td>
					</tr>
					<tr>
						<th>法人证件类型</th>
						<td>
							<!-- <input type="text" id="guaPhone" name="guaPhone"/> --> <select
							id="legalCardtype" class="easyui-combobox" name="legalCardtype">
								<option value="身份证">身份证</option>
								<option value="士兵证">士兵证</option>
								<option value="军官证">军官证</option>
								<option value="警官证">警官证</option>
								<option value="护照">护照</option>
								<option value="其他">其他</option>
						</select>
						</td>
						<th>法人证件号码</th>
						<td><input id="legalCardnumber" class="easyui-numberbox"
							name="legalCardnumber" /></td>
					</tr>
					<tr>
						<th>法人婚姻状况</th>
						<td><select id="legalMarry" class="easyui-combobox"
							name="legalMarry">
								<option value="未婚">未婚</option>
								<option value="已婚">已婚</option>
								<option value="离异">离异</option>
								<option value="丧偶">丧偶</option>
						</select></td>
						<th>法人地址</th>
						<td>
							<div class="form-inline">
								<div data-toggle="distpicker">
									<div class="form-group">
										<label class="sr-only" for="province3">Province</label> <select
											class="form-control" id="legalAddressa" name="legalAddress"
											data-province="浙江省"></select>
									</div>
									<div class="form-group">
										<label class="sr-only" for="city3">City</label> <select
											class="form-control" id="legalAddressb" name="legalAddress"
											data-city="杭州市"></select>
									</div>
									<div class="form-group">
										<label class="sr-only" for="district3">District</label> <select
											class="form-control" id="legalAddressc" name="legalAddress"
											data-district="西湖区"></select>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>法人资料</th>
							<td>
						            <div class="img-container"></div>
						            <input class="img-btn" type="file"  required="true" id="legalInfo" name="tupian">
					        	
							</td>
						<th>企业资料照片</th>
						<td>
							<div id="box">
						            <div class="img-container"></div>
						            <input class="img-btn" type="file"  required="true" id="conPhoto" name="tupian">
							</div>
						</td>

					</tr>
					<tr>
						<th>税务登记证</th>
						<td>
							<div id="box">
								<div class="img-container"></div>
						        <input class="img-btn" type="file"   required="true" id="comCard" name="tupian">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="search">
		<table id="xiangqing">
			
			<tr>
				<th>企业名称</th>
				<td><span id="comName0"></span></td>
				<th>组织代码</th>
				<td><span id="comCode0"></span></td>

			</tr>
			<tr>
				<th>工商执照号</th>
				<td><span id="comLicense0"></span></td>
				<th>单位类型</th>
				<td><span id="comType0"></span></td>
			</tr>
			<tr>

				<th>单位地址</th>
				<td><span id="comAddress0"></span></td>

			</tr>
			<tr>
				<th>隶属关系</th>
				<td><span id="comParent0"></span></td>
				<th>法定代表人</th>
				<td><span id="comLegalId0"></span></td>

			</tr>
			<tr>
				<th>经济性质</th>
				<td><span id="comProperty0"></span></td>
				<th>邮政编码</th>
				<td><span id="comPostcode0"></span></td>
			</tr>
			<tr>
				<th>联系人</th>
				<td><span id="comLinkman0"></span></td>
				<th>注册资金</th>
				<td><span id="comFund0"></span></td>
			</tr>
			<tr>
				<th>联系电话</th>
				<td><span id="comLinphone0"></span></td>
				<th>企业信誉度</th>
				<td><span id="comCredit0"></span></td>
			</tr>
			<tr>
				<th>法人姓名</th>
				<td><span id="legalName0"></span></td>
				<th>法人证件类型</th>
				<td><span id="legalCardtype0"></span></td>

			</tr>
			<tr>
				<th>法人证件号码</th>
				<td><span id="legalCardnumber0"></span></td>
				<th>法人民族</th>
				<td><span id="legalNation0"></span></td>
			</tr>
			<tr>
				<th>法人性别</th>
				<td><span id="legalGender0"></span></td>
				<th>法人婚姻状况</th>
				<td><span id="legalMarry0"></span></td>
			</tr>
			<tr>
				<th>法人地址</th>
				<td><span id="legalAddress0"></span></td>
				<th>法人电话</th>
				<td><span id="legalPhone0"></span></td>
			</tr>
			<tr>
				<th>法人资料</th>
				<td><div id="legalInfo0" class="limage"></div></td>
				<th>企业资料照片</th>
				<td><div id="conPhoto0" class="limage"></div></td>

			</tr>
			<tr>
				<!-- <th>税务登记证号</th>
				<td><span id="comCard0"></span></td> -->
				<th>税务登记证</th>
				<td><div id="comCard0" class="limage"></div></td>
			</tr>
			
		</table>
	</div>

	<script type="text/javascript">
	$("#comFund").numberbox({
		panelHeight : "auto",
		prompt : '公司注册资金',
		required:"true"
	});
	
	$("#comLinkman").textbox({
		panelHeight : "auto",
		prompt : '输入公司的联系人',
		required:"true"
	});
	
	$("#legalCardnumber").numberbox({
		panelHeight : "auto",
		prompt : '法人证件号码',
		required:"true"
	});
	$("#comLinphone").numberbox({
		panelHeight : "auto",
		prompt : '联系人的正确电话',
		required:"true",
		validType : 'mobile'
	});
	
	$.extend($.fn.validatebox.defaults.rules, {
		mobile : {
			validator : function(value) {
				var reg = /^1[3|4|5|8|9]\d{9}$/;
				return reg.test(value);
			},
			message : '输入手机号码格式不准确.'
		}
	});
	$("#legalPhone").numberbox({
		panelHeight : "auto",
		prompt : '法人的正确电话',
		required:"true",
		validType : 'mobile'
	});
	
	$("#legalName").textbox({
		panelHeight : "auto",
		prompt : '输入法人姓名',
		required:"true"
	});
	
	$("#comLicense").numberbox({
		panelHeight : "auto",
		prompt : '输入正确的组织代码',
		required:"true"
	});
	
	$("#comCode").numberbox({
		panelHeight : "auto",
		prompt : '输入15位的数字',
		required:"true"
	});
	$("#comName").textbox({
		panelHeight : "auto",
		prompt : '输入公司名字',
		required:"true"
	});
	$('#comParent').combobox({
		width:173,
		panelHeight : "auto",
		editable : false,
	});
	$('#comType').combobox({
		width:173,
		panelHeight : "auto",
		editable : false,
	});
	$('#legalNation').textbox({
		width:173,
		panelHeight : "auto",
		editable : false,
	});
	
	$('#comProperty').combobox({
		width:173,
		panelHeight : "auto",
		editable : false,
	});
	
	$('#legalCardtype').combobox({
		width:173,
		panelHeight : "auto",
		editable : false,
	});	
	$('#legalMarry').combobox({
		width:173,
		panelHeight : "auto",
		editable : false,
	});	
		$("#searchpersonal").click(
				function() {
					var row = $("#company").datagrid('getSelected');
					if (row != null) {
						$('#search').dialog({
							title : '个人客户详情',
							width : '80%',
							height : '95%',
							closed : false,
							cache : false,
							modal : true
						});
						$("#comName0").html(row.comName);
						$("#comCode0").html(row.comCode);
						$("#comType0").html(row.comType);
						$("#comLicense0").html(row.comLicense);
						$("#comAddress0").html(row.comAddress);
						$("#comParent0").html(row.comParent);
						$("#comLegalId0").html(row.comLegalId);
						$("#comProperty0").html(row.comProperty);
						$("#comPostcode0").html(row.comPostcode);
						$("#comLinkman0").html(row.comLinkman);
						$("#comLinphone0").html(row.comLinphone);
						$("#comFund0").html(row.comFund);
						$("#comCredit0").html(row.comCredit);
						$("#conPhoto0").html(row.conPhoto);
						$("#legalName0").html(row.legalName);
						$("#legalCardtype0").html(row.legalCardtype);
						$("#legalCardnumber0").html(row.legalCardnumber);
						$("#legalNation0").html(row.legalNation);
						$("#legalGender0").html(row.legalGender);
						$("#legalMarry0").html(row.legalMarry);
						$("#legalAddress0").html(row.legalAddress);
						$("#legalPhone0").html(row.legalPhone);
						$("#comCard0").html(
								"<img class='image' src="+row.comCard+"\>");
						$("#conPhoto0").html(
								"<img class='image' src="+row.conPhoto+"\>");
						$("#legalInfo0").html(
								"<img class='image' src="+row.legalInfo+"\>");
					} else {
						$.messager.alert("", "请选择想要查询的信息", "");
					}
				});

		$(function() {
			$('input[type=text]').validatebox();
		})

		$(function() {

			$("#addcompany").click(function() {
				$('#comp').dialog("open");
			});

			$('#comp')
					.dialog(
							{
								title : '添加企业信息',
								width : '90%',
								height : '80%',
								closed : true,
								cache : false,
								modal : true,
								buttons : [
										{
											text : '保存',
											handler : function() {
												$.messager.progress(); // 显示进度条
												$('#compfrom')
														.form(
																'submit',
																{
																	url : '/badLoan/company/addcompany',
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
																		window.location.href = "/badLoan/jsp/addCompany.jsp"
																	}
																});
											}
										}, {
											text : '关闭',
											handler : function() {
												$('#comp').dialog('close');
											}
										} ]
							});
			$('#company').datagrid({
				url : '/badLoan/company/findcompany',
				method : 'post',
				toolbar : "#toobar",
				singleSelect : true,
				pagination : true,//开启分页功能
				fit : true,
				pageNumber : 1,
				pageSize : 10,
				pageList : [ 5, 10, 15, 20, 24],
				fitColumns : true,
				striped : true,
				loadMsg : "努力加载中......",
				frozenColumns : [ [ {
					field : 'comId',
					title : '企业用户编号',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comName',
					title : '企业用户名称',
					width : 100
				}, ] ],
				columns : [ [ {
					field : 'comCode',
					title : '组织机构代码',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comType',
					title : '单位类型',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comLicense',
					title : '工商登记执照号码',
					width : 120
				}, {
					field : 'comAddress',
					title : '单位地址',
					width : 120
				}, {
					field : 'comCard',
					title : '税务登记证',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comParent',
					title : '隶属关系',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comLegalId',
					title : '法定代表人',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comProperty',
					title : '经济性质',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comPostcode',
					title : '邮政编码',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comLinkman',
					title : '联系人',
					width : 60
				}, {
					field : 'comLinphone',
					title : '联系电话',
					width : 100
				}, {
					field : 'comFund',
					title : '注册资金',
					width : 100
				}, {
					field : 'comCredit',
					title : '企业信誉度',
					width : 100,
					hidden : 'true'
				}, {
					field : 'conPhoto',
					title : '企业资料照片',
					width : 100,
					hidden : 'true'
				}, {
					field : 'legalName',
					title : '法人姓名',
					width : 60
				}, {
					field : 'legalCardtype',
					title : '法人证件类型',
					width : 100,
					hidden : 'true'
				}, {
					field : 'legalCardnumber',
					title : '法人证件号码',
					width : 100
				}, {
					field : 'legalNation',
					title : '法人民族',
					width : 100,
					hidden : 'true',
					hidden : 'true'
				}, {
					field : 'legalGender',
					title : '法人性别',
					width : 100,
					hidden : 'true'
				}, {
					field : 'legalMarry',
					title : '法人婚姻状况',
					width : 100,
					hidden : 'true'
				}, {
					field : 'legalAddress',
					title : '法人地址',
					width : 120
				}, {
					field : 'legalPhone',
					title : '法人电话',
					width : 100
				}, {
					field : 'legalInfo',
					title : '法人资料',
					width : 100,
					hidden : 'true'
				}, ] ]
			});

			/*     上传图片       */
			$('#conPhoto').diyUpload({
				url : 'server/fileupload.php',
				success : function(data) {
					console.info(data);
				},
				error : function(err) {
					console.info(err);
				}
			});
			$('#comCard').diyUpload({
				url : 'server/fileupload.php',
				success : function(data) {
					console.info(data);
				},
				error : function(err) {
					console.info(err);
				}
			});
			/* 民族  */
			$("#legalNation").combobox({
				url : '../json/nation.json',
				width : '173',
				value : '汉族',
				valueField : 'name',
				textField : 'name',
				panelHeight : "100px",
				editable : false,
			});

		});
		/* 模糊  */
		function ad(value) {
			alert(value);
			$("#company").datagrid({
				url : "/badLoan/company/mohu?va=" + value,
				singleSelect : true,
				pagination : true,
				pageSize : 10,
				pageList : [ 5, 10, 15, 20, 30, 50 ],
				contentType : "application/json;charset=utf-8",

				frozenColumns : [ [ {
					field : 'comId',
					title : '企业用户编号',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comName',
					title : '企业用户名称',
					width : 100
				}, ] ],
				columns : [ [ {
					field : 'comCode',
					title : '组织机构代码',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comType',
					title : '单位类型',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comLicense',
					title : '工商登记执照号码',
					width : 100
				}, {
					field : 'comAddress',
					title : '单位地址',
					width : 100
				}, {
					field : 'comCard',
					title : '税务登记证',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comParent',
					title : '隶属关系',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comLegalId',
					title : '法定代表人',
					width : 100
				}, {
					field : 'comProperty',
					title : '经济性质',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comPostcode',
					title : '邮政编码',
					width : 100,
					hidden : 'true'
				}, {
					field : 'comLinkman',
					title : '联系人',
					width : 100
				}, {
					field : 'comLinphone',
					title : '联系电话',
					width : 100
				}, {
					field : 'comFund',
					title : '注册资金',
					width : 100
				}, {
					field : 'comCredit',
					title : '企业信誉度',
					width : 100
				}, {
					field : 'conPhoto',
					title : '企业资料照片',
					width : 100,
					hidden : 'true'
				}, {
					field : 'legalName',
					title : '法人姓名',
					width : 100
				}, {
					field : 'legalCardtype',
					title : '法人证件类型',
					width : 100
				}, {
					field : 'legalCardnumber',
					title : '法人证件号码',
					width : 100
				}, {
					field : 'legalNation',
					title : '法人民族',
					width : 100,
					hidden : 'true'
				}, {
					field : 'legalGender',
					title : '法人性别',
					width : 100,
					hidden : 'true'
				}, {
					field : 'legalMarry',
					title : '法人婚姻状况',
					width : 100,
					hidden : 'true'
				}, {
					field : 'legalAddress',
					title : '法人地址',
					width : 100
				}, {
					field : 'legalPhone',
					title : '法人电话',
					width : 100
				}, {
					field : 'legalInfo',
					title : '法人资料',
					width : 100,
					hidden : 'true'
				}, ] ]
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