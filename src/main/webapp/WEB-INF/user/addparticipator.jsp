<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addParticipator.css">
<link rel="stylesheet" type="text/css" href="${rootPath}dist/css/wangEditor.min.css">
<script type="text/javascript">
     function modifyContent() {    	
     	        var content = document.getElementById("content");   	    
     	        content.value = editor.$txt.html();
   }
</script>
</head>
<body>
<div class="wall">
        <h3>${message}</h3>
        <form action="${rootPath}user/Participator_add" method="post" enctype="multipart/form-data" onsubmit="modifyContent()">
            <label>姓名:</label>
            <input type="text" name="pa_name" required><br>
             <label>邮箱:</label>
            <input type="email" name="pa_email" style="border-radius:5px;height:33px;width:170px;" required><br>
            <label>专业:</label>
            <select name="majorid">
                <c:forEach items="${majors}" var="item">
					<option value="${item.maj_id}">${item.maj_majorName}</option>
				</c:forEach>
            </select>
            <br>
            <label>单位:</label>
            <select name="unitid">
                <c:forEach items="${unit}" var="item">
					<option value="${item.un_id}">${item.un_unitName}</option>
				</c:forEach>
            </select>
            <br>
            <label>职称:</label>
            <select name="titleid">
              	<c:forEach items="${title}" var="item">
					<option value="${item.ti_id}">${item.ti_titleName}</option>
				</c:forEach>
            </select>
            <br>
            <input type="file" name="file" class="file" accept="image/*" value="选择图片">
            <div class="suyuan" style="width: 600px; height: 310px;">
				<lable style="margin-left:0%;">简介：</lable>
				<textarea rows="5" cols="100" name="pa_introduce"
					style="display: none;" id="content"></textarea>
				<br>
				<div id="editor" style="width: 100%; height: 310px;"></div>
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
    </script>
			</div><br>
            <input class="btn" type="submit" value="提交">
        </form>
        <div class="scroll">
            <marquee><span>温馨提示：</span>不可以上传中文名称的图片!</marquee>
        </div>
    </div>
</body>
</html>