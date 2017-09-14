<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet"
	href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/icon.css" type="text/css"></link>
<link rel="stylesheet" href="../easyui/themes/bootstrap/easyui.css"
	type="text/css"></link>
<link rel="stylesheet" href="../js/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet">
<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<style type="text/css">
#biaoti {
	color: blank
}

#haha {
	margin-left: 150px;
}
</style>
</head>
<body>
	<div class="cotn_principal">
		<h1 style="text-align: center; margin-top: 50px;" id="biaoti">银&nbsp;&nbsp;行&nbsp;&nbsp;不&nbsp;&nbsp;良&nbsp;&nbsp;贷&nbsp;&nbsp;款&nbsp;&nbsp;信&nbsp;&nbsp;息&nbsp;&nbsp;管&nbsp;&nbsp;理&nbsp;&nbsp;系&nbsp;&nbsp;统</h1>
		<div class="cont_centrar" id="haha">
			<div class="cont_login">
				<div class="cont_info_log_sign_up">
					<div class="col_md_login">
						<div class="cont_ba_opcitiy">
							<h2>LOGIN</h2>
							<p>Lorem ipsum dolor sit amet, consectetur.</p>
							<button class="btn_login" onClick="cambiar_login()">登录</button>
						</div>
					</div>
				</div>
				<div class="cont_forms">
					<div class="cont_img_back_">
						<img src="../js/po.jpg" alt="" />
					</div>
					<div class="cont_form_login">
						<a href="#" onClick="ocultar_login_sign_up()"><i
							class="material-icons">&#xE5C4;</i></a>
						<h2>登录</h2>
						<input type="text" placeholder="Email" name="userName"
							id="userName" /> <input type="password" placeholder="Password"
							name="passWord" id="passWord" />
						<button type="button" class="btn_login" id="btn"">登录</button>
					</div>
					<div class="cont_form_sign_up">
						<input type="text" placeholder="Email" /> <input type="password"
							placeholder="Password" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/index.js"></script>
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
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(data),
			success : function(data) {
				if (data == 0) {
					alert("该用户不存在！");
					//window.location.href = "/badLoan/jsp/login.jsp";
					$("#passWord").val("");
				}
				if (data == 1) {
					alert("登录成功！");
					window.location.href = "/badLoan/jsp/home.jsp";
				}
				if (data == 2) {
					alert("密码错误，请重新输入！");
					//window.location.href = "/badLoan/jsp/login.jsp";
					$("#passWord").val("");
				}
			}
		});
	});
</script>
</html>