<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/updateexpert.css">
<script type="text/javascript">
	function changeSelected() {
		var maj_id = '${experts.ex_majors.maj_id}';	//获得后台的要选中的值
		var un_id = '${experts.ex_unit.un_id}';
		var ti_id = '${experts.ex_title.ti_id}';
		   var majoroptions = document.getElementById("maj_majorName").options;
		   var unitoptions = document.getElementById("un_unitName").options;
		   var titleoptions = document.getElementById("ti_titleName").options;
		   for (i=0; i<majoroptions.length; i++){
			      if (majoroptions[i].value == maj_id)  // 根据option标签的value来进行判断  测试的代码这里是两个等号
			      {
			    	  majoroptions[i].selected = true;
			      }
		   }
		   for (i=0; i<unitoptions.length; i++){
			      if (unitoptions[i].value == un_id)  // 根据option标签的value来进行判断  测试的代码这里是两个等号
			      {
			    	  unitoptions[i].selected = true;
			      }
			   }
		   for (i=0; i<titleoptions.length; i++){
			      if (titleoptions[i].value == ti_id)  // 根据option标签的value来进行判断  测试的代码这里是两个等号
			      {
			    	  titleoptions[i].selected = true;
			      }
			   }
		}
</script>
</head>
<body onload="changeSelected()">
<div class="wall">
	<form action="${rootPath}user/Expert_update?ex_id=${experts.ex_id}" method="post">
		<label>邮箱:</label><input type="email" class="a" name="ex_userName" value="${experts.ex_userName}" required><br>
		<label>密码:</label><input type="text" class="a" name="ex_password" value="${experts.ex_password}" required><br>
		<label>名字:</label><input type="text" class="a" name="ex_name" value="${experts.ex_name}" required><br>
		<label>专业:</label><select name="majorid" id="maj_majorName">
			<c:forEach items="${majors}" var="item">
					<option value="${item.maj_id}">${item.maj_majorName}</option>
			</c:forEach>
		</select><br>
		<label>职称:</label><select name="unitid" id="un_unitName">
			<c:forEach items="${unit}" var="item">
					<option value="${item.un_id}">${item.un_unitName}</option>
			</c:forEach>
		</select><br>
		<label>单位:</label><select name="titleid" id="ti_titleName">
			<c:forEach items="${title}" var="item">
					<option value="${item.ti_id}">${item.ti_titleName}</option>
			</c:forEach>
		</select><br>
		<label>学历:</label><select name="ex_education">
					<option value="本科" <c:if test='${experts.ex_education eq "本科"}'> selected="selected"</c:if>>本科</option>
					<option value="研究生" <c:if test='${experts.ex_education eq "研究生"}'> selected="selected"</c:if>>研究生</option>
					<option value="硕士" <c:if test='${experts.ex_education eq "硕士"}'> selected="selected"</c:if>>硕士</option>
					<option value="博士" <c:if test='${experts.ex_education eq "博士"}'> selected="selected"</c:if>>博士</option>
					<option value="博士后" <c:if test='${experts.ex_education eq "博士后"}'> selected="selected"</c:if>>博士后</option>
					<option value="副教授" <c:if test='${experts.ex_education eq "副教授"}'> selected="selected"</c:if>>副教授</option>
					<option value="教授" <c:if test='${experts.ex_education eq "教授"}'> selected="selected"</c:if>>教授</option>
		</select><br>
		 <input class="btn" type="submit" value="修改">
	</form>
	</div>
</body>
</html>