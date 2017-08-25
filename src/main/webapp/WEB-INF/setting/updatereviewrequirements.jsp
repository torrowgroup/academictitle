<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/setting/addadress.css">
</head>
<form action="${rootPath}setting/ReviewRequirementsManage_update" method="post">
	<span>评议ID：</span>
	<input type="text"  name="req.re_id"  value="${req.re_id} " readonly="readonly" ><br>
		<span>教学方面：</span>
		<input type="text"  name="req.re_educate"  value="${req.re_educate} " ><br>
		<span>科研方面：</span>
		<input type="text"  name="req.re_scientific" value="${req.re_scientific} " ><br>
		<span>师德方面：</span>
		<input type="text"  name="req.re_morality"  value="${req.re_morality }" ><br>
		 <input class="btn" type="submit" value="提交">
	</form>
<body>
</body>
</html>