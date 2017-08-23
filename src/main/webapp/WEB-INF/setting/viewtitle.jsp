<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职称管理</title>
<style >
.pag {
	float: right;
	margin-top: 30px;
	margin-right: 0px;
}
</style>
</head>
<body>
	<a href="${rootPath}/setting/Transfer_addTitle" target="mainiframe">添加职称</a><br>
  <form action="${rootPath}setting/TitleManage_searchTitle" method="post"  onsubmit="return check()">
    <input type="text" class="input1" name="titleName" placeholder="请输入所要查询职称名称">
    <button class="input2"  >搜&nbsp;索</button>
    </form>
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
			<c:forEach items="${paCut.data}" var="item">
				<tr>
					<td>${item.ti_id}</td>
					<td>${item.ti_titleName}</td>
					<td><a href="${rootPath}setting/Transfer_updateTitle?titleId=${ item.ti_id}">修改</a>
						<a href="${rootPath}setting/TitleManage_delete?titleId=${item.ti_id}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pag">
			<ul class="pagination">
				<li><a href="${rootPath}setting/TitleManage_${method}?page=${paCut.prePage}">上一页</a></li>
				<c:forEach var="i" begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
					end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == paCut.currentPage &&i<=3}">
							<li class="active"><a
								href="${rootPath}setting/TitleManage_${method}?page=${i}">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != paCut.currentPage &&i<=3}">
							<li><a
								href="${rootPath}setting/TitleManage_${method}?page=${i}">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>

				<li><a href="${rootPath}setting/TitleManage_${method}?page=${paCut.nextPage}">下一页</a></li>
			</ul>
		</div>
</body>
</html>