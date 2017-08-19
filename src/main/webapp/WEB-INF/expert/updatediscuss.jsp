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
<center>
	<table>
		<tr>
			<td>参评人：</td>
			<td>${record.re_participator.pa_name}</td>
			<td>申报职称：</td>
			<td>${record.re_participator.pa_title.ti_titleName}</td>
			<td>专业：</td>
			<td>${record.re_participator.pa_majors.maj_majorName}</td>
			<td>单位：</td>
			<td>${record.re_participator.pa_unit.un_unitName}</td>
			<td>图片：</td>
			<td><img alt="加载中" src=""></td>
		</tr>
		<tr>
			<td>简介：</td>
			<td colspan="9"><textarea rows="2" cols="30">${record.re_participator.pa_introduce}</textarea></td>
		</tr>
	</table>
	<form action="${rootPath}expert/ExpertDiscussAction_updateRecord" method="post">
		<input type="hidden" name="re_id" value="${record.re_id}"/>
		您对参评人专业熟悉程度：
		<input type="radio" name="re_unfm" <c:if test="${record.re_unfm eq 'A'}">checked="checked"</c:if> value="A" >熟悉
		<input type="radio" name="re_unfm" <c:if test="${record.re_unfm eq 'B'}">checked="checked"</c:if> value="B">比较熟悉
		<input type="radio" name="re_unfm" <c:if test="${record.re_unfm eq 'C'}">checked="checked"</c:if> value="C">不太熟悉<br>
		教育：${require.re_educate}<br>
		<input type="radio" name="re_educate" <c:if test="${record.re_educate eq '30'}">checked="checked"</c:if> value="30">优
		<input type="radio" name="re_educate" <c:if test="${record.re_educate eq '20'}">checked="checked"</c:if> value="20">良
		<input type="radio" name="re_educate" <c:if test="${record.re_educate eq '10'}">checked="checked"</c:if> value="10">中
		<input type="radio" name="re_educate" <c:if test="${record.re_educate eq '0'}">checked="checked"</c:if> value="0">差<br>
		科研：${require.re_scientific}<br>
		<input type="radio" name="re_scientific" <c:if test="${record.re_scientific eq '30'}">checked="checked"</c:if> value="30">优
		<input type="radio" name="re_scientific" <c:if test="${record.re_scientific eq '20'}">checked="checked"</c:if> value="20">良
		<input type="radio" name="re_scientific" <c:if test="${record.re_scientific eq '10'}">checked="checked"</c:if> value="10">中
		<input type="radio" name="re_scientific" <c:if test="${record.re_scientific eq '0'}">checked="checked"</c:if> value="0">差<br>
		师德：${require.re_morality}<br>
		<input type="radio" name="re_morality" <c:if test="${record.re_morality eq '30'}">checked="checked"</c:if> value="30">优
		<input type="radio" name="re_morality" <c:if test="${record.re_morality eq '20'}">checked="checked"</c:if> value="20">良
		<input type="radio" name="re_morality" <c:if test="${record.re_morality eq '10'}">checked="checked"</c:if> value="10">中
		<input type="radio" name="re_morality" <c:if test="${record.re_morality eq '0'}">checked="checked"</c:if> value="0">差<br>
		<input type="submit" value="确定修改"/>
	</form>
</center>
</body>
</html>