<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addmanager.css">
<style>
	.tilp{
	  padding-top:20px;
	  font-size:26px;
	  text-align:center;
	  font-family:"华文行楷","微软雅黑";
	  text-shadow: 3px 3px 6px rgba(0,0,0,.4);
	
	}
</style>
</head>
<body>
<div class="tilp">${message}</div>
<div class="header">
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