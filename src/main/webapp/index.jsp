<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职称审核系统-登录</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/login.css">
</head>
<body>
   <div class="title">河南科技学院职称评审系统</div>
   <div class="login-box">
   <form action="${rootPath}loginAction_login" method="post"> 
     <div class="box1">
       <input type="email" class="input1" placeholder="邮箱"  name="userName" required="required" style="width: 296px">
     </div>
     <div class="box2">
       <input type="text" class="input1" placeholder="密码" name="passWord"  required="required" style="width: 296px">
     </div>
     <div class="box3">
     	<div>${message}</div>
       <div class="login">
         <input type="submit" value="登录"class="btn">
       </div>
        <div class="reset">
         <input type="reset" value="重置" class="btn">
       </div>
     </div>
    </form>
   </div>
 </body>
</html>