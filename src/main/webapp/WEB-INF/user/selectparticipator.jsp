<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/selectParticipator.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/bootstrap.css">
    <script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
</head>
<body>
<center>${message}</center>
<a class="font" href="${rootPath}user/Participator_relay" target="mainiframe">添加参评人</a>
<div style="margin-left: 60%; height: 30px; margin-top: 1%;">
			<form action="${rootPath}user/Participator_select" method="post">
				<select name="ask"
					style="border-radius: 7px; background-color: #F0F0F0; height: 25px;">
					<option value="pa_name">姓名</option>
				</select> <input
					style="border-radius: 7px; background-color: #F0F0F0; height: 25px; width: 30%;"
					type="text" name="inquiry" required="required"> <input
					style="background-color: #82C0E9;border-radius: 7px;" type="submit" value="查询">
			</form>
	</div>
	<div class="wall">
<c:if test="${fn:length(messagenews.data) > 0 }">
<table border="1" cecellspacing="0" style="width:880px; margin:0 auto" >
		<thead>
			<caption>参评人信息</caption>
		</thead>
		<tbody>
			<tr>
				<th>编号</th>	
				<th>姓名</th>
				<th>邮箱</th>
				<th>专业</th>
				<th>单位</th>
				<th>职称</th>
				<th>照片</th>
				<th style="width:200px">简介</th>
				<th>评选成功通知</th>
				<th>操作</th>
			</tr>
		<c:forEach items="${messagenews.data}" var="item">
			<tr>
				<td>${item.pa_id}</td>
				<td>${item.pa_name}</td>
				<td>${item.pa_email}</td>
				<td>${item.pa_majors.maj_majorName}</td>
				<td>${item.pa_unit.un_unitName}</td>
				<td>${item.pa_title.ti_titleName}</td>
				<td width="100px" height="100px"><img width="100px" height="100px" src="${rootPath}uploadImage/${item.pa_imageUrl}"></td>
				<td width="100px" height="100px"><textarea rows="20" cols="2">${item.pa_introduce}</textarea></td>
				<td><a href="${rootPath}user/Participator_sendEmail?pa_id=${item.pa_id}">邮件通知</a></td>
				<td><a href="${rootPath}user/Participator_toUpdate?pa_id=${item.pa_id}">修改</a>&nbsp;&nbsp;&nbsp;<a href="${rootPath}user/Participator_delete?pa_id=${item.pa_id}">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="page">
			<ul class="pagination">
				<li><a
					href="${rootPath}user/Participator_select?page=${messagenews.prePage}">上一页</a></li>
				<c:forEach var="i" begin="${messagenews.currentPage-3>0?messagenews.currentPage-3:1 }"
					end="${messagenews.currentPage+3>messagenews.pageNum?messagenews.pageNum:messagenews.currentPage+3  }">

					<c:choose>
						<c:when test="${i>0 && i == messagenews.currentPage}">
							<li class="active"><a
								href="${rootPath}user/Participator_select?page=${i }">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != postPS.currentPage}">
							<li><a
								href="${rootPath}user/Participator_select?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a
					href="${rootPath}user/Participator_select?page=${messagenews.nextPage}">下一页</a></li>
			</ul>
		</div>
	</c:if>
	</div>
</body>
</html>