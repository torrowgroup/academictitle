<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评职称-登录</title>
</head>
<body>
<center>
	<form action="">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="username" id="inputText"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="text" name="password" id="inputPassword"/></td>
			</tr>
			<tr align="center"> 
				<td><input type="submit" value="登录"/></td>
				<td><input type="reset" value=“重置”/></td>
			</tr>
		</table>
	</form>
</center>
</body>
<script>
	 function $(a){
           return document.getElementById(a);
	 }
     function goout(){
	    if($('inputText').value==''){
            alert("账户不能为空");
	    }
	    if($('inputPassword').value==''){
	    	alert("密码不能为空");
	    }
    }
    function overset(){
         $('inputText').value = '';
         $('inputPassword').value='';
    }
</script>
</html>