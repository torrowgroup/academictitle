<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${rootPath}setting/TitleManage_update" method="post">
<lable>职称ID：</lable>
		<input type="text"  name="title.ti_id"  value="${title.ti_id} "  readonly="readonly"  ><br>
		<lable>职称名称：</lable>
		<input type="text"  name="title.ti_titleName" value="${title.ti_titleName}"" ><br>
		 <input type="submit" value="提交">
	</form>
</body>
</html>