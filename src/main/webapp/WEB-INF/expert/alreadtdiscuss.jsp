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
	<table>
		<tr>
			<td>参评人</td>
		</tr>
		<tr>
			<td>熟悉程度</td>
		</tr>
		<tr>
			<td>教育</td>
		</tr>
		<tr>
			<td>科研</td>
		</tr>
		<tr>
			<td>师德</td>
		</tr>
		<tr>
			<td>总分</td>
		</tr>
		<tr>
			<td>参评人</td>
		</tr>
		<c:forEach items="${allRecord}" var="allRecord">
			<tr>
				<td>${allRecord.re_participator.pa_name}</td>
			</tr>
			<tr>
				<td>${allRecord.re_unfm}</td>
			</tr>
			<tr>
				<td>${allRecord.re_educate}</td>
			</tr>
			<tr>
				<td>${allRecord.re_scientific}</td>
			</tr>
			<tr>
				<td>${allRecord.re_morality}</td>
			</tr>
			<tr>
				<td>${allRecord.re_participator.pa_name}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>