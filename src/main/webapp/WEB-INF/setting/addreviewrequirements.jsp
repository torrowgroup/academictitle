<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/setting/addadress.css">
<style>
.tilp{
  padding-top:50px;
  font-size:26px;
  text-align:center;
  font-family:"华文行楷","微软雅黑";
  text-shadow: 3px 3px 6px rgba(0,0,0,.4);

}
</style>
</head>
<body>
<div class="tilp">${Message}</div>
	<form action="${rootPath}setting/ReviewRequirementsManage_add" method="post">
	<span>请选择职称</span>
	<select name="titleId" class="select"> 
 			<c:forEach items="${reqlist}" var="item">
 	           <option value="${item.ti_id}">${item.ti_titleName}</option> 
         	</c:forEach> 
 	</select><br><br>
		<span>教学方面：</span>
		<input type="text"  name="req.re_educate" placeholder="请输入教学要求标准" ><br>
		<span>科研方面：</span>
		<input type="text"  name="req.re_scientific" placeholder="请输入科研要求标准" ><br>
		<span>师德方面：</span>
		<input type="text"  name="req.re_morality"  placeholder="请输入专业要求标准" ><br>
		 <input class="btn"  type="submit" value="提交">
	</form>
</body>
</html>