<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatemanager.css">
</head>
<body>
  <div class="header">
	<form action="${rootPath}user/Manager_update?ma_id=${messagenews.ma_id}" method="post">
		<label>邮箱：</label><input class="a" type="email" name="ma_userName" value="${messagenews.ma_userName}" placeholder="请输入邮箱" required><br>
		<label>密码：</label><input class="a" type="text" name="ma_password" value="${messagenews.ma_password}" required><br>
		<label>姓名：</label><input class="a" type="text" name="ma_name" value="${messagenews.ma_name}" required><br>
		<input class="b" type="submit" value="修改">
	</form>
  </div>
</body>
</html>