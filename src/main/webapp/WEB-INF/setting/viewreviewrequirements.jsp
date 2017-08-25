<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<c:if test="${fn:length(paCut.data) > 0 }">
	<body>
		<div class="top">
			<div class="right">
				<form
					action="${rootPath}setting/ReviewRequirementsManage_searchRequire"
					method="post" onsubmit="return check()">
					<input type="text" name="titleName"
						placeholder=" 请输入所要查询评议要求相关职称名称"> <input type="submit"
						value="搜索">
				</form>
			</div>
			<table border="1" cellspacing="0">
				<caption>评议要求信息</caption>
				<tr>
					<th width="200px">职称名称</th>
					<th width="250px">操作</th>
				</tr>
				<c:forEach items="${paCut.data}" var="item">
					<tr>
						<td><a
							href="${rootPath}setting/ReviewRequirementsManage_getDetails?requireId=${item.re_id}">${item.re_title.ti_titleName}</a></td>
						<td width="150px"><a
							style="position: absolute; left: 5px; top: 8px;"
							href="${rootPath}setting/ReviewRequirementsManage_getDetails?requireId=${item.re_id}">
								<img src="${rootPath}images/view.png" width="20px"
								style="float: left; margin-left: 20px">
						</a> <a style="position: absolute; left: 45px; top: 8px;"
							href="${rootPath}setting/Transfer_updateRequire?requireId=${item.re_id}">
								<img src="${rootPath}images/edit.png" width="20px"
								style="float: left; margin-left: 70px">
						</a> <a style="position: absolute; right: 25px; top: 8px;"
							href="${rootPath}setting/ReviewRequirementsManage_delete?requireId=${item.re_id}">
								<img src="${rootPath}images/delete.png" width="20px"
								style="float: left; margin-left: 0px">
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
		</div>
</c:if>
<div class="side">
	<a href="${rootPath}setting/Transfer_addReviewRequirements"><img
		src="${rootPath}images/require.png" width="100px"></a>
</div>
</body>
</html>