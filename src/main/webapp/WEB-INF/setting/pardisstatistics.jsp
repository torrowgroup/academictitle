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
	<c:if test="${fn:length(parRecord.data) > 0 }">
		<table border="1">
			<tr>
				<td>参评人</td>
				<td>申报职称</td>
				<td>熟悉程度</td>
				<td>教育</td>
				<td>科研</td>
				<td>师德</td>
				<td>评分</td>
			</tr>
			<c:forEach items="${parRecord.data}" var="parRecord">
				<tr>
					<td>${parRecord.re_participator.pa_name}</td>
					<td>${parRecord.re_participator.pa_title.ti_titleName}</td>
					<td>${parRecord.re_unfm}</td>
					<td>${parRecord.re_educate}</td>
					<td>${parRecord.re_scientific}</td>
					<td>${parRecord.re_morality}</td>
					<td>${parRecord.re_score}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="page" id="div2">
				<ul class="pagination">
					<li><a
						href="${rootPath }setting/Statistics_parDisStatistics?page=${parRecord.prePage}">上一页</a></li>
					<c:forEach var="i"
						begin="${parRecord.currentPage-3>0?parRecord.currentPage-3:1 }"
						end="${parRecord.currentPage+3>parRecord.pageNum?parRecord.pageNum:parRecord.currentPage+3  }">
						<c:choose>
							<c:when test="${i>0 && i == parRecord.currentPage}">
								<li class="active"><a
									href="${rootPath }setting/Statistics_parDisStatistics?page=${i }">${i}</a></li>
							</c:when>
							<c:when test="${i>0 && i != parRecord.currentPage}">
								<li><a
									href="${rootPath }setting/Statistics_parDisStatistics?spage=${i }">${i}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<li><a
						href="${rootPath }setting/Statistics_parDisStatistics?page=${parRecord.nextPage}">下一页</a></li>
				</ul>
			</div>
	</c:if>
	</center>
</body>
</html>