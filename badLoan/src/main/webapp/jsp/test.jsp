<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
	<form id="ff" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>抵（质）押物品照片:</td>
				<td>
					<div class="img-container"></div> <input class="img-btn"
					type="file" id="drivingLicence" name="borPhoto" />
			</tr>
			<tr>
				<td>抵（质）押物品照片:</td>
				<td>
					<div class="img-container"></div> <input class="img-btn"
					type="file" id="drivingLicence" name="borPhoto" />
			</tr>
		</table>
		<button id="aa">dd</button>
	</form>
	<script type="text/javascript">
	$("#aa").click(function(){
		$('#ff').form('submit', {
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
	});
	</script>
</body>
</html>