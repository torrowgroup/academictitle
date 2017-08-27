<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/selectexpert.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/bootstrap.css">
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
<div class="tilp">${message}${news}</div>
<div style="margin-left: 55%; height: 30px; margin-top: 5%;">
<a class="font" href="${rootPath}user/Expert_relay" target="mainiframe">添加专家</a>
			<form action="${rootPath}user/Expert_select" method="post">
				<select name="ask"
					style="border-radius: 7px; background-color: #F0F0F0; height: 25px;">
					<option value="ex_userName">邮箱</option>
					<option value="ex_name">姓名</option>
					<option value="ex_majors.maj_majorName">专业</option>
					<option value="ex_unit.un_unitName">单位</option>
					<option value="ex_title.ti_titleName">职称</option>
					<option value="ex_education">学历</option>
				</select> <input
					style="border-radius: 7px; background-color: #F0F0F0; height: 25px; width: 30%;"
					type="text" name="inquiry" required="required"> <input
					style="background-color: #82C0E9;border-radius: 7px;width:50px;height: 30px;" type="submit" value="查询">
			</form>
	</div>
	<c:if test="${fn:length(messagenews.data) > 0 }">
	 <div class="wall">
	<table border="1" cellspacing="0">
		<thead>
			<caption>专家信息</caption>
		</thead>
		<tbody>
				<tr>
					<th>编号</th>
					<th>邮箱</th>
					<th>密码</th>
					<th>姓名</th>
					<th>专业</th>
					<th>单位</th>
					<th>职称</th>
					<th>学历</th>
					<th style="width:60px">操作</th>
				</tr>
			<c:forEach items="${messagenews.data}" var="item">
				<tr>
					<td>${item.ex_id}</td>
					<td>${item.ex_userName}</td>
					<td>${item.ex_password}</td>
					<td>${item.ex_name}</td>
					<td>${item.ex_majors.maj_majorName}</td>
					<td>${item.ex_unit.un_unitName}</td>
					<td>${item.ex_title.ti_titleName}</td>
					<td>${item.ex_education}</td>
					<td><a href="${rootPath}user/Expert_toUpdate?ex_id=${item.ex_id}"><img src="${rootPath}images/edit.png" width="18px" style="float:left;margin-left:5px"></a><a href="${rootPath}user/Expert_delet?ex_id=${item.ex_id}"><img src="${rootPath}images/delete.png" width="18px" style="float:left;margin-left:10px"></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<div class="page">
			<ul class="pagination">
				<li><a
					href="${rootPath}user/Expert_select?page=${messagenews.prePage}">上一页</a></li>
				<c:forEach var="i" begin="${messagenews.currentPage-3>0?messagenews.currentPage-3:1 }"
					end="${messagenews.currentPage+3>messagenews.pageNum?messagenews.pageNum:messagenews.currentPage+3  }">

					<c:choose>
						<c:when test="${i>0 && i == messagenews.currentPage}">
							<li class="active"><a
								href="${rootPath}user/Expert_select?page=${i}">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != postPS.currentPage}">
							<li><a
								href="${rootPath}user/Expert_select?page=${i}">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a
					href="${rootPath}user/Expert_select?page=${messagenews.nextPage}">下一页</a></li>
			</ul>
		</div>
	</div>	
</c:if>
</body>
</html>