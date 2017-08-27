<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/expertstatistics.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/bootstrap.css">
<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
</head>
<body>
	<div class="tilp">${message}</div>
	<div style="margin-left: 60%; height: 30px; margin-top: 1%;">
		<form action="${rootPath}setting/Statistics_expertStatistics"
			method="post">
			<input type="text" name="inquiry" required="required"
				placeholder="姓名/专业/单位/职称"> <input
				style="background-color: #82C0E9; border-radius: 7px;" type="submit"
				value="查询">
		</form>
	</div>
	<center>
		<c:if test="${fn:length(allExpert.data) > 0 }">
			<table border="1" cellspacing="0">
				<tbody>
					<tr>
						<th>姓名</th>
						<th>专业</th>
						<th>单位</th>
						<th>职称</th>
						<th>学历</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${allExpert.data}" var="allExpert">
						<tr>
							<td>${allExpert.ex_name}</td>
							<td>${allExpert.ex_majors.maj_majorName}</td>
							<td>${allExpert.ex_unit.un_unitName}</td>
							<td>${allExpert.ex_title.ti_titleName}</td>
							<td>${allExpert.ex_education}</td>
							<td><a
								href="${rootPath}setting/Statistics_statistics?id=${allExpert.ex_id}">评议统计</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page">
				<ul class="pagination">
					<li><a
						href="${rootPath}setting/Statistics_expertStatistics?page=${allExpert.prePage}">上一页</a></li>
					<c:forEach var="i"
						begin="${allExpert.currentPage-3>0?allExpert.currentPage-3:1 }"
						end="${allExpert.currentPage+3>allExpert.pageNum?allExpert.pageNum:allExpert.currentPage+3  }">

						<c:choose>
							<c:when test="${i>0 && i == allExpert.currentPage}">
								<li class="active"><a
									href="${rootPath}setting/Statistics_expertStatistics?page=${i }">${i}</a></li>
							</c:when>
							<c:when test="${i>0 && i != allExpert.currentPage}">
								<li><a
									href="${rootPath}setting/Statistics_expertStatistics?page=${i }">${i}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<li><a
						href="${rootPath}setting/Statistics_expertStatistics?page=${allExpert.nextPage}">下一页</a></li>
				</ul>
			</div>
		</c:if>
	</center>
</body>
</html>