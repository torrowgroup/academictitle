<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
		<thead>
			<tr>
				<td colspan="3">专业信息</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>专业编号</td>
				<td>专业名称</td>
				<td>操作</td>
			</tr>
				<tr>
					<td>${majors.maj_id}</td>
					<td>${majors.maj_majorName}</td>
					<td><a href="${rootPath}setting/Transfer_updateMajors?majorsId=${majors.maj_id}">修改</a>
						<a href="${rootPath}setting/MajorsManage_delete?majorsId=${majors.maj_id}">删除</a>
					</td>
				</tr>
		</tbody>
	</table>
</body>
</html>