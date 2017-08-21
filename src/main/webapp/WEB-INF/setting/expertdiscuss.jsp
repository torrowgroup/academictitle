<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>${message }</center>
<center>
	<c:if test="${fn:length(expertDiscuss.data) > 0 }">
		<table border="1">
			<tr>
				<td>参评人</td>
				<td>申报职称</td>
				<td>熟悉程度</td>
				<td>教育</td>
				<td>科研</td>
				<td>师德</td>
				<td>评分</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${expertDiscuss.data}" var="expertDiscuss">
				<tr>
					<td>${expertDiscuss.re_participator.pa_name}</td>
					<td>${expertDiscuss.re_participator.pa_title.ti_titleName}</td>
					<td>${expertDiscuss.re_unfm}</td>
					<td>${expertDiscuss.re_educate}</td>
					<td>${expertDiscuss.re_scientific}</td>
					<td>${expertDiscuss.re_morality}</td>
					<td>${expertDiscuss.re_score}</td>
					<td><a href="${rootPath}expert/ExpertDiscussAction_toUpdateRecord?re_id=${expertDiscuss.re_id}">修改</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="page" id="div2">
				<ul class="pagination">
					<li><a
						href="${rootPath }expert/ExpertDiscussAction_alreadyDiscuss?page=${alreadyDiscuss.prePage}">上一页</a></li>
					<c:forEach var="i"
						begin="${alreadyDiscuss.currentPage-3>0?alreadyDiscuss.currentPage-3:1 }"
						end="${alreadyDiscuss.currentPage+3>alreadyDiscuss.pageNum?alreadyDiscuss.pageNum:alreadyDiscuss.currentPage+3  }">
						<c:choose>
							<c:when test="${i>0 && i == alreadyDiscuss.currentPage}">
								<li class="active"><a
									href="${rootPath }expert/ExpertDiscussAction_alreadyDiscuss?page=${i }">${i}</a></li>
							</c:when>
							<c:when test="${i>0 && i != alreadyDiscuss.currentPage}">
								<li><a
									href="${rootPath }expert/ExpertDiscussAction_alreadyDiscuss?page=${i }">${i}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<li><a
						href="${rootPath }expert/ExpertDiscussAction_alreadyDiscuss?page=${alreadyDiscuss.nextPage}">下一页</a></li>
				</ul>
			</div>
	</c:if>
	</center>
</body>
</html>