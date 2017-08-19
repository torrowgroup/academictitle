<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<table>
		<tr>
			<td>标题</td>
			<td>发布时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${allNotice}" var="allNotice">
			<tr>
				<td>${allNotice.no_head}</td>
			</tr>
		</c:forEach>
	</table>
</center>
</body>
</html>