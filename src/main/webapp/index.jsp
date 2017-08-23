<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职称审核系统-登录</title>
 <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
   <div class="title">河南科技学院职称评审系统</div>
   <div class="login-box">
   <form action="${rootPath}loginAction_login" method="post"> 
     <div class="box1">
       <input type="text" class="input1" placeholder="帐号" name="userName" id="inputText" style="width: 296px">
     </div>
     <div class="box2">
       <input type="text" class="input1" placeholder="密码" name="passWord" id="inputPassword" style="width: 296px">
     </div>
     <div class="box3">
       <div class="login">
         <input type="submit" value="登录" class="btn">
       </div>
        <div class="reset">
         <input type="reset" value="重置" class="btn">
       </div>
     </div>
    </form>
   </div>
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
 </body>
</html>