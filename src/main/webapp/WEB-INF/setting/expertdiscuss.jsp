<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="${rootPath }css/setting/expertdiscuss.css">
    <link rel="stylesheet" type="text/css" href="${rootPath }css/setting/bootstrap.css">
    <script type="text/javascript" src="${rootPath }js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${rootPath }js/bootstrap.js"></script>
</head>
<body>
<div class="message">${message}</div>
<center>
	<c:if test="${fn:length(expertDiscuss.data) > 0 }">
		<table border="1">
			<tr>
				<th>参评人</th>
				<th>申报职称</th>
				<th>熟悉程度</th>
				<th>教育</th>
				<th>科研</th>
				<th>师德</th>
				<th>评分</th>
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
				</tr>
			</c:forEach>
		</table>
		<div class="page" id="div2">
				<ul class="pagination">
					<li><a
						href="${rootPath }setting/Statistics_statistics?page=${expertDiscuss.prePage}">上一页</a></li>
					<c:forEach var="i"
						begin="${expertDiscuss.currentPage-3>0?expertDiscuss.currentPage-3:1 }"
						end="${expertDiscuss.currentPage+3>expertDiscuss.pageNum?expertDiscuss.pageNum:expertDiscuss.currentPage+3  }">
						<c:choose>
							<c:when test="${i>0 && i == expertDiscuss.currentPage}">
								<li class="active"><a
									href="${rootPath }setting/Statistics_statistics?page=${i }">${i}</a></li>
							</c:when>
							<c:when test="${i>0 && i != expertDiscuss.currentPage}">
								<li><a
									href="${rootPath }setting/Statistics_statistics?page=${i }">${i}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<li><a
						href="${rootPath }setting/Statistics_statistics?page=${expertDiscuss.nextPage}">下一页</a></li>
				</ul>
			</div>
	</c:if>
	</center>
</body>
</html>