<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addexpert.css">
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
<div class="wall">
        <form action="${rootPath}user/Expert_add" method="post">
            <label>邮箱:</label>
            <input type="email" name="ex_userName" required style="border-radius:5px;margin-left:15px;height:33px;width:150px;"><br>
            <label>密码:</label>
            <input type="text" name="ex_password" required><br>
            <label>姓名:</label>
            <input type="text" name="ex_name" required><br>
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
            <select name="ex_education">
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
</body>
</html>