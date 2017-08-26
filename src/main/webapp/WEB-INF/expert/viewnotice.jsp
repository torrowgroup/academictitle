<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看通知</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/expert/viewnotice.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/expert/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/expert/public.css">

<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
</head>
<body>
	<div class="box">
		<img src="${rootPath}images/nail-1.gif" class="left"> <img
			src="${rootPath}images/nail-2.gif" class="right">
		<div class="top">
		<div class="back">
			<<<a href="${rootPath}expert/ExpertPersonal_back">返回首页</a>
		</div>
		<div class="msg" >${message}</div>
			<div class="form">
				<form action="${rootPath}expert/ExpertNotice_allNotice" method="post">
					<input type="text" placeholder="标题/发布时间" name="inquiry" require="require">
					<input class="btn" type="submit" value="查询">
				</form>
			</div>
			<c:if test="${fn:length(pCut.data) > 0 }">
				<table border="1" cellspacing="0">
					<tr>
						<th style="width: 300px;">标题</th>
						<th style="width: 150px;">发布时间</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pCut.data}" var="allNotice">
						<tr>
							<td>${allNotice.no_head}</td>
							<td>${allNotice.no_issueData}</td>
							<td><a href="${rootPath}expert/ExpertNotice_noticeDetail?no_id=${allNotice.no_id}">查看详情</a></td>
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
		</div>
	</div>
</body>
</html>