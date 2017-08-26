<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>majorsmanage</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/majorsmanage.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/setting/bootstrap.css">
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
<style type="text/css">
.side {
	width: 100px;
	height: 32px;
	background-color: rgba(0, 0, 0, .4);
	position: fixed;
	right: 10px;
	top: 40%;
}
.tilp{
  padding-top:50px;
  font-size:26px;
  text-align:center;
  font-family:"华文行楷","微软雅黑";
  text-shadow: 3px 3px 6px rgba(0,0,0,.4);
  }

</style>
</head>
<body>
<div class="tilp">${Message}</div>
 <c:if test="${ not empty require}">
	<div class="top">
		<div class="right">
			<form
				action="${rootPath}setting/ReviewRequirementsManage_searchRequire"
				method="post" onsubmit="return check()">
				<input type="text" name="titleName" placeholder=" 请输入所要查询评议要求相关职称名称">
				<input type="submit" value="搜索">
			</form>
		</div>
		<table border="1" cellspacing="0">
				<caption>评议要求信息</caption>
				<tr>
					<th width="200px">职称名称</th>
					<th width="250px">操作</th>
				</tr>
					<tr>
						<td><a
							href="${rootPath}setting/ReviewRequirementsManage_getDetails?requireId=${require.re_id}">${require.re_title.ti_titleName}</a></td>
						<td width="150px"><a
							style="position: absolute; left: 5px; top: 8px;"
							href="${rootPath}setting/ReviewRequirementsManage_getDetails?requireId=${require.re_id}">
								<img src="${rootPath}images/view.png" width="20px"
								style="float: left; margin-left: 20px">
						</a> <a style="position: absolute; left: 45px; top: 8px;"
							href="${rootPath}setting/Transfer_updateRequire?requireId=${require.re_id}">
								<img src="${rootPath}images/edit.png" width="20px"
								style="float: left; margin-left: 70px">
						</a> <a style="position: absolute; right: 25px; top: 8px;"
							href="${rootPath}setting/ReviewRequirementsManage_delete?requireId=${require.re_id}">
								<img src="${rootPath}images/delete.png" width="20px"
								style="float: left; margin-left: 0px">
						</a></td>
					</tr>
			</table>
		</div>
		</c:if>
		<div class="side">
	<a href="${rootPath}setting/Transfer_addReviewRequirements"><img
		src="${rootPath}images/require.png" width="100px"></a>
</div>
</body>
</html>