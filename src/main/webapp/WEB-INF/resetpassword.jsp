<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="${rootPath}css/bootstrap.min.css">
<link rel="stylesheet" href="${rootPath}css/animate.css">
<link rel="stylesheet" href="${rootPath}css/style.css">
<script type="text/javascript" src="${rootPath}js/forget.js"></script>
<script>
     function validate() {
        var pwd1 = document.getElementById("pwd1").value;
        var pwd2 = document.getElementById("pwd2").value;
		<!-- 对比两次输入的密码 -->
        if(pwd1 != pwd2) {
            document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
            document.getElementById("submit").disabled = true;
        } else {
        	document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
            document.getElementById("submit").disabled = false;
        }
     }
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<!-- Start Sign In Form -->
				<form action="${rootPath}loginAction_reset" class="fh5co-form animate-box" method="post">
					<h2>Forgot Password</h2>
					<div class="form-group">
						<div class="alert alert-success" role="alert">Your new
							password</div>
					</div>
					<div class="form-group">
						<label for="email" class="sr-only">Email</label> 
						<input type="text" name="passWord" class="form-control" id="pwd1" placeholder="新密码" autocomplete="off"> 
							<input type="text" class="form-control" id="pwd2" placeholder="再次输入密码" 
							autocomplete="off" onkeyup="validate()">
							<span id="tishi"></span>
					</div>
					<div class="form-group">
						<p>90秒后自动关闭界面</p>
					</div>
					<div class="form-group">
						<input type="submit" id="submit" value="确认" class="btn btn-primary">
					</div>
				</form>
				<!-- END Sign In Form -->

			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="js/main.js"></script>

</body>
</html>