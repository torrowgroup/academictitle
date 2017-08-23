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
	float: left;
	margin-top: 30px;
	margin-right: 0px;
}
</style>
</head>
<body>
<td>${Message}</td>
  <form action="${rootPath}setting/DepartmentManage_searchUnit" method="post"  onsubmit="return check()">
    <input type="text" class="input1" name="unitName" placeholder="请输入所要查询部门名称">
    <button class="input2"  >搜&nbsp;索</button>
    </form>
	<table>
		<thead>
			<tr>
				<td colspan="3">部门信息</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>部门ID</td>
				<td>部门名称</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${paCut.data}" var="item">
				<tr>
					<td>${item.un_id}</td>
					<td>${item.un_unitName}</td>
					<td><a href="${rootPath}setting/Transfer_updateUnit?unitId=${item.un_id}">修改</a>
						<a href="${rootPath}setting/DepartmentManage_delete?unitId=${item.un_id}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pag">
			<ul class="pagination">
				<li><a href="${rootPath}setting/DepartmentManage_${Method}?page=${paCut.prePage}">上一页</a></li>
				<c:forEach var="i" begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
					end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == paCut.currentPage}">
							<li class="active"><a
								href="${rootPath}setting/DepartmentManage_${Method}?page=${i}">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != paCut.currentPage}">
							<li><a
								href="${rootPath}setting/DepartmentManage_${Method}?page=${i}">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>

				<li><a href="${rootPath}setting/DepartmentManage_${Method}?page=${paCut.nextPage}">下一页</a></li>
			</ul>
		</div>
</body>
</html>