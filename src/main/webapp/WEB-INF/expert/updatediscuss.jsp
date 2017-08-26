<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改评议</title>
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
			<<<a href="#" onclick="JavaScript:history.back(-1);">返回上一级</a>
		</div>
		<div class="wall">
			<div class="w-left">
				<div class="top">
					<span>简介&nbsp;<img height="15px;" width="15px;" alt=" " src="${rootPath}images/up.jpg"></span>
				</div>
				<div class="main">
					<div class="view">
						<span>参评人:</span> <i>${record.re_participator.pa_name}</i><br> <span>申报职称:</span>
						<i>${record.re_participator.pa_title.ti_titleName}</i><br> <span>专业:</span>
						<i>${record.re_participator.pa_majors.maj_majorName}</i><br> <span>单位:</span>
						<i>${record.re_participator.pa_unit.un_unitName}</i><br> <span>图片:</span>
						<i><img id="pic"
							src="${rootPath}uploadImage/${record.re_participator.pa_imageUrl}"
							alt="加载中"></i><br>
					</div>
					<div class="hidden">
						<textarea readonly="readonly" style="resize: none">${record.re_participator.pa_introduce}</textarea>
					</div>
				</div>
			</div>
			<div class="w-right">
				<form action="${rootPath}expert/ExpertDiscussAction_updateRecord" method="post">
					<input type="hidden" name="re_id" value="${record.re_id}"/>
					<span style="padding: 0">您对参评人专业熟悉程度:</span> 
					<input type="radio"	name="re_unfm" value="A" <c:if test="${record.re_unfm eq 'A'}">checked="checked"</c:if>>熟悉 
					<input type="radio"	name="re_unfm" value="B" <c:if test="${record.re_unfm eq 'Bs'}">checked="checked"</c:if>>比较熟悉 
					<input type="radio"	name="re_unfm" value="C" <c:if test="${record.re_unfm eq 'C'}">checked="checked"</c:if>>不太熟悉 <br>
					<p>
						<i>教育</i>：
						<textarea readonly="readonly">${require.re_educate}</textarea>
					</p>
					<span>教育方面：</span> 
					<input type="radio" name="re_educate" value="30" <c:if test="${record.re_educate eq '30'}">checked="checked"</c:if>>优
					<input type="radio" name="re_educate" value="20" <c:if test="${record.re_educate eq '20'}">checked="checked"</c:if>>良
					<input	type="radio" name="re_educate" value="10" <c:if test="${record.re_educate eq '10'}">checked="checked"</c:if>>中 
					<input	type="radio" name="re_educate" value="0" <c:if test="${record.re_educate eq '0'}">checked="checked"</c:if>>差
					<p>
						<i>科研</i>：
						<textarea readonly="readonly">${require.re_scientific}</textarea>
					</p>
					<span>科研方面：</span> 
					<input type="radio" name="re_scientific" value="30" <c:if test="${record.re_scientific eq '30'}">checked="checked"</c:if>>优 
					<input type="radio" name="re_scientific" value="20" <c:if test="${record.re_scientific eq '20'}">checked="checked"</c:if>>良
					<input type="radio" name="re_scientific" value="10" <c:if test="${record.re_scientific eq '10'}">checked="checked"</c:if>>中
					<input type="radio" name="re_scientific" value="0" <c:if test="${record.re_scientific eq '0'}">checked="checked"</c:if>>差 <br>
					<p>
						<i>师德</i>：
						<textarea readonly="readonly">${require.re_morality}</textarea>
					</p>
					<span>师德方面：</span> 
					<input type="radio" name="re_morality" value="30" <c:if test="${record.re_morality eq '30'}">checked="checked"</c:if>>优
					<input type="radio" name="re_morality" value="20" <c:if test="${record.re_morality eq '20'}">checked="checked"</c:if>>良
					<input type="radio" name="re_morality" value="10" <c:if test="${record.re_morality eq '10'}">checked="checked"</c:if>>中
					<input type="radio" name="re_morality" value="0" <c:if test="${record.re_morality eq '0'}">checked="checked"</c:if>>差<br>
					<input type="submit" class="btn" value="确认修改" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>