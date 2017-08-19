<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<details>
	<summary>参评</summary>
	<a href="${rootPath}expert/ExpertDiscussAction_noDiscuss" target="mainFrame">未评</a><br>
	<a href="${rootPath}expert/ExpertDiscussAction_alreadyDiscuss" target="mainFrame">已评</a>
</details>
<details>
	<summary><a href="${rootPath}expert/ExpertNotice_allNotice">查看通知</a></summary>
</details>
<details>
	<summary>个人中心</summary>
	<a href="">个人资料</a><br>
	<a href="">退出登录</a>	
</details>
<iframe id="ifr" width="1500px" height="500px" name="mainFrame"></iframe>
</body>
</html>