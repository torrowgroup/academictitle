<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<title>majorsmanage</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/majorsmanage.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/bootstrap.css">
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
<style>
.tilp{
  padding-top:50px;
  font-size:26px;
  text-align:center;
  font-family:"华文行楷","微软雅黑";
  text-shadow: 3px 3px 6px rgba(0,0,0,.4);
  }
  .side {
	width: 100px;
	height: 32px;
	background-color: rgba(0, 0, 0, .4);
	position: fixed;
	right: 10px;
	top: 40%;
}
</style>
</head>
<body>
<div class="tilp">${Message}</div>
 <c:if test="${ not empty title}">
	<div class="top">
		<div class="right">
			<form action="${rootPath}setting/TitleManage_searchTitle"
				method="post" onsubmit="return check()">
				<input type="text" name="titleName" placeholder=" 请输入所要查询职称名称">
				<input type="submit" value="搜索">
			</form>
		</div>
		<table border="1" cellspacing="0">
			<caption>职称信息</caption>
			<tr>
				<th>职称编号</th>
				<th>职称名称</th>
				<th>操作</th>
			</tr>
				<tr>
					<td>${title.ti_id}</td>
					<td>${title.ti_titleName}</td>
					<td width="120px"><a style="position: absolute; left: 25px; top: 8px;"
						href="${rootPath}setting/Transfer_updateTitle?titleId=${ title.ti_id}">
							<img src="${rootPath}images/edit.png" width="18px" style="float:left;margin-left:0px">
					</a> <a style="position: absolute; right: 25px; top: 8px;"
						href="${rootPath}setting/TitleManage_delete?titleId=${title.ti_id}">
							<img src="${rootPath}images/delete.png" width="18px" style="float:left;margin-left:0px">
					</a></td>
				</tr>
		</table>
		</div>
		</c:if>
		<div class="side">
		<a href="${rootPath}setting/Transfer_addTitle"><img
			src="${rootPath}images/title.png" width="100px"></a>
	</div>
</body>
</html>