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
	<form action="${rootPath}user/Discuss_update?di_id=${discu.di_id }" method="post">
		姓名：<input type="text" name="partname" value="${discu.di_participator.pa_name }"><br>
		<input type="hidden" name="partid" value="${discu.di_participator.pa_id }" >
		A类平均分：<input type="text" name="di_averageA" value="${discu.di_averageA }"><br>
		B类平均分：<input type="text" name="di_averageB" value="${discu.di_averageB }"><br>
		C类平均分：<input type="text" name="di_averageC" value="${discu.di_averageC }"><br>
		排名：<input type="text" name="di_rank" value="${discu.di_rank }"><br>
		<input type="submit" value="修改">
	</form>
</body>
</html>