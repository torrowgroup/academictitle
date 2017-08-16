<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table cecellspacing="0" border="1">
		<thead>
			<tr>
				<td colspan="5">管理员信息</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>编号</td>
				<td>用户名</td>
				<td>密码</td>
				<td>姓名</td>
				<td>操作</td>
			</tr>
		<c:forEach items="${message.data}" var="item">
			<tr>
				<td>${item.ma_id}</td>
				<td>${item.ma_userName}</td>
				<td>${item.ma_password}</td>
				<td>${item.ma_name}</td>
				<td><a href="${rootPath}user/Manager_toUpdate?ma_id=${item.ma_id}"></a>&nbsp;&nbsp;&nbsp;<a href="${rootPath}user/Manager_delet?ma_id=${item.ma_id}"></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
			<ul >
				<li><a
					href="${rootPath}user/Manager_select?page=${message.prePage}">上一页</a></li>
				<c:forEach var="i" begin="${message.currentPage-3>0?message.currentPage-3:1 }"
					end="${message.currentPage+3>message.pageNum?message.pageNum:message.currentPage+3  }">

					<c:choose>
						<c:when test="${i>0 && i == message.currentPage}">
							<li class="active"><a
								href="${rootPath}user/Manager_select?page=${i }">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != postPS.currentPage}">
							<li><a
								href="${rootPath}user/Manager_select?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a
					href="${rootPath}user/Manager_select?page=${message.nextPage}">下一页</a></li>
			</ul>
		</div>
</body>
</html>