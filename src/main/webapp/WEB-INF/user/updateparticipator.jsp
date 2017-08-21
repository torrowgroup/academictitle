<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</script>
</head>
<body>
	<form action="${rootPath}user/Participator_update?pa_id=${part.pa_id}" method="post" enctype="multipart/form-data">
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
		简介：<input name="pa_introduce" value="${part.pa_introduce}"><br>
		<input type="submit" value="提交">
	</form>
</body>
</html>