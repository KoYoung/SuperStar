<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
	<div style="padding: 0 60px 20px 60px">
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
									<td><input id="loanTypeId" name="loanType"/></td>
								</tr>
								<tr>
									<td>贷款金额:</td>
									<td><input type="text" id="loanNumber" name="loanNumber"></input>万元</td>
								</tr>
								<tr>
									<td>贷款账号:</td>
									<td><input type="text" id="loanAccount" name="loanAccount"></input></td>
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
										data-options="required:true"></input></td>
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
										data-options="required:true,validType:'guaCardNumber'"></input></td>
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
														class="form-control" data-province="北京市" id="province"
														name="guaRegister">
													</select>
												</div>
												<div class="form-group">
													<select
														class="form-control" data-city="北京市市辖区" id="city"
														name="guaRegister">
													</select>
												</div>
												<div class="form-group">
													<select
														class="form-control" data-district="东城区" id="district"
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
														class="form-control" data-province="北京市" id="province"
														name="guaAddress">
													</select>
												</div>
												<div class="form-group">
													<select
														class="form-control" data-city="北京市市辖区" id="city"
														name="guaAddress">
													</select>
												</div>
												<div class="form-group">
													<select
														class="form-control" data-district="东城区" id="district"
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
									<td><input class="easyui-textbox" id="guaNation" name="guaNation"
										data-options="required:true"></input></td>
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
	<script type="text/javascript">
	
	</script>
</body>
</html>