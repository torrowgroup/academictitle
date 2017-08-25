<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addmanager.css">
</head>
<body>
<div class="header">
        <h3>${message}</h3>
        <form action="${rootPath}user/Manager_add" method="post">
            <label>邮箱：</label>
            <input class="in" type="email" name="ma_userName" required><br>
            <label>密码：</label >
            <input class="in" type="text" name="ma_password" required><br>
            <label>姓名：</label>
            <input class="in" type="text" name="ma_name" required><br>
           	<input class="btn" type="submit" value="提交">
        </form>
    </div>
</body>
</html>