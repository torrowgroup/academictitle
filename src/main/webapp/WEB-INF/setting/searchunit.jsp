<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>majorsmanage</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/majorsmanage.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/bootstrap.css">
	<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/font-awesome.css">
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
</head>
<body>

	<td>${Message}</td>
	<div class="top">
		<div class="right">
			<form action="${rootPath}setting/DepartmentManage_searchUnit"
				method="post" onsubmit="return check()">
				<input type="text" name="unitName" placeholder=" 请输入所要查询部门名称">
				<input type="submit" value="搜索">
			</form>
		</div>
		<table border="1" cellspacing="0">
			<caption>部门信息</caption>
			<tr>
				<th>部门ID</th>
				<th>部门名称</th>
				<th>操作</th>
			</tr>
				<tr>
					<td>${unit.un_id}</td>
					<td>${unit.un_unitName}</td>
					<td width="120px"><a style="position: absolute; left: 25px; top: 8px;"
						href="${rootPath}setting/Transfer_updateUnit?unitId=${unit.un_id}">
							<img src="${rootPath}images/edit.png" width="18px" style="float:left;margin-left:0px">
					</a> <a style="position: absolute; right: 25px; top: 8px;"
						href="${rootPath}setting/DepartmentManage_delete?unitId=${unit.un_id}">
							<img src="${rootPath}images/delete.png" width="18px" style="float:left;margin-left:0px">
					</a></td>
				</tr>
		</table>>
</body>
</html>