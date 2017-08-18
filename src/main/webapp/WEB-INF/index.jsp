<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<details >
		<summary>专业管理</summary>
		<a href="${path}/setting/MajorManage_view" target="in">查看专业</a><br> 
		<a href="${path}/setting/MajorManage_add" target="in">添加专业</a><br>     
     </details>
     <details >
		<summary>单位管理</summary>
		<a href="${path}/setting/DepartmentManage_view" target="in">查看单位</a><br> 
		<a href="${path}/setting/DepartmentManage_add" target="in">添加单位</a><br>     
     </details>
     <details >
		<summary>职称管理</summary>
		<a href="${path}/setting/TitleManage_view" target="in">查看职称</a><br> 
		<a href="${path}/setting/TitleManage_add" target="in">添加职称</a><br>
		<a href="${rootPath}user/Manager_relay" target="in">添加管理员</a><br>
		<a href="${rootPath}user/Manager_select?ask=all" target="in">添加管理员</a><br>
     </details>
</body>
</html>