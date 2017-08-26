<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updatemanager.css">
<style>
.tilp{
  padding-top:20px;
  font-size:26px;
  text-align:center;
  font-family:"华文行楷","微软雅黑";
  text-shadow: 3px 3px 6px rgba(0,0,0,.4);

}
</style>
</head>
<body>
<div class="tilp">${message}</div>
	<div class="header">
		<form action="${rootPath}user/Manager_updateMyself?ma_id=${messagenews.ma_id}" method="post">
			<label>邮箱：</label><input type="text" class="a" name="ma_userName" value="${messagenews.ma_userName}" required><br>
			<label>密码：</label><input type="text" class="a" name="ma_password" value="${messagenews.ma_password}" required><br>
			<label>姓名：</label><input type="text" class="a" name="ma_name" value="${messagenews.ma_name}" required><br>
			<input type="submit" class="b" value="修改">
		</form>
	</div>
</body>
</html>