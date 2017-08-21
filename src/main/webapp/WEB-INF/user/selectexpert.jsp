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
			<form action="${rootPath}user/Expert_select" method="post">
				<select name="ask"
					style="border-radius: 7px; background-color: #F0F0F0; height: 25px;">
					<option value="ex_userName">账号</option>
					<option value="ex_name">姓名</option>
					<option value="ex_education">学历</option>
				</select> <input
					style="border-radius: 7px; background-color: #F0F0F0; height: 25px; width: 30%;"
					type="text" name="inquiry" required="required"> <input
					style="background-color: #82C0E9;border-radius: 7px;" type="submit" value="查询">
			</form>
	</div>
	<c:if test="${fn:length(messagenews.data) > 0 }">
	<table border="1" cecellspacing="0">
		<thead>
			<tr>
				<td colspan="9">专家信息</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>编号</td>
				<td>账号</td>
				<td>密码</td>
				<td>姓名</td>
				<td>专业</td>
				<td>单位</td>
				<td>职称</td>
				<td>学历</td>
				<td>操作</td>
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
				<td><a href="${rootPath}user/Expert_toUpdate?ex_id=${item.ex_id}">修改</a>&nbsp;&nbsp;&nbsp;<a href="${rootPath}user/Expert_delet?ex_id=${item.ex_id}">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
			<ul >
				<li><a
					href="${rootPath}user/Expert_select?page=${messagenews.prePage}">上一页</a></li>
				<c:forEach var="i" begin="${messagenews.currentPage-3>0?messagenews.currentPage-3:1 }"
					end="${messagenews.currentPage+3>messagenews.pageNum?messagenews.pageNum:messagenews.currentPage+3  }">

					<c:choose>
						<c:when test="${i>0 && i == messagenews.currentPage}">
							<li class="active"><a
								href="${rootPath}user/Expert_select?page=${i }">${i}</a></li>
						</c:when>

						<c:when test="${i>0 && i != postPS.currentPage}">
							<li><a
								href="${rootPath}user/Expert_select?page=${i }">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<li><a
					href="${rootPath}user/Expert_select?page=${messagenews.nextPage}">下一页</a></li>
			</ul>
		</div>
	</c:if>
</body>
</html>