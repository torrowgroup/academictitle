<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/setting/addadress.css">
</head>
<body>
	<center>${Message}</center>
	<form action="${rootPath}setting/DepartmentManage_add" method="post">
		<span>单位名称:</span>
		<input type="text"  name="unit.un_unitName" placeholder="请输入单位名称" ><br>
		 <input class="btn" type="submit" value="提交">
	</form>
</body>
</html>