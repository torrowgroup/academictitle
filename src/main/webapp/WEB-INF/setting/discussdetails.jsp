<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/setting/discussdetails.css">
<link rel="stylesheet" type="text/css" href="${rootPath}css/expert/bootstrap.css">
<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
</head>
<body>
	<center>
		<table border="1">
			<tr>
				<td>参评人</td>
				<td>评议专家</td>
				<td>申报职称</td>
				<td>熟悉程度</td>
				<td>教育</td>
				<td>科研</td>
				<td>师德</td>
				<td>评分</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${recordList.data}" var="recordList">
				<tr>
					<td>${recordList.re_participator.pa_name}</td>
					<td>${recordList.re_expert.ex_name}</td>
					<td>${recordList.re_participator.pa_title.ti_titleName}</td>
					<td>${recordList.re_unfm}</td>
					<td>${recordList.re_educate}</td>
					<td>${recordList.re_scientific}</td>
					<td>${recordList.re_morality}</td>
					<td>${recordList.re_score}</td>
					<td><a href="">修改</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="page" id="div2">
				<ul class="pagination">
					<li><a
						href="${rootPath }setting/Statistics_discussDetails?page=${recordList.prePage}">上一页</a></li>
					<c:forEach var="i"
						begin="${recordList.currentPage-3>0?recordList.currentPage-3:1 }"
						end="${recordList.currentPage+3>recordList.pageNum?recordList.pageNum:recordList.currentPage+3  }">
						<c:choose>
							<c:when test="${i>0 && i == recordList.currentPage}">
								<li class="active"><a
									href="${rootPath }setting/Statistics_discussDetails?page=${i }">${i}</a></li>
							</c:when>
							<c:when test="${i>0 && i != recordList.currentPage}">
								<li><a
									href="${rootPath }setting/Statistics_discussDetails?page=${i }">${i}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<li><a
						href="${rootPath }setting/Statistics_discussDetails?page=${recordList.nextPage}">下一页</a></li>
				</ul>
			</div>
		
	</center>
</body>
</html>