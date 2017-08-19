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
<center>${message}</center>
	<form action="${rootPath}user/Expert_add" method="post">
		账号：<input type="text" name="ex_userName"><br>
		密码：<input type="text" name="ex_password"><br>
		姓名：<input type="text" name="ex_name"><br>
		专业：<select name="majorName">
			<c:forEach items="${majors}" var="item">
					<option value="${item.maj_majorName}">${item.maj_majorName}</option>
			</c:forEach>
		</select><br>
		单位：<select name="unitName">
			<c:forEach items="${unit}" var="item">
					<option value="${item.un_unitName}">${item.un_unitName}</option>
			</c:forEach>
		</select><br>
		职称：<select name="titleName">
			<c:forEach items="${title}" var="item">
					<option value="${item.ti_titleName}">${item.ti_titleName}</option>
			</c:forEach>
		</select><br>
		学历：<select name="education">
					<option value="本科">本科</option>
					<option value="研究生">研究生</option>
					<option value="硕士">硕士</option>
					<option value="博士">博士</option>
					<option value="博士后">博士后</option>
					<option value="副教授">副教授</option>
					<option value="教授">教授</option>
		</select><br>
		<input type="submit" value="提交">
	</form>
</body>
</html>