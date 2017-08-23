<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>参与评议</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}dist/css/wangEditor.min.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/expert/discuss.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/expert/public.css">
</head>
<body>
	<div class="box">
		<img src="${rootPath}images/nail-1.gif" class="left"> <img
			src="${rootPath}images/nail-2.gif" class="right">
		<div class="back">
			<<<a href="${rootPath}expert/ExpertPersonal_back">返回首页</a>
		</div>
		<div class="wall">
			<div class="w-left">
				<span>参评人:</span> <i>${participator.pa_name}</i><br> <span>申报职称:</span>
				<i>${participator.pa_title.ti_titleName}</i><br> <span>专业:</span>
				<i>${participator.pa_majors.maj_majorName}</i><br> <span>单位:</span>
				<i>${participator.pa_unit.un_unitName}</i><br> <span>图片:</span>
				<i><img id="pic"
					src="${rootPath}uploadImage/${participator.pa_imageUrl}" alt="加载中"></i><br>
				<span>简介:</span>
				<textarea readonly="readonly">${participator.pa_introduce}</textarea>
			</div>
			<div class="w-right">
				<form action="${rootPath}expert/ExpertDiscussAction_discuss"
					method="post">
					<input type="hidden" name="pa_id" value="${participator.pa_id}" />
					<span style="padding: 0">您对参评人专业熟悉程度:</span> <input type="radio"
						name="re_unfm" value="A">熟悉 <input type="radio"
						name="re_unfm" value="B">比较熟悉 <input type="radio"
						name="re_unfm" value="C">不太熟悉 <br>
					<p>
						<i>教育</i>：
						<textarea readonly="readonly">${require.re_educate}</textarea>
					</p>
					<span>教育方面：</span> <input type="radio" name="re_educate" value="30">优
					<input type="radio" name="re_educate" value="20">良 <input
						type="radio" name="re_educate" value="10">中 <input
						type="radio" name="re_educate" value="0">差
					<p>
						<i>科研</i>：
						<textarea readonly="readonly">${require.re_scientific}</textarea>
					</p>
					<span>科研方面：</span> <input type="radio" name="re_scientific"
						value="30">优 <input type="radio" name="re_scientific"
						value="20">良 <input type="radio" name="re_scientific"
						value="10">中 <input type="radio" name="re_scientific"
						value="0">差 <br>
					<p>
						<i>师德</i>：
						<textarea readonly="readonly">${require.re_morality}</textarea>
					</p>
					<span>师德方面：</span> <input type="radio" name="re_morality"
						value="30">优 <input type="radio" name="re_morality"
						value="20">良 <input type="radio" name="re_morality"
						value="10">中 <input type="radio" name="re_morality"
						value="0">差<br> <input type="submit" class="btn"
						value="确定" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<!-- <center> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td>参评人：</td> -->
<%-- 			<td>${participator.pa_name}</td> --%>
<!-- 			<td>申报职称：</td> -->
<%-- 			<td>${participator.pa_title.ti_titleName}</td> --%>
<!-- 			<td>专业：</td> -->
<%-- 			<td>${participator.pa_majors.maj_majorName}</td> --%>
<!-- 			<td>单位：</td> -->
<%-- 			<td>${participator.pa_unit.un_unitName}</td> --%>
<!-- 			<td>图片：</td> -->
<!-- 			<td><img alt="加载中" src=""></td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- 		<div style="width: 600px; height: 300px;"> -->
<!-- 			<lable style="">简介:</lable> -->
<!-- 			<div id="editor" style="width: 100%; height: 250px;"></div> -->
<!-- 				<script type="text/javascript" -->
<%-- 					src="${rootPath}dist/js/lib/jquery-1.10.2.min.js"></script> --%>
<!-- 				<script type="text/javascript" -->
<%-- 					src="${rootPath}dist/js/wangEditor.min.js"></script> --%>
<!-- 				<script type="text/javascript"> -->
<!--  				    var E = window.wangEditor -->
<!--  				    var editor = new E('editor')    		  -->
<%--  				    editor.config.uploadImgUrl = '${rootPath}user/Participator_uploadImg' --%>
<!--  				    editor.config.uploadImgFileName = 'myFileName' -->
<!--  				    editor.create() -->
<%--  				    editor.$txt.html('${participator.pa_introduce}') --%>
<!--     			</script> -->
<!--     	</div> -->
<%-- 	<form action="${rootPath}expert/ExpertDiscussAction_discuss" method="post"> --%>
<%-- 		<input type="hidden" name="pa_id" value="${participator.pa_id}"/> --%>
<!-- 		您对参评人专业熟悉程度： -->
<!-- 		<input type="radio" name="re_unfm" value="A">熟悉 -->
<!-- 		<input type="radio" name="re_unfm" value="B">比较熟悉 -->
<!-- 		<input type="radio" name="re_unfm" value="C">不太熟悉<br> -->
<%-- 		教育：${require.re_educate}<br> --%>
<!-- 		<input type="radio" name="re_educate" value="30">优 -->
<!-- 		<input type="radio" name="re_educate" value="20">良 -->
<!-- 		<input type="radio" name="re_educate" value="10">中 -->
<!-- 		<input type="radio" name="re_educate" value="0">差<br> -->
<%-- 		科研：${require.re_scientific}<br> --%>
<!-- 		<input type="radio" name="re_scientific" value="30">优 -->
<!-- 		<input type="radio" name="re_scientific" value="20">良 -->
<!-- 		<input type="radio" name="re_scientific" value="10">中 -->
<!-- 		<input type="radio" name="re_scientific" value="0">差<br> -->
<%-- 		师德：${require.re_morality}<br> --%>
<!-- 		<input type="radio" name="re_morality" value="30">优 -->
<!-- 		<input type="radio" name="re_morality" value="20">良 -->
<!-- 		<input type="radio" name="re_morality" value="10">中 -->
<!-- 		<input type="radio" name="re_morality" value="0">差<br> -->
<!-- 		<input type="submit" value="确定"/> -->
<!-- 	</form> -->
<!-- </center> -->
<!-- </body> -->
<!-- </html> -->