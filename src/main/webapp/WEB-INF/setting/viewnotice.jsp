<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专业管理</title>
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
				<td colspan="3">通知信息</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>通知名称</td>
				<td>通知内容</td>
				<td>通知时间</td>
				<td>发布人</td>
			</tr>
			<c:forEach items="${paCut.data}" var="item">
				<tr>
					<td>${item.no_head}</td>
					<td>${item.no_content}</td>
					<td>${item.no_issueDate}</td>
					<td>${item.ma_id}</td>
					<td><a href="${rootPath}setting/Transfer_updateMajors?majorsId=${item.maj_id}">修改</a>
						<a href="${rootPath}setting/MajorsManage_delete?majorsId=${item.maj_id}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pag">
			<ul class="pagination">
				<li><a href="${rootPath}setting/MajorsManage_${method}?page=${pc.prePage}">上一页</a></li>
				<c:forEach var="i" begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
					end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == paCut.currentPage &&i<=3}">
							<li class="active"><a href="${rootPath}setting/MajorsManage_${method}?page=${i}">${i}</a></li>
						</c:when>
						<c:when test="${i>0 && i != paCut.currentPage &&i<=3}">
							<li><a
								href="${rootPath}setting/MajorsManage_${method}?page=${i}">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>

				<li><a href="${rootPath}setting/MajorsManage_${method}?page=${paCut.nextPage}">下一页</a></li>
			</ul>
		</div>
</body>
</html>