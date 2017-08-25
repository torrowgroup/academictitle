<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>majorsmanage</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/majorsmanage.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/bootstrap.css">
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
<style type="text/css">
.side {
	width: 100px;
	height: 32px;
	background-color: rgba(0, 0, 0, .4);
	position: fixed;
	right: 10px;
	top: 40%;
}
</style>
</head>
<body>
<div class="tilp">${Message}</div>
 <c:if test="${ not empty require}">
	<div class="top">
		<div class="right">
			<form
				action="${rootPath}setting/ReviewRequirementsManage_searchRequire"
				method="post" onsubmit="return check()">
				<input type="text" name="titleName" placeholder=" 请输入所要查询评议要求相关职称名称">
				<input type="submit" value="搜索">
			</form>
		</div>
		<table border="1" cellspacing="0">
			<caption>评议要求信息</caption>
			<tr>
				<th>职称名称</th>
				<th>教学方面</th>
				<th>科研方面</th>
				<th>师德</th>
				<th>操作</th>
			</tr>
				<tr>
					<td>${require.re_title.ti_titleName}</td>
					<td>${require.re_educate}</td>
					<td>${require.re_scientific}</td>
					<td>${require.re_morality}</td>
					<td width="120px"><a style="position: absolute; left: 25px; top: 8px;"
						href="${rootPath}setting/Transfer_updateRequire?requireId=${require.re_id}">
							<img src="${rootPath}images/edit.png" width="18px" style="float:left;margin-left:0px">
					</a> <a style="position: absolute; right: 25px; top: 8px;"
						href="${rootPath}setting/ReviewRequirementsManage_delete?requireId=${require.re_id}">
							<img src="${rootPath}images/delete.png" width="18px" style="float:left;margin-left:0px">
					</a></td>
				</tr>
		</table>
		</div>
		</c:if>
		<div class="side">
	<a href="${rootPath}setting/Transfer_addReviewRequirements"><img
		src="${rootPath}images/require.png" width="100px"></a>
</div>
</body>
</html>