<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专业管理</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td colspan="3">专业信息</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>专业ID</td>
				<td>专业名称</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${paCut.data}" var="item">
				<tr>
					<td>${item.id}</td>
					<td>${item.maiorname}</td>
					<td><a href="${rootPath}setting/MajorsManager_update?majorId=item.id">修改</a>
						<a href="${rootPath}setting/MajorsManager_delete?majorId=item.id">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>