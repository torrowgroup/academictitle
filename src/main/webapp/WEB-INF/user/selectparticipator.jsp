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
<table border="1" cecellspacing="0">
		<thead>
			<tr>
				<td colspan="8">专家信息</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>编号</td>	
				<td>姓名</td>
				<td>专业</td>
				<td>单位</td>
				<td>职称</td>
				<td>照片</td>
				<td>简介</td>
				<td>操作</td>
			</tr>
		<c:forEach items="${messagenews.data}" var="item">
			<tr>
				<td>${item.pa_id}</td>
				<td>${item.pa_name}</td>
				<td>${item.pa_majors.maj_majorName}</td>
				<td>${item.pa_unit.un_unitName}</td>
				<td>${item.pa_title.ti_titleName}</td>
				<td>${item.pa_imageUrl}</td>
				<td>${item.pa_introduce}</td>
				<td><a href="${rootPath}user/Participator_toUpdate?pa_id=${item.pa_id}">修改</a>&nbsp;&nbsp;&nbsp;<a href="${rootPath}user/Participator_delet?pa_id=${item.pa_id}">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
			<ul >
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

</body>
</html>