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
<center>#{message}</center>
<form action="${rootPath}user/Participator_add" method="post" enctype="multipart/form-data">
		姓名：<input type="text" name="pa_name">
		专业：<select name="majorid">
			<c:forEach items="${majors}" var="item">
					<option value="${item.maj_id}">${item.maj_majorName}</option>
			</c:forEach>
		</select><br>
		单位：<select name="unitid">
			<c:forEach items="${unit}" var="item">
					<option value="${item.un_id}">${item.un_unitName}</option>
			</c:forEach>
		</select>
		职称：<select name="titleid">
			<c:forEach items="${title}" var="item">
					<option value="${item.ti_id}">${item.ti_titleName}</option>
			</c:forEach>
		</select><br>
		<input type="file" name="file" class="file" accept="image/*" value="选择图片"><br>
			<marquee behavior="scroll">
				<p>温馨提示：不可以上传中文名称图片！</p>
			</marquee>
		简介：<input name="pa_introduce"><br>
		<input type="submit" value="提交">
	</form>

</body>
</html>