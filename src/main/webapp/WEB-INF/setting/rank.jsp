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

	<center>
		选择查看排名方式：
		<details style="width:200px"> <summary>按职称排名</summary> <c:forEach
			items="${allTitle}" var="allTitle">
			<a
				href="${rootPath}setting/Statistics_rank?ask=title&inquiry=${allTitle.ti_titleName}">${allTitle.ti_titleName}</a>
			<br>
		</c:forEach> </details>
		<details style="width:200px"> <summary>按专业排名</summary> <c:forEach
			items="${allMajors}" var="allMajors">
			<a
				href="${rootPath}setting/Statistics_rank?ask=major&inquiry=${allMajors.maj_majorName}">${allMajors.maj_majorName}</a>
			<br>
		</c:forEach> </details>
		<details style="width:200px"> <summary>按单位排名</summary> <c:forEach
			items="${allUnit}" var="allUnit">
			<a
				href="${rootPath}setting/Statistics_rank?ask=unit&inquiry=${allUnit.un_unitName}">${allUnit.un_unitName}</a>
			<br>
		</c:forEach> </details>
		<a href="">发送邮件通知</a>
		<a href="${rootPath}setting/Statistics_empty">清空评议及参评人</a>
		<c:if test="${discussRank ne null }">
			<table>
				<tr>
					<td>参评人</td>
					<td>熟悉型得分</td>
					<td>比较熟悉型得分</td>
					<td>不太熟悉得分</td>
					<td>模糊排名</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${discussRank.data}" var="rank">
					<tr>
						<td>${rank.di_participator.pa_name}</td>
						<td>${rank.di_averageA}</td>
						<td>${rank.di_averageB}</td>
						<td>${rank.di_averageC}</td>
						<td>${rank.di_rank}</td>
						<td><a href="${rootPath}setting/Statistics_discussDetails?inquiry=${rank.di_id}">查看详情</a></td>
					</tr>
				</c:forEach>
			</table>
			<div class="page" id="div2">
				<ul class="pagination">
					<li><a
						href="${rootPath }setting/Statistics_rank?page=${discussRank.prePage}">上一页</a></li>
					<c:forEach var="i"
						begin="${discussRank.currentPage-3>0?discussRank.currentPage-3:1 }"
						end="${discussRank.currentPage+3>discussRank.pageNum?discussRank.pageNum:discussRank.currentPage+3  }">
						<c:choose>
							<c:when test="${i>0 && i == discussRank.currentPage}">
								<li class="active"><a
									href="${rootPath }setting/Statistics_rank?page=${i }">${i}</a></li>
							</c:when>
							<c:when test="${i>0 && i != discussRank.currentPage}">
								<li><a
									href="${rootPath }setting/Statistics_rank?page=${i }">${i}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<li><a
						href="${rootPath }setting/Statistics_rank?page=${discussRank.nextPage}">下一页</a></li>
				</ul>
			</div>
		</c:if>
	</center>

</body>
</html>