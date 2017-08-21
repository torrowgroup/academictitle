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
	<center>${message }</center>
	<center>
		<form action="${rootPath}expert/ExpertDiscussAction_noDiscuss" method="post">
			<input type="text" name="inquiry" placeholder="输入想要查询的内容" /> 
			<input type="submit" value="查询" />
		</form>
		<table border="1">
			<tr>
				<td>参评人</td>
				<td>申报职称</td>
				<td>单位</td>
				<td>专业</td>
				<td>图片</td>
				<td>简介</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${noDiscuss.data}" var="noDiscuss">
				<tr>
					<td>${noDiscuss.pa_name}</td>
					<td>${noDiscuss.pa_title.ti_titleName}</td>
					<td>${noDiscuss.pa_unit.un_unitName}</td>
					<td>${noDiscuss.pa_majors.maj_majorName}</td>
					<td><img alt="加载中" src=""></td>
					<td><textarea rows="2" cols="30">${noDiscuss.pa_introduce}</textarea>
					</td>
					<td><a
						href="${rootPath}expert/ExpertDiscussAction_toDiscuss?pa_id=${noDiscuss.pa_id}">评议</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="page" id="div2">
			<ul class="pagination">
				<li><a
					href="${rootPath }expert/ExpertDiscussAction_noDiscuss?page=${noDiscuss.prePage}">上一页</a></li>
				<c:forEach var="i"
					begin="${noDiscuss.currentPage-3>0?noDiscuss.currentPage-3:1 }"
					end="${noDiscuss.currentPage+3>noDiscuss.pageNum?noDiscuss.pageNum:noDiscuss.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == noDiscuss.currentPage}">
							<li class="active"><a
								href="${rootPath }expert/ExpertDiscussAction_noDiscuss?page=${i }">${i}</a></li>
						</c:when>
						<c:when test="${i>0 && i != noDiscuss.currentPage}">
							<li><a
								href="${rootPath }expert/ExpertDiscussAction_noDiscuss?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a
					href="${rootPath }expert/ExpertDiscussAction_noDiscuss?page=${noDiscuss.nextPage}">下一页</a></li>
			</ul>
		</div>
	</center>
</body>
</html>