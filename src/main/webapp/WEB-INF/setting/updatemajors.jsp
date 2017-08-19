<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${rootPath}setting/MajorsManage_update" method="post">
<lable>专业ID：</lable>
		<input type="text"  name="majors.maj_id"  value="${majors.maj_id} "  readonly="readonly"  ><br>
		<lable>专业名称：</lable>
		<input type="text"  name="majors.maj_majorName" value="${majors.maj_majorName}"" ><br>
		 <input type="submit" value="提交">
	</form>
</body>
</html>