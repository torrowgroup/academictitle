<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}dist/css/wangEditor.min.css">
<link rel="stylesheet" type="text/css"
	href="${rootPath}css/manager/updateParticipator.css">
<script type="text/javascript">
	function changeSelected() {
		var maj_id = '${part.pa_majors.maj_id}'; //获得后台的要选中的值
		var un_id = '${part.pa_unit.un_id}';
		var ti_id = '${part.pa_title.ti_id}';
		var majoroptions = document.getElementById("majorid").options;
		var unitoptions = document.getElementById("unitid").options;
		var titleoptions = document.getElementById("titleid").options;
		for (i = 0; i < majoroptions.length; i++) {
			if (majoroptions[i].value == maj_id) // 根据option标签的value来进行判断  测试的代码这里是两个等号
			{
				majoroptions[i].selected = true;
			}
		}
		for (i = 0; i < unitoptions.length; i++) {
			if (unitoptions[i].value == un_id) // 根据option标签的value来进行判断  测试的代码这里是两个等号
			{
				unitoptions[i].selected = true;
			}
		}
		for (i = 0; i < titleoptions.length; i++) {
			if (titleoptions[i].value == ti_id) // 根据option标签的value来进行判断  测试的代码这里是两个等号
			{
				titleoptions[i].selected = true;
			}
		}
	}
	function modifyContent() {
		var content = document.getElementById("content");
		content.value = editor.$txt.html();
	}
</script>
</head>
<body onload="changeSelected()">
  <div class="wall">
	<form action="${rootPath}user/Participator_update?pa_id=${part.pa_id}" method="post" enctype="multipart/form-data" onsubmit="modifyContent()">
		 <label>姓名：</label><input type="text" name="pa_name" value="${part.pa_name}" required>
		 <label>邮箱：</label><input type="email" name="pa_email" value="${part.pa_email}" style="border-radius:5px;height:33px;" required>
		<label>专业： </label><select id="majorid"  name="majorid">
			<c:forEach items="${majors}" var="item">
					<option value="${item.maj_id}">${item.maj_majorName}</option>
				</c:forEach>
			</select><br> 
			<label>单位： </label><select id="unitid" name="unitid">
				<c:forEach items="${unit}" var="item">
					<option value="${item.un_id}">${item.un_unitName}</option>
				</c:forEach>
			</select>
			 <label>职称： </label><select id="titleid" name="titleid">
				<c:forEach items="${title}" var="item">
					<option value="${item.ti_id}">${item.ti_titleName}</option>
				</c:forEach>
			</select><br>
			 <label>图片： </label><input type="file" name="file" class="file"
				accept="image/*" value="选择图片"><br>
			<div class="row">
				<label style="margin-left:50%;">简介</label>
				<textarea rows="5" cols="35" name="pa_introduce"
					style="display: none;" id="content"></textarea>
				<br>
				<div id="editor" style="width: 100%; height: 400px;"></div>
				<script type="text/javascript"
					src="${rootPath}dist/js/lib/jquery-1.10.2.min.js"></script>
				<script type="text/javascript"
					src="${rootPath}dist/js/wangEditor.min.js"></script>
				<script type="text/javascript">
					var E = window.wangEditor
					var editor = new E('editor')
					editor.config.uploadImgUrl = '${rootPath}user/Participator_uploadImg'
					editor.config.uploadImgFileName = 'myFileName'
					editor.create()
					editor.$txt.html('${part.pa_introduce}')
				</script>
			</div>
			<br> <input type="submit" class="submit" value="提交">
		</form>
		<div class="scroll">
			<marquee>
				<span>温馨提示：</span>不可以上传中文名称的图片!
			</marquee>
		</div>
	</div>
</body>
</html>