<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addmanager.css">
</head>
<body>
<div class="header">
        <h1>${message}</h1>
        <form action="${rootPath}user/Manager_add" method="post">
            <label>账号：</label>
            <input class="in" type="text" name="ma_userName"><br>
            <label>密码：</label >
            <input class="in" type="text" name="ma_password"><br>
            <label>姓名：</label>
            <input class="in" type="text" name="ma_name"><br>
           	<input class="btn" type="submit" value="提交">
        </form>
    </div>
<%-- <center>${message}</center> --%>
<%-- 	<form action="${rootPath}user/Manager_add" method="post"> --%>
<!-- 		账号：<input type="text" name="ma_userName"><br> -->
<!-- 		密码：<input type="text" name="ma_password"><br> -->
<!-- 		姓名：<input type="text" name="ma_name"><br> -->
<!-- 		<input type="submit" value="提交"> -->
<!-- 	</form> -->
</body>
</html>