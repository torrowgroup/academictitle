<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/addadress.css">
</head>
<body>
	<form action="${rootPath}setting/TitleManage_update" method="post">
		<span>职称ID：</span> <input type="text" name="title.ti_id" style="margin-left:20px;"
			value="${title.ti_id} " readonly="readonly"><br> <span>职称名称：</<span>
				<input type="text" name="title.ti_titleName" value="${title.ti_titleName}" maxlength='15'><br> 
				<input class="btn"type="submit" value="提交">
	</form>
</body>
</html>