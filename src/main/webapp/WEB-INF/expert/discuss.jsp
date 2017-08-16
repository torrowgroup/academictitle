<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<td>${participator.pa_name}</td>
			<td>申报职称：</td>
			<td>${participator.pa_title.ti_titleName}</td>
			<td>专业：</td>
			<td>${participator.pa_majors.maj_majorName}</td>
			<td>单位：</td>
			<td>${participator.pa_unit.un_unitName}</td>
			<td>图片：</td>
			<td><img alt="加载中" src=""></td>
		</tr>
		<tr>
			<td>简介：</td>
			<td colspan="9"><textarea rows="2" cols="30">${noDiscuss.pa_introduce}</textarea></td>
		</tr>
	</table>
	<form action="${rootPath}expert/ExpertDiscussAction_discuss" method="post">
		<input type="hidden" name="pa_id" value="${participator.pa_id}"/>
		您对参评人专业熟悉程度：
		<input type="radio" name="re_unfm" value="A">熟悉
		<input type="radio" name="re_unfm" value="B">比较熟悉
		<input type="radio" name="re_unfm" value="C">不太熟悉<br>
		教育：${require.re_educate}<br>
		<input type="radio" name="re_educate" value="30">优
		<input type="radio" name="re_educate" value="20">良
		<input type="radio" name="re_educate" value="10">中
		<input type="radio" name="re_educate" value="0">差<br>
		科研：${require.re_scientific}<br>
		<input type="radio" name="re_scientific" value="30">优
		<input type="radio" name="re_scientific" value="20">良
		<input type="radio" name="re_scientific" value="10">中
		<input type="radio" name="re_scientific" value="0">差<br>
		师德：${require.re_morality}<br>
		<input type="radio" name="re_morality" value="30">优
		<input type="radio" name="re_morality" value="20">良
		<input type="radio" name="re_morality" value="10">中
		<input type="radio" name="re_morality" value="0">差<br>
		<input type="submit" value="确定"/>
	</form>
</center>
</body>
</html>