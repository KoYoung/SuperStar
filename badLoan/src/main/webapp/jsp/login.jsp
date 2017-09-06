<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- js文件 -->
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/bootstrap/easyui.css"
	type="text/css"></link>
</head>
<body>
	<h1 style="text-align: center; margin-top: 130px;">银&nbsp;&nbsp;行&nbsp;&nbsp;不&nbsp;&nbsp;良&nbsp;&nbsp;贷&nbsp;&nbsp;款&nbsp;&nbsp;信&nbsp;&nbsp;息&nbsp;&nbsp;管&nbsp;&nbsp;理&nbsp;&nbsp;系&nbsp;&nbsp;统</h1>
	<div id="big"
		style="margin-left: 480px; margin-top: 70px; width: 400px;">
		<form id="MyForm">
			<div class="input-group input-group-lg"
				style="width: 300px; margin-top: 30px; float: left;">
				<span class="input-group-addon" id="sizing-addon1"> <span
					class="glyphicon glyphicon-user" aria-hidden="true"></span>
				</span> <input type="text" class="form-control" placeholder="用户名"
					aria-describedby="sizing-addon1" name="userName" id="userName">
			</div>

			<div class="input-group input-group-lg"
				style="width: 300px; margin-top: 30px; float: left;">
				<span class="input-group-addon" id="sizing-addon1"> <span
					class="glyphicon glyphicon-lock" aria-hidden="true"></span>
				</span> <input type="text" class="form-control" placeholder="密码"
					aria-describedby="sizing-addon1" name="passWord" id="passWord">
			</div>
		</form>

		<button type="button" class="btn btn-primary" id="btn"
			style="margin-top: 80px; margin-left: 120px;">登录</button>
	</div>
</body>
<script type="text/javascript">
	$("#btn").click(function() {
		var data = {
			userName : $("#userName").val(),
			passWord : $("#passWord").val()
		};
		$.ajax({
			url : "/badLoan/user/login",
			type : "post",
			contentType:"application/json;charset=UTF-8",
			data : JSON.stringify(data),
			success : function(data) {
				if (data == 0) {
					alert("该用户不存在！");
					window.location.href = "login.jsp";
				}
				if (data == 1) {
					alert("登录成功！");
					window.location.href = "home.jsp";
				}
				if(data == 2){
					alert("密码错误，请重新输入！");
					window.location.href = "login.jsp";
				}
			}
		});
	});
</script>
</html>