<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${rootPath}css/setting/addadress.css">
<title>Insert title here</title>
</head>
<body>
	<div>${Message}</div>
	<form action="${rootPath}setting/NoticeManage_add" method="post">
		<span>通知名称：</span>
		<input type="text" name="notice.no_head" placeholder="请输入通知名称"><br>
		<span>通知内容：</span>
		<input type="text" name="notice.no_content" placeholder="请输入通知内容"><br>

		<input  class="btn" type="submit" value="提交">
	</form>
</body>
</html>