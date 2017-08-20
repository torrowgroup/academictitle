<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = selectMajor;//界面加载后自动调用
	function selectMajor() {
		var selectMajors = '${expert.ex_majors.maj_id}';//得到该专家的专业，单位，申报职称
		var selectUnit = '${expert.ex_unit.un_id}';
		var selectTitle = '${expert.ex_title.ti_id}';
		for (var i = 0; i < majors.options.length; i++) {	//对所有专业，单位，职称遍历，选中该专家的对应项
			if (majors.options[i].value == selectMajors) {
				majors.options[i].selected = true;
			}
		}
		for (var i = 0; i < unit.options.length; i++) {	
			if (unit.options[i].value == selectUnit) {
				unit.options[i].selected = true;
			}
		}
		for (var i = 0; i < title.options.length; i++) {
			if (title.options[i].value == selectTitle) {
				title.options[i].selected = true;
			}
		}
	}
</script>
</head>
<body>
	<center>${message}</center>
	<center>
		<form action="${rootPath}expert/ExpertPersonal_updateMyself" method="post">
			<input type="hidden" name="ex_id" value="${expert.ex_id}"/>
			<table>
				<tr>
					<td>用户名</td>
					<td>
						<input type="text" name="ex_userName" value="${expert.ex_userName}" />
					</td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input type="text" name="ex_password"
						value="${expert.ex_password}" /></td>
				</tr>
				<tr>
					<td>姓名</td>
					<td><input type="text" name="ex_name"
						value="${expert.ex_name}" /></td>
				</tr>
				<tr>
					<td>专业</td>
					<td>
						<select name="majorId" id="majors">
							<c:forEach items="${allMajors}" var="allMajors">
								<option value="${allMajors.maj_id}">${allMajors.maj_majorName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>单位</td>
					<td>
						<select name="unitId" id="unit">
							<c:forEach items="${allUnit}" var="allUnit">
								<option value="${allUnit.un_id}">${allUnit.un_unitName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>申报职称</td>
					<td>
						<select name="titleId" id="title">
							<c:forEach items="${allTitle}" var="allTitle">
								<option value="${allTitle.ti_id}">${allTitle.ti_titleName}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>学历</td>
					<td>
						<select name="ex_education" id="ex_education">
							<option value="本科" <c:if test="${expert.ex_education eq '本科'}">selected ="selected"</c:if>>本科</option>
							<option value="硕士" <c:if test="${expert.ex_education eq '硕士'}">selected ="selected"</c:if>>硕士</option>
							<option value="博士" <c:if test="${expert.ex_education eq '博士'}">selected ="selected"</c:if>>博士</option>
							<option value="博士后" <c:if test="${expert.ex_education eq '博士后'}">selected ="selected"</c:if>>博士后</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="修改" />
					</td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>