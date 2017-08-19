<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${rootPath}setting/DepartmentManage_add" method="post">
		<lable>单位名称：</lable>
		<input type="text"  name="unit.un_unitName" placeholder="请输入单位名称" ><br>
		 <input type="submit" value="提交">
	</form>
</body>
</html>