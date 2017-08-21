<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<details style="width:200px"> 
		<summary>专业管理</summary>
		<a href="${rootPath}setting/MajorsManage_view" target="mainiframe">查看专业</a><br> 
		<a href="${rootPath}setting/Transfer_addMajors" target="mainiframe">添加专业</a><br>     
     </details>
     <details style="width:200px" >
		<summary>单位管理</summary>
		<a href="${rootPath}setting/DepartmentManage_view" target="mainiframe">查看单位</a><br> 
		<a href="${rootPath}setting/Transfer_addUnit" target="mainiframe">添加单位</a><br>     
     </details>
     <details  style="width:200px">
		<summary>职称管理</summary>

		<a href="${rootPath}/setting/TitleManage_view" target="mainiframe">查看职称</a><br> 
		<a href="${rootPath}/setting/Transfer_addTitle" target="mainiframe">添加职称</a><br>
		<a href="${rootPath}user/Expert_relay" target="mainiframe">添加管理员</a><br>
		<a href="${rootPath}user/Expert_select?ask=all" target="in">添加管理员</a><br>    	
     </details>
     <details  style="width:200px">
		<summary>评议要求管理</summary>
		<a href="${rootPath}setting/ReviewRequirementsManage_view" target="mainiframe">查看评议要求</a><br> 
		<a href="${rootPath}setting/Transfer_addReviewRequirements" target="mainiframe">添加评议要求</a><br>     
     </details>
</body>
<iframe id="ifr" width="1500px" height="600px" style="margin-left:100px; margin-top:-60px;"  name="mainiframe"></iframe>
</html>