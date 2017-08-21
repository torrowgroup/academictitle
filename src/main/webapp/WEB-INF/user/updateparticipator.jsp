<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}dist/css/wangEditor.min.css">
<script type="text/javascript">
	function changeSelected() {
		var maj_majorName = '${part.pa_majors.maj_majorName}';	//获得后台的要选中的值
		var un_unitName = '${part.pa_unit.un_unitName}';
		var ti_titleName = '${part.pa_title.ti_titleName}';
		   var majoroptions = document.getElementById("majorid").options;
		   var unitoptions = document.getElementById("unitid").options;
		   var titleoptions = document.getElementById("titleid").options;
		   for (i=0; i<majoroptions.length; i++){
			      if (majoroptions[i].value == maj_majorName)  // 根据option标签的value来进行判断  测试的代码这里是两个等号
			      {
			    	  majoroptions[i].selected = true;
			      }
		   }
		   for (i=0; i<unitoptions.length; i++){
			      if (unitoptions[i].value == un_unitName)  // 根据option标签的value来进行判断  测试的代码这里是两个等号
			      {
			    	  unitoptions[i].selected = true;
			      }
			   }
		   for (i=0; i<titleoptions.length; i++){
			      if (titleoptions[i].value == ti_titleName)  // 根据option标签的value来进行判断  测试的代码这里是两个等号
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
<body>
	<form action="${rootPath}user/Participator_update?pa_id=${part.pa_id}" method="post" enctype="multipart/form-data" onsubmit="modifyContent()">
		姓名：<input type="text" name="pa_name" value="${part.pa_name}">
		专业：<select name="majorid"  name="majorid">
			<c:forEach items="${majors}" var="item">
					<option value="${item.maj_id}">${item.maj_majorName}</option>
			</c:forEach>
		</select><br>
		单位：<select name="unitid" name="unitid">
			<c:forEach items="${unit}" var="item">
					<option value="${item.un_id}">${item.un_unitName}</option>
			</c:forEach>
		</select>
		职称：<select name="titleid" name="titleid">
			<c:forEach items="${title}" var="item">
					<option value="${item.ti_id}">${item.ti_titleName}</option>
			</c:forEach>
		</select><br>
		<input type="file" name="file" class="file" accept="image/*" value="选择图片"><br>
			<marquee behavior="scroll">
				<p>温馨提示：不可以上传中文名称图片！</p>
			</marquee>
				<div class="row">
				<lable>简介:</lable>
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
			</div><br>
		<input type="submit" value="提交">
	</form>
</body>
</html>