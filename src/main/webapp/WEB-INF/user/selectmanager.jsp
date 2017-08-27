<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/selectmanager.css">
    <script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
    <style>
		.tilp{
		  padding-top:20px;
		  font-size:26px;
		  text-align:center;
		  font-family:"华文行楷","微软雅黑";
		  text-shadow: 3px 3px 6px rgba(0,0,0,.4);
		
		}
	</style>
</head>
<body>
<div class="tilp">${message}</div>
<div style="margin-left: 55%; height: 30px; margin-top: 5%;">
<a class="font" href="${rootPath}user/Manager_relay" target="mainiframe">添加管理员</a>
			<form action="${rootPath}user/Manager_select" method="post">
				<select name="ask"
					style="border-radius: 7px; background-color: #F0F0F0; height: 25px;">
					<option value="ma_userName">邮箱</option>
					<option value="ma_name">姓名</option>
				</select> <input
					style="border-radius: 7px; background-color: #F0F0F0; height: 25px; width: 30%;"
					type="text" name="inquiry" required="required"> <input
					style="background-color: #82C0E9;border-radius: 7px;width:50px;height: 30px;" type="submit" value="查询">
			</form>
	</div>
	<div class="header" style="width:85%">
	<c:if test="${fn:length(messagenews.data) > 0 }">
	<table cecellspacing="0" border="1" style="width:600px;margin-left:100px">
		<thead>
			<caption>管理员信息</caption>
		</thead>
		<tbody>
			<tr>
				<th>编号</th>
				<th>邮箱</th>
				<th>密码</th>
				<th>姓名</th>
				<th style="width:60px">操作</th>
			</tr>
		<c:forEach items="${messagenews.data}" var="item">
			<tr>
				<td>${item.ma_id}</td>
				<td>${item.ma_userName}</td>
				<td>${item.ma_password}</td>
				<td>${item.ma_name}</td>
				<td><a href="${rootPath}user/Manager_toUpdate?ma_id=${item.ma_id}&term=update"><img src="${rootPath}images/edit.png" width="18px" style="float:left;margin-left:5px"></a><a href="${rootPath}user/Manager_delet?ma_id=${item.ma_id}"><img src="${rootPath}images/delete.png" width="18px" style="float:left;margin-left:10px"></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="page">
			<ul class="pagination">
				<li><a href="${rootPath}user/Manager_select?page=${messagenews.prePage}">上一页</a></li>
				<c:forEach var="i" begin="${messagenews.currentPage-3>0?messagenews.currentPage-3:1 }"
					end="${messagenews.currentPage+3>messagenews.pageNum?messagenews.pageNum:messagenews.currentPage+3  }">

					<c:choose>
						<c:when test="${i>0 && i == messagenews.currentPage}">
							<li class="active"><a
								href="${rootPath}user/Manager_select?page=${i }">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != postPS.currentPage}">
							<li><a
								href="${rootPath}user/Manager_select?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a
					href="${rootPath}user/Manager_select?page=${messagenews.nextPage}">下一页</a></li>
			</ul>
		</div>
		</c:if>
	</div>
</body>
</html>