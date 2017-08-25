<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>通知中心</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/majorsmanage.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/font-awesome.css">
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
<style type="text/css">
  .side{
	width:100px;
	height:32px;
	background-color:rgba(0,0,0,.4);
	position:fixed;
	right:10px;
	top:40%;
}
</style>
</head>
<body>
	<div class="top">
 <c:if test="${fn:length(paCut.data) > 0 }">
		<table border="1" cellspacing="0">
			<caption>通知信息</caption>
			<thead>
				<tr>
					<td colspan="4">通知信息</td>
				</tr>
			</thead>
			
				<tr>
					<td>通知名称</td>
					<td>通知时间</td>
					<td>发布人</td>
					<td>操作</td>
				</tr>
			
				<c:forEach items="${paCut.data}" var="item">
					<tr>
						<td><a href="${rootPath}setting/NoticeManage_viewDetail?noticeId=${item.no_id}">${item.no_head}</a></td>
						<td>${item.no_issueData}</td>
						<td>${item.no_managerName}</td>
						<td width="120px"><a style="position: absolute; left: 25px; top: 8px;"
							href="${rootPath}setting/NoticeManage_delete?noticeId=${item.no_id}">
							<img src="${rootPath}images/delete.png" width="18px" style="float:left;margin-left:0px">
						</a> <a style="position: absolute; right: 25px; top: 8px;"
							href="${rootPath}setting/NoticeManage_viewDetail?noticeId=${item.no_id}">
								<img src="${rootPath}images/view.png" width="18px" style="float:right">
						</a></td>
					</tr>
				</c:forEach>
		</table>
		<div class="page">
			<ul class="pagination">
				<li><a href="?page=${paCut.prePage}">上一页</a></li>
				<c:forEach var="i"
					begin="${paCut.currentPage-3>0?paCut.currentPage-3:1 }"
					end="${paCut.currentPage+3>paCut.pageNum?paCut.pageNum:paCut.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == paCut.currentPage &&i<=3}">
							<li class="active"><a href="?page=${i}">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != paCut.currentPage &&i<=3}">
							<li><a href="?page=${i}">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>

				<li><a href="?page=${paCut.nextPage}">下一页</a></li>
			</ul>
		</div>
		</c:if>
			<div class="side">
	   <a href="${rootPath}setting/Transfer_addNotice"><img src="${rootPath}images/notice.png" width="100px"></a>
	</div>
</body>
</html>