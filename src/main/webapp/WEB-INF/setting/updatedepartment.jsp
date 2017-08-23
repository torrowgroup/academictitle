<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>majorsmanage</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/setting/addadress.css">
</head>
<body>
	<div class="top">
<form action="${rootPath}setting/DepartmentManage_update" method="post">
<span>部门ID:</span>
		<input type="text"  name="unit.un_id"  value="${unit.un_id} "  readonly="readonly"  ><br>
		<span>部门名称:</span>
		<input type="text"  name="unit.un_unitName" value="${unit.un_unitName}"" ><br>
		 <input class="btn" type="submit" value="提交">
	</form>
</body>
</html>