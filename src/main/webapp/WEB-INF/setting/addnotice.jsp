<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>${Message}</div>
	<form action="${rootPath}setting/NoticeManage_add" method="post">
		<lable>通知名称：</lable>
		<input type="text" name="notice.no_head" placeholder="请输入通知名称"><br>
		<lable>通知内容：</lable>
		<input type="text" name="notice.no_content" placeholder="请输入通知内容"><br>

		<input type="submit" value="提交">
	</form>
</body>
</html>