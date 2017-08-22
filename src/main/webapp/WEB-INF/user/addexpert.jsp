<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addexpert.css">
</head>
<body>
<div class="wall">
        <h1>${message}</h1>
        <form action="${rootPath}user/Expert_add" method="post">
            <label>账号:</label>
            <input type="text" name="ex_userName"><br>
            <label>密码:</label>
            <input type="text" name="ex_password"><br>
            <label>姓名:</label>
            <input type="text" name="ex_name"><br>
            <label>专业:</label>
            <select name="majorid">
                <c:forEach items="${majors}" var="item">
					<option value="${item.maj_id}">${item.maj_majorName}</option>
				</c:forEach>
            </select><br>
            <label>单位:</label>
            <select name="unitid">
                <c:forEach items="${unit}" var="item">
					<option value="${item.un_id}">${item.un_unitName}</option>
				</c:forEach>
            </select><br>
            <label>职称:</label>
            <select name="titleid">
                <c:forEach items="${title}" var="item">
					<option value="${item.ti_id}">${item.ti_titleName}</option>
				</c:forEach>
            </select><br>
            <label>学历:</label>
            <select name="education">
               	<option value="本科">本科</option>
				<option value="研究生">研究生</option>
				<option value="硕士">硕士</option>
				<option value="博士">博士</option>
				<option value="博士后">博士后</option>
				<option value="副教授">副教授</option>
				<option value="教授">教授</option>
            </select><br>
            <input class="btn" type="submit" value="提交">
        </form>
    </div>


<%-- <center>${message}</center> --%>
<%-- 	<form action="${rootPath}user/Expert_add" method="post"> --%>
<!-- 		账号：<input type="text" name="ex_userName"><br> -->
<!-- 		密码：<input type="text" name="ex_password"><br> -->
<!-- 		姓名：<input type="text" name="ex_name"><br> -->
<!-- 		专业：<select name="majorid"> -->
<%-- 			<c:forEach items="${majors}" var="item"> --%>
<%-- 					<option value="${item.maj_id}">${item.maj_majorName}</option> --%>
<%-- 			</c:forEach> --%>
<!-- 		</select><br> -->
<!-- 		单位：<select name="unitid"> -->
<%-- 			<c:forEach items="${unit}" var="item"> --%>
<%-- 					<option value="${item.un_id}">${item.un_unitName}</option> --%>
<%-- 			</c:forEach> --%>
<!-- 		</select><br> -->
<!-- 		职称：<select name="titleid"> -->
<%-- 			<c:forEach items="${title}" var="item"> --%>
<%-- 					<option value="${item.ti_id}">${item.ti_titleName}</option> --%>
<%-- 			</c:forEach> --%>
<!-- 		</select><br> -->
<!-- 		学历：<select name="education"> -->
<!-- 		</select><br> -->
<!-- 		<input type="submit" value="提交"> -->
<!-- 	</form> -->
</body>
</html>