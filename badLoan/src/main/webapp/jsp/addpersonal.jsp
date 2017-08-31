<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/bootstrap/easyui.css"
	type="text/css"></link>
<script src="https://cdn.hcharts.cn/highcharts/5.0.10/highcharts.js"></script>
<script
	src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/exporting.js"></script>
<script src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/data.js"></script>
<script
	src="https://cdn.hcharts.cn/highcharts/5.0.10/modules/drilldown.js"></script>
	
<script src="../js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="../js/jquery.provincesCity.js" type="text/javascript"></script>
<script src="../js/provincesdata.js" type="text/javascript"></script>


<!-- <script src="../diyUpload/jquery.js"></script>-->
<link rel="stylesheet" type="text/css" href="../diyUpload/css/webuploader.css">
<link rel="stylesheet" type="text/css" href="../diyUpload/css/diyUpload.css">
<script type="text/javascript" src="../diyUpload/js/webuploader.html5only.min.js"></script>
<script type="text/javascript" src="../diyUpload/js/diyUpload.js"></script> 
<style type="text/css">
  tr{line-height:40px;}
  td{
     	 line-height:20px; 
 `	}
 #box{ margin:10px height:auto; width:auto; min-height:auto;}
</style>
</head>
<body>
	<div id="p" class="easyui-panel" title="客户信息"     
        style="width:auto;height:auto;padding:10px;background:#fafafa;"   
        data-options="iconCls:'icon-edit',closable:true,    
                collapsible:true,minimizable:true,maximizable:true">   
    	<form action="">
		<table >
			<tr>
			<td><input type="hidden" name="borId"></td>
			</tr>
			<tr>
				<th>姓名</th>
				<td> <input class="easyui-textbox" type="text" name="borName" ></td>
				<th>性别</th>
				<td>
					<input type="radio"  checked="checked" name="borGender" value="男"/>男
					<input type="radio"  name="borGender" value="女"/>女
				</td>
			</tr>
			<tr>
				<th>出生年月</th>
				<td><input  id="borBirthday" name="borBirthda"  type= "text" class= "easyui-datebox" /></td>
				<th>民族</th>
				<td><input type="text" class="easyui-textbox" name="borNation" name="borNation"/></td>
			</tr>
			<tr>
				<th>婚姻状况</th>
				<td>
					<select id="borMarry" class="easyui-combobox" name="borMarry" style="width:200px;"  data-options="editable:false,panelHeight:'auto'">   
					    <option >未婚</option>   
					    <option value="borMarry">已婚</option>   
					    <option>离异  </option>   
					    <option>丧偶</option>   
					</select> 
				<!-- <input type="radio" name="hunyin" value="未婚" />未婚 <input
					type="radio" name="hunyin" value="已婚" />已婚 <input type="radio"
					name="hunyin" value="离异" />离异 <input type="radio" name="hunyin"
					value="丧偶" />丧偶</td> -->
			</tr>
			<tr>
				<th>证件类型</th>
				<td>
					<select id="borCardtype" class="easyui-combobox" name="borCardtype" style="width:200px;"  data-options="editable:false,panelHeight:'auto'">   
					    <option value="aa">身份证</option>   
					    <option>士兵证</option>   
					    <option>军官证 </option>   
					    <option>警官证</option>   
					    <option>护照 </option>
					    <option>其他</option>    
					</select> 
				<!-- <input type="radio" name="zhengjian" value="身份证" />身份证 <input
					type="radio" name="zhengjian" value="士兵证" />士兵证 <input type="radio"
					name="zhengjian" value="军官证" />军官证 <input type="radio"
					name="zhengjian" value="警官证" />警官证 <input type="radio"
					name="zhengjian" value="护照" />护照 <input type="radio"
					name="zhengjian" value="其他" />其他</td> -->
			</tr>
			<tr>
				<th>身份证号</th>
				<td><input type="text" class="easyui-textbox" id ="borCardnumber"name="borCardnumber"></td>
				<th>户籍</th>
				<td><div id="bor_register" id="borRegister" name="borRegister"></div></td>
			</tr>
			<tr>
				<th>住址</th>
				<td><div  id="borAddress" name="borAddress"></div></td>
			</tr>
			<tr>
				<th>单位名称</th>
				<td><input type="text" class="easyui-textbox" id="borUnit" value="borUnit"></td>
				<th>单位地址</th>
				<td><div id="borUnitAddress" name="borUnitAddress"></div></td>
			</tr>
			<tr>
				<th>单位电话</th>
				<td><input type="text" class="easyui-textbox"  id="borUnitPhone" name="borUnitPhone"></td>
				<th>职务</th>
				<td><input type="text" class="easyui-textbox" id="borPosition" name="borPosition" ></td>
			</tr>
			<tr>
				<th>收入</th>
				<td><input type="text" class="easyui-textbox" id="borIncome" name="borIncome" ></td>
				<th>电话</th>
				<td><input type="text" class="easyui-textbox" id="borPhone" name="borPhone" ></td>
			</tr>
			<tr>
				<th>邮编</th>
				<td><input type="text" class="easyui-textbox" id="borPostcode" name="borPostcode"></td>
				<th>学历</th>
				<td>
					<select id="borEducation" class="easyui-combobox" name="borEducation" style="width:200px;"  data-options="editable:false,panelHeight:'auto'">   
					    <option value="aa">硕士以上</option>   
					    <option>大学本科</option>   
					    <option>大专</option>   
					    <option>高中/中专</option>   
					    <option>初中或以下</option>   
					</select> 
				<!-- 	<input id="cc" name="dept" >   -->
				</td>
			</tr>
			<tr>
				<th>借款人照片</th>
				<td> <div id="box"><div id="borPhoto" name="borPhoto"></div></div></td>
			</tr>
			<tr>
				<th>贷款</th>
				<td> <input type="text" class="easyui-textbox" id="borCredit" name="borCredit"/></td>
			</tr>
		</table>
		<div><input type="submit" data-options="iconCls:'icon-search'" value="提交"/></div>
	</form>
	</div>
	<div><h1></h1></div>
	
	<script type="text/javascript">

	$(function() {
		$('#handlerDialog').dialog({
			title : '添加商品信息',
			iconCls : 'icon-save',
			width : 400,
			height : 300,
			top : 100,
			closed : true,
			cache : false,
			modal : true,
			buttons : [ {
				text : '增加类型',
				iconCls : 'icon-save',
				handler : function() {
					$('#myForm').form('submit', {
						url : "/badLoan/borrower/addbor",
						onSubmit : function() {
						
						},
						success : function(data) {
							alert(data);
							 window.location.href ="/badLoan/borrower/addbor";
							$('#dd').dialog("close");

						}
					});
				}

			}, {
				text : '取消',
				handler : function() {
					alert("取消");
					$('#dd').dialog("close");

				}
			} ]

		});
		$("#bor_address").ProvinceCity();
		$("#bor_unit_address").ProvinceCity();
		$("#bor_register").ProvinceCity();
	});
	$('#bor_photo').diyUpload({
		url:'server/fileupload.php',
		success:function( data ) {
			console.info( data );
		},
		error:function( err ) {
			console.info( err );	
		}
	});
	/* $('#cc').combobox({    
	    url:'combobox_data.json',    
	    valueField:'id',    
	    textField:'text'   
	});   */
	</script>
</body>
</html>