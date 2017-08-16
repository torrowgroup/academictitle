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
<center>${message }</center>
<center>
	<table border="1">
		<tr>
			<td>参评人</td>
			<td>熟悉程度</td>
			<td>教育</td>
			<td>科研</td>
			<td>师德</td>
			<td>总分</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${alreadyDiscuss}" var="alreadyDiscuss">
			<tr>
				<td>${alreadyDiscuss.re_participator.pa_name}</td>
				<td>${alreadyDiscuss.re_unfm}</td>
				<td>${alreadyDiscuss.re_educate}</td>
				<td>${alreadyDiscuss.re_scientific}</td>
				<td>${alreadyDiscuss.re_morality}</td>
				<td>${alreadyDiscuss.re_score}</td>
				<td><a href="">修改</a></td>
			</tr>
		</c:forEach>
	</table>
	</center>
</body>
</html>