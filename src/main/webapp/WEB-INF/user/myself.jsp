<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>${message}</center>
	<form action="${rootPath}user/Manager_updateMyself?ma_id=${messagenews.ma_id}" method="post">
		账号：<input type="text" name="ma_userName" value="${messagenews.ma_userName}"><br>
		密码：<input type="text" name="ma_password" value="${messagenews.ma_password}"><br>
		姓名：<input type="text" name="ma_name" value="${messagenews.ma_name}"><br>
		<input type="submit" value="修改">
	</form>
</body>
</html>