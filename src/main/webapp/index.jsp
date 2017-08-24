<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
       <input type="password" class="input1" placeholder="密码" name="passWord"  required="required" style="width: 296px">
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
    	<div class="forget">
     		<a href="" onclick="windowStart()" style="color:gray;">忘记密码</a>
     	</div>
   </div>
  <script type="text/javascript">
 	function windowStart() {
 		 var urlNewPage = "findback.jsp";//打开的新网页的地址是 
 		 var nameNewPage = "newWindow";//打开的新网页的名字是 newWindow
 		 var heightNewPage = "600";//打开的新网页的高度
 		 var widthNewPage = "560"; //打开的新网页的宽度
 		 var optionsForNewPage = "top=210,left=650,width=" + widthNewPage + ",height=" + heightNewPage;
 		 //打开
 		 var winObj = window.open(urlNewPage, nameNewPage, optionsForNewPage,"_self");
}
 </script>
 </body>
</html>