<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知管理</title>
<style >
.pag {
	float: right;
	margin-top: 30px;
	margin-right: 0px;
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td colspan="4">通知信息</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>通知名称</td>
				<td>通知详情</td>
				
			</tr>
				<tr>
					<td>${notice.no_head}</td>
					<td>${notice.no_content}</td> 
					
				</tr>
		</tbody>
	</table>
	
</body>
</html>