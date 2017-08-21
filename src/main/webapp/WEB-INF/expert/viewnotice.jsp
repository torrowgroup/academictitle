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
	<center>
		${message}
		<c:if test="${fn:length(pCut.data) > 0 }">
			<form action="${rootPath}expert/ExpertNotice_allNotice" method="post">
				<input type="text" name="inquiry" placeholder="输入想要查询的内容" /> <input
					type="submit" value="查询" />
			</form>
			<table border="1">
				<tr>
					<td>标题</td>
					<td>发布时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${pCut.data}" var="allNotice">
					<tr>
						<td>${allNotice.no_head}</td>
						<td>${allNotice.no_issueData}</td>
						<td><a
							href="${rootPath}expert/ExpertNotice_noticeDetail?no_id=${allNotice.no_id}">查看详情</a></td>
					</tr>
				</c:forEach>
			</table>
			<div class="page" id="div2">
				<ul class="pagination">
					<li><a
						href="${rootPath }expert/ExpertNotice_allNotice?page=${pCut.prePage}">上一页</a></li>
					<c:forEach var="i"
						begin="${pCut.currentPage-3>0?pCut.currentPage-3:1 }"
						end="${pCut.currentPage+3>pCut.pageNum?pCut.pageNum:pCut.currentPage+3  }">
						<c:choose>
							<c:when test="${i>0 && i == pCut.currentPage}">
								<li class="active"><a
									href="${rootPath }expert/ExpertNotice_allNotice?page=${i }">${i}</a></li>
							</c:when>
							<c:when test="${i>0 && i != pCut.currentPage}">
								<li><a
									href="${rootPath }expert/ExpertNotice_allNotice?page=${i }">${i}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<li><a
						href="${rootPath }expert/ExpertNotice_allNotice?page=${pCut.nextPage}">下一页</a></li>
				</ul>
			</div>
		</c:if>
	</center>
</body>
</html>