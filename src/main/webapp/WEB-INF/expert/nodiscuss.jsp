<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4	/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>未评人员</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/expert/nodiscuss.css">
<link rel="stylesheet" type="text/css" href="${rootPath}css/expert//bootstrap.css">
<link rel="stylesheet" type="text/css" href="${rootPath}css/expert/public.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
</head>
<body>
<div class="box">
		<img src="${rootPath}images/nail-1.gif" class="left"> <img
			src="${rootPath}images/nail-2.gif" class="right">
		<div class="back"><<<a href="${rootPath}expert/ExpertPersonal_back">返回首页</a></div>
		<div>${message }</div>
	<div class="wall">
		<div class="rightform">
			<form action="${rootPath}expert/ExpertDiscussAction_noDiscuss"
				method="post">
				<input type="text" name="inquiry" placeholder="姓名/专业/单位/职称">
				<input class="btn" type="submit" value="查询">
			</form>
		</div>
		<c:if test="${fn:length(noDiscuss.data) > 0 }">
		<table border="1" cellspacing="0">
			<tr>
				<th>参评人</th>
				<th>申报名称</th>
				<th>单位</th>
				<th>专业</th>
				<th>图片</th>
				<th>简介</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${noDiscuss.data}" var="noDiscuss">
				<tr>
					<td>${noDiscuss.pa_name}</td>
					<td>${noDiscuss.pa_title.ti_titleName}</td>
					<td>${noDiscuss.pa_unit.un_unitName}</td>
					<td>${noDiscuss.pa_majors.maj_majorName}</td>
					<td style="width: 100px;"><img height="50px" width="100%" alt="加载中" src="${rootPath}uploadImage/${noDiscuss.pa_imageUrl}"></td>
					<td style="padding-top: 3px"><textarea>${noDiscuss.pa_introduce}</textarea>
					</td>
					<td><a
						href="${rootPath}expert/ExpertDiscussAction_toDiscuss?pa_id=${noDiscuss.pa_id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="page">
			<ul class="pagination">
				<li><a
					href="${rootPath }expert/ExpertDiscussAction_noDiscuss?page=${noDiscuss.prePage}">上一页</a></li>
				<c:forEach var="i"
					begin="${noDiscuss.currentPage-3>0?noDiscuss.currentPage-3:1 }"
					end="${noDiscuss.currentPage+3>noDiscuss.pageNum?noDiscuss.pageNum:noDiscuss.currentPage+3  }">
					<c:choose>
						<c:when test="${i>0 && i == noDiscuss.currentPage}">
							<li><a href="${rootPath }expert/ExpertDiscussAction_noDiscuss?page=${i }">${i}</a></li>
						</c:when>
						<c:when test="${i>0 && i != noDiscuss.currentPage}">
							<li><a href="${rootPath }expert/ExpertDiscussAction_noDiscuss?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a href="${rootPath }expert/ExpertDiscussAction_noDiscuss?page=${noDiscuss.nextPage}">下一页</a></li>
			</ul>
		</div>
		</c:if>
	</div>
	</div>
</body>
</html>