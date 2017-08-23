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
<center>${message}</center>
<div style="margin-left: 60%; height: 30px; margin-top: 1%;">
			<form action="${rootPath}setting/Statistics_parStatistics" method="post">
				<input type="text" name="inquiry" required="required"  placeholder="姓名/专业/单位/职称" > 
				<input style="background-color: #82C0E9;border-radius: 7px;" type="submit" value="查询">
			</form>
	</div>
	<center>
<c:if test="${fn:length(allParticipator.data) > 0 }">
<table border="1" cecellspacing="0">
		<tbody>
			<tr>
				<td>姓名</td>
				<td>专业</td>
				<td>单位</td>
				<td>职称</td>
				<td>照片</td>
				<td>简介</td>
				<td>操作</td>
			</tr>
		<c:forEach items="${allParticipator.data}" var="allParticipator">
			<tr>
				<td>${allParticipator.pa_name}</td>
				<td>${allParticipator.pa_majors.maj_majorName}</td>
				<td>${allParticipator.pa_unit.un_unitName}</td>
				<td>${allParticipator.pa_title.ti_titleName}</td>
				<td>${allParticipator.pa_imageUrl}</td>
				<td>${allParticipator.pa_introduce}</td>
				<td><a href="${rootPath}setting/Statistics_parDisStatistics?id=${allParticipator.pa_id}">评议统计</a></td>				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
			<ul >
				<li><a
					href="${rootPath}setting/Statistics_parStatistics?page=${allParticipator.prePage}">上一页</a></li>
				<c:forEach var="i" begin="${allParticipator.currentPage-3>0?allParticipator.currentPage-3:1 }"
					end="${allParticipator.currentPage+3>allParticipator.pageNum?allParticipator.pageNum:allParticipator.currentPage+3  }">

					<c:choose>
						<c:when test="${i>0 && i == allParticipator.currentPage}">
							<li class="active"><a
								href="${rootPath}setting/Statistics_parStatistics?page=${i }">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != allParticipator.currentPage}">
							<li><a
								href="${rootPath}setting/Statistics_parStatistics?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a
					href="${rootPath}setting/Statistics_parStatistics?page=${allParticipator.nextPage}">下一页</a></li>
			</ul>
		</div>
		</c:if>	
</center>
</body>
</html>