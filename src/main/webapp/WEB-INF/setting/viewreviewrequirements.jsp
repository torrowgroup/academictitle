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
</head>
<body>
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
			<c:forEach items="${paCut.data}" var="item">
				<tr>
					<td>${item.re_title.ti_titleName}</td>
					<td>${item.re_educate}</td>
					<td>${item.re_scientific}</td>
					<td>${item.re_morality}</td>
					<td><a style="position: absolute; left: 25px; top: 8px;"
						href="${rootPath}setting/Transfer_updateRequire?requireId=${item.re_id}">
							<span class="glyphicon glyphicon-pencil"></span>
					</a> <a style="position: absolute; right: 25px; top: 8px;"
						href="${rootPath}setting/ReviewRequirementsManage_delete?requireId=${item.re_id}">
							<span class="glyphicon glyphicon-trash"></span>
					</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="page">
			<ul class="pagination">
				<li><a
					href="${rootPath}setting/ReviewRequirementsManage_${method}?page=${paCut.prePage}">上一页</a></li>
				<c:forEach var="i"
					begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
					end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == paCut.currentPage &&i<=3}">
							<li class="active"><a
								href="${rootPath}setting/ReviewRequirementsManage_${method}?page=${i}">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != paCut.currentPage &&i<=3}">
							<li><a
								href="${rootPath}setting/ReviewRequirementsManage_${method}?page=${i}">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a
					href="${rootPath}setting/ReviewRequirementsManage_${method}?page=${paCut.nextPage}">下一页</a></li>
			</ul>
		</div>
</body>
</html>