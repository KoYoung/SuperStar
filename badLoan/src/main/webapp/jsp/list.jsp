<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!--web路径：
	不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出现问题。
	以/开始的相对路径，找资源，以服务器的相对路径为标准(http://localhost:3306) ;需要加上项目名
	 		http://localhost:3306/crud
	
 -->
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
 <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row"></div>
		<div class="row"></div>
		<div class="row"></div>
	</div>
	
</body>
</html>