<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<td>${Message}</td>
<table>
		<thead>
			<tr>
				<td colspan="3">职称信息</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>职称ID</td>
				<td>职称名称</td>
				<td>操作</td>
			</tr>
			
				<tr>
					<td>${title.ti_id}</td>
					<td>${title.ti_titleName}</td>
					<td><a href="${rootPath}setting/Transfer_updateTitle?titleId=${ title.ti_id}">修改</a>
						<a href="${rootPath}setting/TitleManage_delete?titleId=${title.ti_id}">删除</a>
					</td>
				</tr>
			
		</tbody>
	</table>
</body>
</html>