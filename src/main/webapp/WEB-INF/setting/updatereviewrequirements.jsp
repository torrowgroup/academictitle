<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<form action="${rootPath}setting/ReviewRequirementsManage_update" method="post">
	
		<lable>教学方面：</lable>
		<input type="text"  name="req.re_educate"  placeholder="${req.re_educate} }" ><br>
		<lable>科研方面：</lable>
		<input type="text"  name="req.re_scientific" placeholder="${req.re_scientific} " ><br>
		<lable>师德方面：</lable>
		<input type="text"  name="req.re_morality"  placeholder="${req.re_morality }" ><br>
		 <input type="submit" value="提交">
	</form>
<body>
</body>
</html>