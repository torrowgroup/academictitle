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
			<td>申报职称</td>
			<td>单位</td>
			<td>专业</td>
			<td>图片</td>
			<td>简介</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${noDiscuss}" var="noDiscuss">
			<tr>
				<td>${noDiscuss.pa_name}</td>
				<td>${noDiscuss.pa_title.ti_titleName}</td>
				<td>${noDiscuss.pa_unit.un_unitName}</td>
				<td>${noDiscuss.pa_majors.maj_majorName}</td>
				<td><img alt="加载中" src=""></td>
				<td>
					<textarea rows="2" cols="30">${noDiscuss.pa_introduce}</textarea>
				</td>
				<td><a href="${rootPath}expert/ExpertDiscussAction_toDiscuss?pa_id=${noDiscuss.pa_id}">评议</a></td>
			</tr>
		</c:forEach>
	</table>
</center>
</body>
</html>