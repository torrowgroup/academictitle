<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatemanager.css">
</head>
<body>
	<div class="header">
		<center>${message}</center>
		<form action="${rootPath}user/Manager_updateMyself?ma_id=${messagenews.ma_id}" method="post">
			<label>账号：</label><input type="text" class="a" name="ma_userName" value="${messagenews.ma_userName}"><br>
			<label>密码：</label><input type="text" class="a" name="ma_password" value="${messagenews.ma_password}"><br>
			<label>姓名：</label><input type="text" class="a" name="ma_name" value="${messagenews.ma_name}"><br>
			<input type="submit" class="b" value="修改">
		</form>
	</div>
</body>
</html>